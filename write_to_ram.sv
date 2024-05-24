// module write_to_ram #(
//     parameter ROW = 4,
//     parameter COL = 4,
//     parameter WIDTH = 32,
//     parameter ROW1 = 4,
//     parameter COL2 = 4,
//     parameter ADDR_WIDTH = 10
// )(
//     input logic clk,
//     input logic start,
//     input logic [0 : ROW*COL-1][WIDTH-1 : 0] result_wire [0 : ROW1-1][0 : COL2-1],
//     output logic [WIDTH-1:0] data_a, data_b, data_c, data_d,
//     output logic [ADDR_WIDTH-1:0] addr_a, addr_b, addr_c, addr_d,
//     output logic we_a, we_b, we_c, we_d,
//     output logic done
// );

//     // Flatten the result_wire for easier sequential access
//     logic [ROW1*COL2*ROW*COL-1:0][WIDTH-1:0] flat_result_wire;
//     initial begin
//         for (int i = 0; i < ROW1; i++) begin
//             for (int j = 0; j < COL2; j++) begin
//                 for (int k = 0; k < ROW*COL; k++) begin
//                     flat_result_wire[(i*COL2 + j)*(ROW*COL) + k] = result_wire[i][j][k];
//                 end
//             end
//         end
//     end

//     // Write logic
//     logic [ADDR_WIDTH-1:0] write_address = 0;
//     logic [15:0] write_counter = 0;
//     logic writing = 0;
    
//     always_ff @(posedge clk) begin
//         if (start && !writing) begin
//             // Start the writing process
//             writing = 1;
//             write_address = 0;
//             write_counter = 0;
//         end
        
//         if (writing) begin
//             // Write using all four ports simultaneously
//             if (write_counter < ROW1*COL2*ROW*COL) begin
//                 addr_a = write_address;
//                 addr_b = write_address + 1;
//                 addr_c = write_address + 2;
//                 addr_d = write_address + 3;

//                 data_a = flat_result_wire[write_counter];
//                 data_b = flat_result_wire[write_counter + 1];
//                 data_c = flat_result_wire[write_counter + 2];
//                 data_d = flat_result_wire[write_counter + 3];

//                 we_a = 1;
//                 we_b = (write_counter + 1 < ROW1*COL2*ROW*COL) ? 1 : 0;
//                 we_c = (write_counter + 2 < ROW1*COL2*ROW*COL) ? 1 : 0;
//                 we_d = (write_counter + 3 < ROW1*COL2*ROW*COL) ? 1 : 0;

//                 // Increment address and counter for next writes
//                 write_address = write_address + 4;
//                 write_counter = write_counter + 4;
//             end else begin
//                 we_a = 0;
//                 we_b = 0;
//                 we_c = 0;
//                 we_d = 0;
//                 writing = 0;
//                 done = 0; // Writing process completed
//             end
//         end
//     end
// endmodule

module write_to_ram #(parameter ROW = 4, COL = 4, WIDTH = 32, ROW1 = 4, COL2 = 4, ADDR_WIDTH = 10) (
    input logic clk,rst,
    input logic start,
    input logic [0 : ROW*COL-1][WIDTH-1 : 0] result_wire [0 : ROW1-1][0 : COL2-1],
    output logic [WIDTH-1:0] data_a,
    output logic [WIDTH-1:0] data_b,
    output logic [WIDTH-1:0] data_c,
    output logic [WIDTH-1:0] data_d,
    output logic [ADDR_WIDTH-1:0] addr_a,
    output logic [ADDR_WIDTH-1:0] addr_b,
    output logic [ADDR_WIDTH-1:0] addr_c,
    output logic [ADDR_WIDTH-1:0] addr_d,
    output logic we_a,
    output logic we_b,
    output logic we_c,
    output logic we_d,
    output logic done
);
    parameter END_ROW = COL2 * 4;

    typedef enum logic [1:0] {
        IDLE,
        WRITE,
        DONE
    } state_t;
    
    state_t state, next_state;
    int row1_idx, col2_idx, Row_Col_idx;

    // State transition
    always_ff @(posedge clk) begin
        if (rst) begin
            state = IDLE;
            row1_idx = 0;
            col2_idx = 0;
            Row_Col_idx = 0;
            done = 0;
        end else begin
            state = next_state;
        end
    end

    // Next state logic and output logic
    always_ff @(posedge clk, state, start) begin
        next_state <= state;
        we_a <= 0;
        we_b <= 0;
        we_c <= 0;
        we_d <= 0;
        data_a <= '0;
        data_b <= '0;
        data_c <= '0;
        data_d <= '0;
        addr_a <= '0;
        addr_b <= '0;
        addr_c <= '0;
        addr_d <= '0;
        
        case (state)
            IDLE: begin
                done <= 0;
                next_state <= (start) ? WRITE : IDLE;
            end
            
            WRITE: begin
                we_a <= 1;
                we_b <= 1;
                we_c <= 1;
                we_d <= 1;
                
                data_a <= result_wire[row1_idx][col2_idx][Row_Col_idx*4];
                data_b <= result_wire[row1_idx][col2_idx][Row_Col_idx*4+1];
                data_c <= result_wire[row1_idx][col2_idx][Row_Col_idx*4+2];
                data_d <= result_wire[row1_idx][col2_idx][Row_Col_idx*4+3];
                
                addr_a <= row1_idx*4*END_ROW + 4*col2_idx + Row_Col_idx*END_ROW;
                addr_b <= row1_idx*4*END_ROW + 4*col2_idx + Row_Col_idx*END_ROW +1;
                addr_c <= row1_idx*4*END_ROW + 4*col2_idx + Row_Col_idx*END_ROW +2;
                addr_d <= row1_idx*4*END_ROW + 4*col2_idx + Row_Col_idx*END_ROW +3;

                Row_Col_idx++;
                if (Row_Col_idx > 3) begin
                    Row_Col_idx <= 0;
                    col2_idx++;
                    next_state <= WRITE;
                end
                if (col2_idx > COL2-1) begin
                    col2_idx <= 0;
                    row1_idx++;
                    next_state <= WRITE;
                end
                if (row1_idx > ROW1-1) begin
                    row1_idx <= 0;
                    next_state <= DONE;
                end
            end

            DONE: begin
                done <= 1;
            end

        endcase
    end
endmodule