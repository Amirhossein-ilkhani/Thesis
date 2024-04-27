module sys_array_tb;

reg rst, clk;

reg [31:0] inp_west0, inp_west1, inp_west2, inp_west3, inp_north0, inp_north1, inp_north2, inp_north3;
wire [63:0] result0, result1, result2, result3, result4, result5, result6, result7, result8, result9, result10, result11, result12, result13, result14, result15;
wire done;

systolic_array uut(inp_west0, inp_west1, inp_west2, inp_west3,
		      inp_north0, inp_north1, inp_north2, inp_north3,
		      clk, rst, done,
              result0, result1, result2, result3, result4, result5, result6, result7, result8, result9, result10, result11, result12, result13, result14, result15);


initial begin
	#3  inp_west0 <= 32'd3;
	    inp_north0 <= 32'd12;
	#10 inp_west0 <= 32'd2;
	    inp_north0 <= 32'd8;
	#10 inp_west0 <= 32'd1;
	    inp_north0 <= 32'd4;
	#10 inp_west0 <= 32'd0;
	    inp_north0 <= 32'd0;
	#10 inp_west0 <= 32'd0;
	    inp_north0 <= 32'd0;
	#10 inp_west0 <= 32'd0;
	    inp_north0 <= 32'd0;
	#10 inp_west0 <= 32'd0;	
	    inp_north0 <= 32'd0;
end

initial begin
	#3  inp_west1 <= 32'd0;
	    inp_north1 <= 32'd0;
	#10 inp_west1 <= 32'd7;
	    inp_north1 <= 32'd13;
	#10 inp_west1 <= 32'd6;
	    inp_north1 <= 32'd9;
	#10 inp_west1 <= 32'd5;
	    inp_north1 <= 32'd5;
	#10 inp_west1 <= 32'd4;
	    inp_north1 <= 32'd1;
	#10 inp_west1 <= 32'd0;
	    inp_north1 <= 32'd0;
	#10 inp_west1 <= 32'd0;	
	    inp_north1 <= 32'd0;
end

initial begin
	#3  inp_west2 <= 32'd0;
	    inp_north2 <= 32'd0;
	#10 inp_west2 <= 32'd0;
	    inp_north2 <= 32'd0;
	#10 inp_west2 <= 32'd11;
	    inp_north2 <= 32'd14;
	#10 inp_west2 <= 32'd10;
	    inp_north2 <= 32'd10;
	#10 inp_west2 <= 32'd9;
	    inp_north2 <= 32'd6;
	#10 inp_west2 <= 32'd8;
	    inp_north2 <= 32'd2;
	#10 inp_west2 <= 32'd0;	
	    inp_north2 <= 32'd0;
end

initial begin
	#3  
		inp_west3 <= 32'd0;
	    inp_north3 <= 32'd0;
	#10 
		inp_west3 <= 32'd0;
	    inp_north3 <= 32'd0;
	#10 
		inp_west3 <= 32'd0;
	    inp_north3 <= 32'd0;
	#10 
		inp_west3 <= 32'd15;
	    inp_north3 <= 32'd15;
	#10 inp_west3 <= 32'd14;
	    inp_north3 <= 32'd11;
	#10 inp_west3 <= 32'd13;
	    inp_north3 <= 32'd7;
	#10 inp_west3 <= 32'd12;	
	    inp_north3 <= 32'd3;
end

initial begin
rst <= 1;
clk <= 0;
#3
rst <= 0;
end

initial begin
	repeat(21)
		#5 clk <= ~clk;
end


endmodule