module Counter #(parameter BIT)(clk, rst, en, count, co);
  input clk,rst, en;
  output reg [BIT-1:0] count;
  output co;
  always @(posedge clk,posedge rst)begin
      if(rst)
        count <= 8'b0;
      else if (en)
        count <= count + 1;
  end
  assign co = &(count);
 endmodule


//----------------------------------------------------------------  
 module fifo #(
    parameter WIDTH = 16,
    parameter DEPTH = 4
)(
    input wire rst,clk,
    input [WIDTH-1:0] data_in,
    input wire write,
    input wire read,
    output reg [WIDTH-1:0] data_out,
    output wire fifo_full,
    output wire fifo_empty,
    output wire fifo_not_empty,
    output wire fifo_not_full
);

    // memory will contain the FIFO data. 
    reg [WIDTH-1:0] memory [0:DEPTH-1];
    // $clog2(DEPTH+1)-2 to count from 0 to DEPTH
    reg [$clog2(DEPTH)-1:0] write_ptr;
    reg [$clog2(DEPTH)-1:0] read_ptr;

    // Initialization
    initial begin
    
        // Init both write_cnt and read_cnt to 0
        write_ptr = 0;
        read_ptr = 0;

        // Display error if WIDTH is 0 or less.
        if ( WIDTH <= 0 ) begin
            $error("%m ** Illegal condition **, you used %d WIDTH", WIDTH);
        end
        // Display error if DEPTH is 0 or less.
        if ( DEPTH <= 0) begin
            $error("%m ** Illegal condition **, you used %d DEPTH", DEPTH);
        end

    end // end of initial

    assign fifo_empty   = ( write_ptr == read_ptr) ? 1'b1 : 1'b0;
    assign fifo_full    = ( write_ptr == (DEPTH-1)) ? 1'b1 : 1'b0;
    assign fifo_not_empty = ~fifo_empty;
    assign fifo_not_full = ~fifo_full;

    integer i=0;
    always @ (posedge clk or posedge rst) begin
        if(rst) begin
            write_ptr = 0;
            read_ptr = 0;
            data_out <= 0;
            for(i=0; i <= WIDTH; i = i + 1) begin
                memory[i] <= 0;
            end
        end
        else begin
            if ( write ) begin
                memory[write_ptr] <= data_in;
            end

            if ( read ) begin
                data_out <= memory[read_ptr];
                memory[read_ptr] <= 0;
            end
        end
    end

    always @ ( posedge clk ) begin
        if ( write ) begin
            write_ptr <= write_ptr + 1;
        end

        if ( read) begin
            read_ptr <= read_ptr + 1;
        end
    end

endmodule
//----------------------------------------------------------------
module PE(cs, inp_north, inp_west, clk, rst, outp_south, outp_east, result);
	input cs;
	input [31:0] inp_north, inp_west;
	output reg [31:0] outp_south, outp_east;
	input clk, rst;
	output reg [63:0] result;
	wire [63:0] multi;
	always @(posedge rst or posedge clk) begin
		if(rst) begin
			result <= 0;
			outp_east <= 0;
			outp_south <= 0;
		end
		else if (cs == 1 )begin
			result <= result + multi;
			outp_east <= inp_west;
			outp_south <= inp_north;
		end
	end
	assign multi = inp_north*inp_west;
endmodule
//----------------------------------------------------------------
module systolic_array(
	cs,
	inp_west0, inp_west4, inp_west8, inp_west12,
	inp_north0, inp_north1, inp_north2, inp_north3,
	clk, rst, done,
	result0, result1, result2, result3, result4, result5, result6, result7, result8, result9, result10, result11, result12, result13, result14, result15);
	
	input cs;
	input [31:0] inp_west0, inp_west4, inp_west8, inp_west12,
		      inp_north0, inp_north1, inp_north2, inp_north3;
	output reg done;
	input clk, rst;
	output [63:0] result0, result1, result2, result3, result4, result5, result6, result7, result8, result9, result10, result11, result12, result13, result14, result15;
	
    reg [3:0] count;
	
	wire [31:0] inp_north0, inp_north1, inp_north2, inp_north3;
	wire [31:0] inp_west0, inp_west4, inp_west8, inp_west12;
	wire [31:0] outp_south0, outp_south1, outp_south2, outp_south3, outp_south4, outp_south5, outp_south6, outp_south7, outp_south8, outp_south9, outp_south10, outp_south11, outp_south12, outp_south13, outp_south14, outp_south15;
	wire [31:0] outp_east0, outp_east1, outp_east2, outp_east3, outp_east4, outp_east5, outp_east6, outp_east7, outp_east8, outp_east9, outp_east10, outp_east11, outp_east12, outp_east13, outp_east14, outp_east15;

	
	//from north and west
	PE P0 (cs, inp_north0, inp_west0, clk, rst, outp_south0, outp_east0, result0);
	//from north
	PE P1 (cs, inp_north1, outp_east0, clk, rst, outp_south1, outp_east1, result1);
	PE P2 (cs, inp_north2, outp_east1, clk, rst, outp_south2, outp_east2, result2);
	PE P3 (cs, inp_north3, outp_east2, clk, rst, outp_south3, outp_east3, result3);
	
	//from west
	PE P4 (cs, outp_south0, inp_west4, clk, rst, outp_south4, outp_east4, result4);
	PE P8 (cs, outp_south4, inp_west8, clk, rst, outp_south8, outp_east8, result8);
	PE P12 (cs, outp_south8, inp_west12, clk, rst, outp_south12, outp_east12, result12);
	
	//no direct inputs
	//second row
	PE P5 (cs, outp_south1, outp_east4, clk, rst, outp_south5, outp_east5, result5);
	PE P6 (cs, outp_south2, outp_east5, clk, rst, outp_south6, outp_east6, result6);
	PE P7 (cs, outp_south3, outp_east6, clk, rst, outp_south7, outp_east7, result7);
	//third row
	PE P9 (cs, outp_south5, outp_east8, clk, rst, outp_south9, outp_east9, result9);
	PE P10 (cs, outp_south6, outp_east9, clk, rst, outp_south10, outp_east10, result10);
	PE P11 (cs, outp_south7, outp_east10, clk, rst, outp_south11, outp_east11, result11);
	//fourth row
	PE P13 (cs, outp_south9, outp_east12, clk, rst, outp_south13, outp_east13, result13);
	PE P14 (cs, outp_south10, outp_east13, clk, rst, outp_south14, outp_east14, result14);
	PE P15 (cs, outp_south11, outp_east14, clk, rst, outp_south15, outp_east15, result15);
	

    
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			done <= 0;
			count <= 0;
		end
		else if (cs == 1) begin
			if(count == 9) begin
				done <= 1;
				count <= 0;
			end
			else begin
				done <= 0;
				count <= count + 1;
			end
		end	
	end 
endmodule
//----------------------------------------------------------------
// module MUX #(
//     WIDTH = 8,
//     N = 4
// )(
//     input [WIDTH-1:0] in_i [0 : N-1],
//     input [WIDTH-1:0] in_j [0 : N-1],
//     input [WIDTH-1:0] in_k [0 : N-1],
//     input [$clog2(N)-1:0] Sel,
//     output [WIDTH-1:0] o_i,
//     output [WIDTH-1:0] o_j,
//     output [WIDTH-1:0] o_k,
// )

//     assign o_i = in_i[Sel];
//     assign o_j = in_j[Sel];
//     assign o_k = in_k[Sel];

// endmodule
		      