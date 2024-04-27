module DataPath#(
	parameter WIDTH = 32,
	parameter ROW = 4,
	parameter COL = 4
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

	genvar i;
	generate 
		for (i = 0; i < ROW; i=i+1) begin
			fifo #(.WIDTH(WIDTH), .DEPTH(COL)) Ni(
			.rst(rst), 
			.clk(clk),
			.data_in(data_in_w),
			.write(write[i]),
			.read(read[i]),
			.data_out(inp_north[i])
			);

			fifo #(.WIDTH(WIDTH), .DEPTH(COL)) Wi(
			.rst(rst), 
			.clk(clk),
			.data_in(data_in_i),
			.write(write[i]),
			.read(read[i]),
			.data_out(inp_west[i])
			);
		end
	
	endgenerate

    systolic_array s0 (cs, inp_west[0], inp_west[1], inp_west[2], inp_west[3],
		      inp_north[0], inp_north[1], inp_north[2], inp_north[3],
		      clk, rst, done,
              result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8], 
			  result[9], result[10], result[11], result[12], result[13], result[14], result[15]);

	genvar j;
	generate
		for(j = 0; j < ROW*COL; j = j+1)begin
			assign result_out[(j+1)*WIDTH-1 : j*WIDTH] = result_in[(j+1)*WIDTH-1 : j*WIDTH] + result[j];
		end
	endgenerate
endmodule