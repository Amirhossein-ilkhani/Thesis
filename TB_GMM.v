module GMM_tb;

reg rst, clk, en, grant_in, grant_w;
reg [15:0] Data_in_a,Data_in_b;
wire req_in, req_w; 

Matrix_Multiplier #(
	.WIDTH(16), 
	.HEIGHT(32),
	.ROW(4), 
	.COL(4),
	.i_index(0),
	.j_index(0),
	.k_index(1)) 
	uut(
	.rst(rst), 
	.clk(clk),
	.en(en),
	.grant_in(grant_in),
	.grant_w(grant_w),
	.Data_in_a(Data_in_a),
	.Data_in_b(Data_in_b),
	.req_in(req_in),
	.req_w(req_w)
	);
	
initial begin
	Data_in_a = 0;
	Data_in_b = 0;
	en = 0;
	grant_in = 0;
	grant_w = 0;
	#50 
	en = 1;
	#40
	grant_in = 1;
	#50 
	grant_w = 1;
end

initial begin
rst = 0;
#3
rst <= 1;
clk <= 0;
#3
rst <= 0;
end

initial begin
	repeat(500)
		#5 clk <= ~clk;
end

endmodule