module Main_DP#(
	parameter WIDTH = 32,
	parameter HEIGHT_IN = 32,
	parameter HEIGHT_W = 32,
	parameter ROW1 = 2, //i
	parameter COL1 = 3, //K
    parameter ROW2 = 3, //k
	parameter COL2 = 5, //j
    parameter ROW_PE = 4,
	parameter COL_PE = 4
	)(
	input clk,rst,
	input Start, 
	output done
	);
//-----------------------------------------Wires and Registers---------------------------------------
	parameter NumOfReq_input = ((ROW1 * COL1)/4) +1
	parameter NumOfReq_weight = ((COL1 * COL2)/4) +1


	reg start,
    reg w_a [0 : ROW1-1][0 : COL2-1][0 : COL1-1];
    reg w_b [0 : COL2-1][0 : COL1-1];
	wire [ROW_PE*COL_PE*WIDTH-1 : 0] result_wire [0 : ROW1-1][0 : COL2-1][0 : COL1];
	wire [WIDTH-1 : 0] Data_in [0 : 3];
	wire [WIDTH-1 : 0] Data_w [0 : 3];

	wire req_in [0 : 3][0 : COL2-1][0 : NumOfReq_input-1];
	wire req_w [0 : 3][0 : ROW1-1][0 : NumOfReq_weight-1];
	wire grant_in [0 : 3][0 : NumOfReq_input-1];
	wire grant_w [0 : 3][0 : NumOfReq_weight-1];

	wire [$clog2(NumOfReq_input) : 0] selects_in [0 : 3];
	wire [$clog2(NumOfReq_weight) : 0] selects_w [0 : 3];

	wire i_index [ROW1][COL2][COL1];//[i][j][k]
	wire j_index [ROW1][COL2][COL1];//[i][j][k]
	wire k_index [ROW1][COL2][COL1];//[i][j][k]
	wire [7 : 0] i_index_in [0:3][0:NumOfReq_input-1];
	wire [7 : 0] j_index_in [0:3][0:NumOfReq_input-1];
	wire [7 : 0] K_index_in [0:3][0:NumOfReq_input-1];
	wire [7 : 0] i_index_w [0:3][0:NumOfReq_input-1];
	wire [7 : 0] j_index_w [0:3][0:NumOfReq_input-1];
	wire [7 : 0] K_index_w [0:3][0:NumOfReq_input-1];

	wire [7:0] o_i_in [0:3];
	wire [7:0] o_j_in [0:3];
	wire [7:0] o_k_in [0:3];
	wire [7:0] o_i_w [0:3];
	wire [7:0] o_j_w [0:3];
	wire [7:0] o_k_w [0:3];

	wire [$clog2(HEIGHT_IN)-1:0] Addr_GBF_in [0:3];
	wire [$clog2(HEIGHT_W)-1:0] Addr_GBF_w [0:3];

//-----------------------------------------PE---------------------------------------
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
					Matrix_Multiplier #(
						.WIDTH(WIDTH),
						.HEIGHT(ROW_PE*COL_PE*2),
						.i_index(i),
						.j_index(j),
						.k_index(k)
						) u_i(
						.clk(clk),
						.rst(rst),
						.en(1),
						.grant_in(grant_in[((i*COL1)+k)%4][((i*COL1)+k)/4]),
						.grant_w(grant_w[((k*COL2)+j)%4][((k*COL2)+j)/4]),
						.Data_in_a(Data_in[((i*COL1)+k)%4]),
						.Data_in_b(Data_w[((k*COL2)+j)%4]),
						.result_in(result_wire[i][j][k]),
						.result_out(result_wire[i][j][k+1]),
						.req_in(req_in[((i*COL1)+k)%4][j][((i*COL1)+k)/4]),
						.req_w(req_w[((k*COL2)+j)%4][i][((k*COL2)+j)/4]),
						.i(i_index[i][j][k]),
						.j(j_index[i][j][k]),  
						.k(k_index[i][j][k]),
						
						.Done()
					);

					i_index_in[((i*COL1)+k)%4][((i*COL1)+k)/4] = x;
					j_index_in[((i*COL1)+k)%4][((i*COL1)+k)/4] = ;
					k_index_in[((i*COL1)+k)%4][((i*COL1)+k)/4] = ;
					i_index_w[((k*COL2)+j)%4][((k*COL2)+j)/4] = x;
					i_index_w[((k*COL2)+j)%4][((k*COL2)+j)/4] = ;
					i_index_w[((k*COL2)+j)%4][((k*COL2)+j)/4] = ;

				end
			end
		end
	endgenerate
	
//-----------------------------------------GBF---------------------------------------
	Quad_Port_Ram #(.WIDTH(WIDTH), .HEIGHT(HEIGHT_IN)) GBF_in(
        .clk(clk),
        .addr_a(),
        .addr_b(),
        .addr_c(),
        .addr_d(),
        .q_a(Data_in[0]),
        .q_b(Data_in[1]),
        .q_c(Data_in[2]),
        .q_d(Data_in[3])
    );

	Quad_Port_Ram #(.WIDTH(WIDTH), .HEIGHT(HEIGHT_W)) GBF_w(
        .clk(clk),
        .addr_a(),
        .addr_b(),
        .addr_c(),
        .addr_d(),
        .q_a(Data_w[0]),
        .q_b(Data_w[1]),
        .q_c(Data_w[2]),
        .q_d(Data_w[3])
    );
//-----------------------------------------BUS_in---------------------------------------

	Arbiter #(.NumRequests(NumOfReq_input)) Arbiter_in_0 (
		.request(req_in[0][0]),
		.grant(grant_in[0]),
		.select(selects_in[0])
	);

	MUX #(.N(NumOfReq_input)) mux_in_0 (
		.in_i(i_index_in[0]),
		.in_j(j_index_in[0]),
		.in_k(K_index_in[0]),
		.Sel(selects_in[0]),
		.o_i(o_i_in[0]),
		.o_j(o_j_in[0]),
		.o_k(o_k_in[0])
	);


//-----------------------------------------Scheduler---------------------------------





endmodule