module datapath_tb;

reg rst, clk, cs;
reg [3:0] readw, writew;
reg [3:0] readn, writen;
reg [31:0] data_in;
wire done;

DataPath #(.WIDTH(32), .ROW(4), .COL(4)) uut(
	.cs(cs),
	.rst(rst), 
	.clk(clk),
	.readw(readw),
	.writew(writew),
	.readn(readn),
	.writen(writen),
	.data_in(data_in),
	.done(done)
	); 

initial begin
	#13 
	data_in <= 16'd1;
	writew <= 4'b0001;
	#10 
	data_in <= 16'd2;
	writew <= 4'b0001;
	#10 
	data_in <= 16'd3;
	writew <= 4'b0001;
	#10 
	data_in <= 16'd4;
	writew <= 4'b0001;

	#10 
	data_in <= 16'd5;
	writew <= 4'b0010;
	#10 
	data_in <= 16'd6;
	writew <= 4'b0010;
	#10 
	data_in <= 16'd7;
	writew <= 4'b0010;
	#10 
	data_in <= 16'd8;
	writew <= 4'b0010;

	#10 
	data_in <= 16'd9;
	writew <= 4'b0100;
	#10 
	data_in <= 16'd10;
	writew <= 4'b0100;
	#10 
	data_in <= 16'd11;
	writew <= 4'b0100;
	#10 
	data_in <= 16'd12;
	writew <= 4'b0100;

	#10 
	data_in <= 16'd13;
	writew <= 4'b1000;
	#10 
	data_in <= 16'd14;
	writew <= 4'b1000;
	#10 
	data_in <= 16'd15;
	writew <= 4'b1000;
	#10 
	data_in <= 16'd16;
	writew <= 4'b1000;

	#10 writew <= 4'b0000;
	//---------------------------------------
	#10 
	data_in <= 16'd1;
	writen <= 4'b0001;
	#10 
	data_in <= 16'd5;
	writen <= 4'b0001;
	#10 
	data_in <= 16'd9;
	writen <= 4'b0001;
	#10 
	data_in <= 16'd13;
	writen <= 4'b0001;

	#10 
	data_in <= 16'd2;
	writen <= 4'b0010;
	#10 
	data_in <= 16'd6;
	writen <= 4'b0010;
	#10 
	data_in <= 16'd10;
	writen <= 4'b0010;
	#10 
	data_in <= 16'd14;
	writen <= 4'b0010;

	#10 
	data_in <= 16'd3;
	writen <= 4'b0100;
	#10 
	data_in <= 16'd7;
	writen <= 4'b0100;
	#10 
	data_in <= 16'd11;
	writen <= 4'b0100;
	#10 
	data_in <= 16'd15;
	writen <= 4'b0100;

	#10 
	data_in <= 16'd4;
	writen <= 4'b1000;
	#10 
	data_in <= 16'd8;
	writen <= 4'b1000;
	#10 
	data_in <= 16'd12;
	writen <= 4'b1000;
	#10 
	data_in <= 16'd16;
	writen <= 4'b1000;

	#10 writen <= 4'b0000;
	// ------------------------------------
	#3
	cs <= 1;
	#7
	readw <= 4'b0001;
	readn <= 4'b0001;
	#10 
	readw <= 4'b0011;
	readn <= 4'b0011;
	#10 
	readw <= 4'b0111;
	readn <= 4'b0111;
	#10 
	readw <= 4'b1111;
	readn <= 4'b1111;
	#10 
	readw <= 4'b1111;
	readn <= 4'b1111;
	#10 
	readw <= 4'b1111;
	readn <= 4'b1111;
	#10 
	readw <= 4'b1111;
	readn <= 4'b1111;
	#10 
	readw <= 4'b0000;
	readn <= 4'b0000;
	#40 
	cs <= 0;



end

initial begin
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