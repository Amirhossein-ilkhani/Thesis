module GMM_tb;

reg rst, clk, start;

Matrix_Multiplier #(.WIDTH(32), .HEIGHT(48),.ROW(4), .COL(4)) uut(
	.rst(rst), 
	.clk(clk),
	.start(start)
	);
	
initial begin
	#50 
	start = 1;
	#10
	start = 0;
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