module Main#(
	parameter WIDTH = 32,
	parameter ROW1 = 64,
	parameter COL1 = 64,
    parameter ROW2 = 64,
	parameter COL2 = 64,
    parameter ROW_PE = 4,
	parameter COL_PE = 4
	)(
	input clk,rst,
	input Start, 
	input [WIDTH-1 : 0] data_in_b, data_in_a,
    output MemAdd_a, MemAdd_b,
    output memw_a, memw_b,
	output done
	);

	// wires and registers
    // reg start [0 : COL2-1][0 : COL1-1];
	reg start,
    reg w_a [0 : ROW1-1][0 : COL2-1][0 : COL1-1];
    reg w_b [0 : COL2-1][0 : COL1-1];
	wire [ROW_PE*COL_PE*WIDTH-1 : 0] result_wire [0 : ROW1-1][0 : COL2-1][0 : COL1];


//-----------------------------------------DATA_PATHS---------------------------------------
	// initialize the resultss
	genvar z;
	genvar l;
	generate
		for(z = 0; z < ROW1; z = z + 1)begin
			for(l = 0; z < COL2; l = l + 1)begin
				assign result_wire[z][l][0] = 0;
			end
		end
	endgenerate

	// PEs
	genvar i;
	genvar j;
	genvar k;
	generate 
		for (i = 0; i < ROW1; i=i+1) begin
			for (j = 0; j < COL2; j=j+1) begin
				for (k = 0; k < COL1; k=k+1) begin
					Matrix_Multiplier(
						.clk(clk),
						.rst(rst),
						.start(start),
						.w_a(w_a[i][j][k]),
						.w_b(w_b[j][k]),
						.Data_in_a(data_in_a),
						.Data_in_b(data_in_b),
						.Addr_in_a(),
						.Addr_in_b(),
						.result_in(result_wire[i][j][k]),
						.result_out(result_wire[i][j][k+1]),
						.Done()
					);
				end
			end
		end
	endgenerate

//-----------------------------------------Controller---------------------------------------





endmodule