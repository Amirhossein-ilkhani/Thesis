module Main_tb;

reg rst, clk;

Main_DP
	uut(
	.rst(rst), 
	.clk(clk)
	);
	
// initial begin
// 	Data_in_a = 0;
// 	Data_in_b = 0;
// 	en = 0;
// 	grant_in = 0;
// 	grant_w = 0;
// 	#50 
// 	en = 1;
// 	#40
// 	grant_in = 1;
// 	#50 
// 	grant_w = 1;
// end

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