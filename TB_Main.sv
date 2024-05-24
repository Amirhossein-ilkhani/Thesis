module Main_tb;
	parameter WIDTH = 32;
	parameter ROW1 = 2; //i
	parameter COL1 = 3; //K
	parameter ROW2 = 3; //k
	parameter COL2 = 5; //j
	parameter HEIGHT_IN = 96;
	parameter HEIGHT_W = 240;
	parameter HEIGHT_O = 160;
	parameter ROW_PE = 4;
	parameter COL_PE = 4;

	logic rst, clk;
	logic en [0:ROW1-1][0:COL2-1][0:ROW2-1]; 
	logic [WIDTH-1 : 0] Data_o [0 : 3];
	logic [$clog2(HEIGHT_IN)-1:0] Addr_GBF_in [0:3];
	logic [$clog2(HEIGHT_W)-1:0] Addr_GBF_w [0:3];
	logic [$clog2(HEIGHT_O)-1:0] Addr_GBF_o [0:3];
	logic [WIDTH-1 : 0] Data_in [0 : 3];
	logic [WIDTH-1 : 0] Data_w [0 : 3];
	logic we_o [0: 3];
	logic done;

	Main_DP #(
		.WIDTH(WIDTH),
		.ROW1(ROW1),
		.COL1(COL1), 
		.ROW2(ROW2), 
		.COL2(COL2), 
		.HEIGHT_IN(HEIGHT_IN),
		.HEIGHT_W(HEIGHT_W),
		.HEIGHT_O(HEIGHT_O),
		.ROW_PE(ROW_PE),
		.COL_PE(COL_PE)
		)
		uut(
		.rst(rst), 
		.clk(clk),
		.en(en), 
		.Data_o(Data_o),
		.Addr_GBF_in(Addr_GBF_in),
		.Addr_GBF_w(Addr_GBF_w),
		.Addr_GBF_o(Addr_GBF_o),
		.Data_in(Data_in),
		.Data_w(Data_w),
		.we_o(we_o),
		.done(done)
		);
		
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

	Quad_Port_Ram #(.WIDTH(WIDTH), .HEIGHT(HEIGHT_O)) GBF_o(
        .clk(clk),
        .addr_a(Addr_GBF_o[0]),
        .addr_b(Addr_GBF_o[1]),
        .addr_c(Addr_GBF_o[2]),
        .addr_d(Addr_GBF_o[3]),
        .data_a(Data_o[0]),
        .data_b(Data_o[1]),
        .data_c(Data_o[2]),
        .data_d(Data_o[3]),
		.we_a(we_o[0]),
		.we_b(we_o[1]),
		.we_c(we_o[2]),
		.we_d(we_o[3])
    );


	initial begin
		clk =0;
		rst = 0;
		GBF_in.init_ram_from_file("memoryGBF_in.mem");
		GBF_w.init_ram_from_file("memoryGBF_w.mem");
		#10
		for (int i = 0; i < ROW1; i++) begin
            for (int j = 0; j < COL2; j++) begin
                for (int k = 0; k < COL1; k++) begin
                    en[i][j][k] = 1;
                end
            end
        end

	end


	initial begin
		#3
		rst <= 1;
		#3
		rst <= 0;
		@(posedge done);
		GBF_o.write_ram_to_file("memoryGBF_o.mem");
		$stop();

	end

	initial begin
		repeat(500)
			#5 clk <= ~clk;
	end



endmodule