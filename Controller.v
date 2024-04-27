module Controller #(
	parameter ADD_WIDTH = 6,
	parameter ROW = 4,
	parameter COL = 4
	)(
	input clk,rst,
    input start,
    // to/from datapath
    input done,  
	output reg cs,
	output reg [ROW-1 : 0] read_fifo, write_fifo,
    output reg s,
	// to ram
    output [ADD_WIDTH : 0] add_a, add_b,
    output w_b
	);

    reg [3:0] ns, ps;
    reg en_add, en_wf;
    wire [3:0] cnt_add;
    wire [1:0] cnt_wf;
    wire co_add, co_wf;
    reg rst_add, rst_wf;
    
    
    Counter #(4) counter_add (.clk(clk), .rst(rst_add), .en(en_add), .count(cnt_add), .co(co_add));
    Counter #(2) cntounter_wf (.clk(clk), .rst(rst_wf), .en(en_wf), .count(cnt_wf), .co(co_wf));
    assign add_a = cnt_add;
    assign add_b = cnt_add + 16;
    

    always @(ps, start, co_wf, done) begin
    case(ps)
        0: ns = (start) ? 1 : 0;
        1: ns = (co_wf) ? 2 : 1;
        2: ns = (co_wf) ? 3 : 2;
        3: ns = (co_wf) ? 4 : 3;  
        4: ns = (co_wf) ? 5 : 4;
        5: ns = 6;
        6: ns = 7;
        7: ns = 8;
        8: ns = 9;
        9: ns = 10;
        10: ns = 11;
        11: ns = 12;
        12: ns = (done) ? 0 : 12;
    endcase  
    end

    always @(ps, start, co_wf) begin 
    en_add = 0; en_wf = 0; rst_add = 0; rst_wf = 0; write_fifo = 4'b0000; read_fifo = 4'b0000; cs = 0, s=0;
    case(ps)
        0:  begin 
            rst_add = 1;
            rst_wf = 1;
        end        
        1:  begin
            s = 1; 
            en_add = 1;
            en_wf = 1;
            write_fifo = 4'b0001;
        end
        2:  begin
            s = 1; 
            en_add = 1;
            en_wf = 1;
            write_fifo = 4'b0010;
        end
        3:  begin
            s = 1; 
            en_add = 1;
            en_wf = 1;
            write_fifo = 4'b0100;
        end
        4:  begin 
            s = 1;
            en_add = 1;
            en_wf = 1;
            write_fifo = 4'b1000;
        end
        5:  begin
            s = 1;
            cs = 1;
            read_fifo = 4'b0001;
        end 
        6:  begin
            s = 1;
            cs = 1;
            read_fifo = 4'b0011;
        end
        7:  begin
            s = 1;
            cs = 1;
            read_fifo = 4'b0111;
        end
        8:  begin
            s = 1;
            cs = 1;
            read_fifo = 4'b1111;
        end
        9:  begin
            s = 1;
            cs = 1;
            read_fifo = 4'b1111;
        end
        10:  begin
            s = 1;
            cs = 1;
            read_fifo = 4'b1111;
        end
        11:  begin
            s = 1;
            cs = 1;
            read_fifo = 4'b1111;
        end
        12: begin
            s = 1;
            cs = 1;
        end
    endcase
    end

    always @(posedge clk, posedge rst) begin
    if(rst) begin
        ps <= 0;
        ns <= 0;
    end
    else
        ps <= ns;
    end


endmodule;