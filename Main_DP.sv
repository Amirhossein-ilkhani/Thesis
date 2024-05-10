module Main_DP#(
	parameter WIDTH = 32,
	parameter ROW1 = 2, //i
	parameter COL1 = 3, //K
    parameter ROW2 = 3, //k
	parameter COL2 = 5, //j
	parameter HEIGHT_IN = 32,
	parameter HEIGHT_W = 32,
    parameter ROW_PE = 4,
	parameter COL_PE = 4
	)(
	input clk,rst,
	input Start, 
	output done
	);
//-----------------------------------------Wires and Registers---------------------------------------
	parameter NumOfReq_input = ((ROW1 * COL1)/4) +1;
	parameter NumOfReq_weight = ((COL1 * COL2)/4) +1;

	reg start;
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

	wire [7 : 0] i_index [ROW1][COL2][COL1];//[i][j][k]
	wire [7 : 0] j_index [ROW1][COL2][COL1];//[i][j][k]
	wire [7 : 0] k_index [ROW1][COL2][COL1];//[i][j][k]
	
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

	wire en_add_gen_in [0:3];
	wire en_add_gen_w [0:3];

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

					assign i_index_in[((i*COL1)+k)%4][((i*COL1)+k)/4] = i_index[i][j][k];
					assign j_index_in[((i*COL1)+k)%4][((i*COL1)+k)/4] = j_index[i][j][k];
					assign K_index_in[((i*COL1)+k)%4][((i*COL1)+k)/4] = k_index[i][j][k];
					assign i_index_w[((k*COL2)+j)%4][((k*COL2)+j)/4] = i_index[i][j][k];
					assign j_index_w[((k*COL2)+j)%4][((k*COL2)+j)/4] = j_index[i][j][k];
					assign K_index_w[((k*COL2)+j)%4][((k*COL2)+j)/4] = k_index[i][j][k];

				end
			end
		end
	endgenerate
	
//-----------------------------------------GBF---------------------------------------
	Quad_Port_Ram #(.WIDTH(WIDTH), .HEIGHT(HEIGHT_IN)) GBF_in(
        .clk(clk),
        .addr_a(Addr_GBF_in[0]),
        .addr_b(Addr_GBF_in[1]),
        .addr_c(Addr_GBF_in[2]),
        .addr_d(Addr_GBF_in[3]),
        .q_a(Data_in[0]),
        .q_b(Data_in[1]),
        .q_c(Data_in[2]),
        .q_d(Data_in[3])
    );

	Quad_Port_Ram #(.WIDTH(WIDTH), .HEIGHT(HEIGHT_W)) GBF_w(
        .clk(clk),
        .addr_a(Addr_GBF_w[0]),
        .addr_b(Addr_GBF_w[1]),
        .addr_c(Addr_GBF_w[2]),
        .addr_d(Addr_GBF_w[3]),
        .q_a(Data_w[0]),
        .q_b(Data_w[1]),
        .q_c(Data_w[2]),
        .q_d(Data_w[3])
    );
//-----------------------------------------BUS_in---------------------------------------

	// --------------------section 0--------------------------
	Arbiter #(.NumRequests(NumOfReq_input)) Arbiter_in_0 (
		.request(req_in[0][0]),
		.grant(grant_in[0]),
		.select(selects_in[0]),
		.en_add_gen(en_add_gen_in[0])
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
	Generator_Addr_in #(.END_ROW(ROW_PE*COL1), .HEIGHT(HEIGHT_IN)) generator_in_0(
		.clk(clk),
		.rst(rst),
		.en(en_add_gen_in[0]),
		.i(o_i_in[0]),
		.j(o_j_in[0]),
		.k(o_k_in[0]),
		.Addr(Addr_GBF_in[0])
	);

	// --------------------section 1--------------------------
	Arbiter #(.NumRequests(NumOfReq_input)) Arbiter_in_1 (
		.request(req_in[1][0]),
		.grant(grant_in[1]),
		.select(selects_in[1]),
		.en_add_gen(en_add_gen_in[1])
	);
	MUX #(.N(NumOfReq_input)) mux_in_1 (
		.in_i(i_index_in[1]),
		.in_j(j_index_in[1]),
		.in_k(K_index_in[1]),
		.Sel(selects_in[1]),
		.o_i(o_i_in[1]),
		.o_j(o_j_in[1]),
		.o_k(o_k_in[1])
	);
	Generator_Addr_in #(.END_ROW(ROW_PE*COL1), .HEIGHT(HEIGHT_IN)) generator_in_1(
		.clk(clk),
		.rst(rst),
		.en(en_add_gen_in[1]),
		.i(o_i_in[1]),
		.j(o_j_in[1]),
		.k(o_k_in[1]),
		.Addr(Addr_GBF_in[1])
	);
	// --------------------section 2--------------------------
	Arbiter #(.NumRequests(NumOfReq_input)) Arbiter_in_2 (
		.request(req_in[2][0]),
		.grant(grant_in[2]),
		.select(selects_in[2]),
		.en_add_gen(en_add_gen_in[2])
	);
	MUX #(.N(NumOfReq_input)) mux_in_2 (
		.in_i(i_index_in[2]),
		.in_j(j_index_in[2]),
		.in_k(K_index_in[2]),
		.Sel(selects_in[2]),
		.o_i(o_i_in[2]),
		.o_j(o_j_in[2]),
		.o_k(o_k_in[2])
	);
	Generator_Addr_in #(.END_ROW(ROW_PE*COL1), .HEIGHT(HEIGHT_IN)) generator_in_2(
		.clk(clk),
		.rst(rst),
		.en(en_add_gen_in[2]),
		.i(o_i_in[2]),
		.j(o_j_in[2]),
		.k(o_k_in[2]),
		.Addr(Addr_GBF_in[2])
	);

	// --------------------section 3--------------------------
	Arbiter #(.NumRequests(NumOfReq_input)) Arbiter_in_3 (
		.request(req_in[3][0]),
		.grant(grant_in[3]),
		.select(selects_in[3]),
		.en_add_gen(en_add_gen_in[3])
	);
	MUX #(.N(NumOfReq_input)) mux_in_3 (
		.in_i(i_index_in[3]),
		.in_j(j_index_in[3]),
		.in_k(K_index_in[3]),
		.Sel(selects_in[3]),
		.o_i(o_i_in[3]),
		.o_j(o_j_in[3]),
		.o_k(o_k_in[3])
	);
	Generator_Addr_in #(.END_ROW(ROW_PE*COL1), .HEIGHT(HEIGHT_IN)) generator_in_3(
		.clk(clk),
		.rst(rst),
		.en(en_add_gen_in[3]),
		.i(o_i_in[3]),
		.j(o_j_in[3]),
		.k(o_k_in[3]),
		.Addr(Addr_GBF_in[3])
	);



//-----------------------------------------BUS_W---------------------------------------

	// --------------------section_w 0--------------------------
	Arbiter #(.NumRequests(NumOfReq_weight)) Arbiter_w_0 (
		.request(req_w[0][0]),
		.grant(grant_w[0]),
		.select(selects_w[0]),
		.en_add_gen(en_add_gen_w[0])
	);
	MUX #(.N(NumOfReq_weight)) mux_w_0 (
		.in_i(i_index_w[0]),
		.in_j(j_index_w[0]),
		.in_k(K_index_w[0]),
		.Sel(selects_w[0]),
		.o_i(o_i_w[0]),
		.o_j(o_j_w[0]),
		.o_k(o_k_w[0])
	);
	Generator_Addr_w #(.END_ROW(ROW_PE*COL1), .HEIGHT(HEIGHT_W)) generator_w_0(
		.clk(clk),
		.rst(rst),
		.en(en_add_gen_w[0]),
		.i(o_i_w[0]),
		.j(o_j_w[0]),
		.k(o_k_w[0]),
		.Addr(Addr_GBF_w[0])
	);

	// --------------------section_w 1--------------------------
	Arbiter #(.NumRequests(NumOfReq_weight)) Arbiter_w_1 (
		.request(req_w[1][0]),
		.grant(grant_w[1]),
		.select(selects_w[1]),
		.en_add_gen(en_add_gen_w[1])
	);
	MUX #(.N(NumOfReq_weight)) mux_w_1 (
		.in_i(i_index_w[1]),
		.in_j(j_index_w[1]),
		.in_k(K_index_w[1]),
		.Sel(selects_w[1]),
		.o_i(o_i_w[1]),
		.o_j(o_j_w[1]),
		.o_k(o_k_w[1])
	);
	Generator_Addr_w #(.END_ROW(ROW_PE*COL1), .HEIGHT(HEIGHT_W)) generator_w_1(
		.clk(clk),
		.rst(rst),
		.en(en_add_gen_w[1]),
		.i(o_i_w[1]),
		.j(o_j_w[1]),
		.k(o_k_w[1]),
		.Addr(Addr_GBF_w[1])
	);
	// --------------------section_w 2--------------------------
	Arbiter #(.NumRequests(NumOfReq_weight)) Arbiter_w_2 (
		.request(req_w[2][0]),
		.grant(grant_w[2]),
		.select(selects_w[2]),
		.en_add_gen(en_add_gen_w[2])
	);
	MUX #(.N(NumOfReq_weight)) mux_w_2 (
		.in_i(i_index_w[2]),
		.in_j(j_index_w[2]),
		.in_k(K_index_w[2]),
		.Sel(selects_w[2]),
		.o_i(o_i_w[2]),
		.o_j(o_j_w[2]),
		.o_k(o_k_w[2])
	);
	Generator_Addr_w #(.END_ROW(ROW_PE*COL1), .HEIGHT(HEIGHT_W)) generator_w_2(
		.clk(clk),
		.rst(rst),
		.en(en_add_gen_w[2]),
		.i(o_i_w[2]),
		.j(o_j_w[2]),
		.k(o_k_w[2]),
		.Addr(Addr_GBF_w[2])
	);

	// --------------------section_w 3--------------------------
	Arbiter #(.NumRequests(NumOfReq_weight)) Arbiter_w_3 (
		.request(req_w[3][0]),
		.grant(grant_w[3]),
		.select(selects_w[3]),
		.en_add_gen(en_add_gen_w[3])
	);
	MUX #(.N(NumOfReq_weight)) mux_w_3 (
		.in_i(i_index_w[3]),
		.in_j(j_index_w[3]),
		.in_k(K_index_w[3]),
		.Sel(selects_w[3]),
		.o_i(o_i_w[3]),
		.o_j(o_j_w[3]),
		.o_k(o_k_w[3])
	);
	Generator_Addr_w #(.END_ROW(ROW_PE*COL1), .HEIGHT(HEIGHT_W)) generator_w_3(
		.clk(clk),
		.rst(rst),
		.en(en_add_gen_w[3]),
		.i(o_i_w[3]),
		.j(o_j_w[3]),
		.k(o_k_w[3]),
		.Addr(Addr_GBF_w[3])
	);

//-----------------------------------------Scheduler---------------------------------




endmodule