module DataPath#(
	parameter ROW = 4,
	parameter COL = 4,
    
	)(
	input clk,rst, 
	input cs,
	input [ROW-1 : 0] read, write,
	input [WIDTH-1 : 0] data_in_w, data_in_i,
	input [ROW*COL*WIDTH-1 : 0] result_in,
	output [ROW*COL*WIDTH-1 : 0] result_out,
	output done
	);

	wire [WIDTH-1 : 0] inp_west [0 : COL-1];
	wire [WIDTH-1 : 0] inp_north [0 : ROW-1];
	wire [2*WIDTH-1 : 0] result [0 : ROW*COL-1];

endmodule