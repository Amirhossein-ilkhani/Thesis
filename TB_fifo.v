module fifo_tb;

reg rst, clk;
reg [15:0] data_in;
reg write, read;
wire [15:0] data_out;
wire fifo_full, fifo_empty, fifo_not_empty, fifo_not_full;

fifo #(.WIDTH(16), .DEPTH(4)) uut(
	.rst(rst), 
	.clk(clk),
	.data_in(data_in),
	.write(write),
	.read(read),
	.data_out(data_out),
	.fifo_full(fifo_full),
	.fifo_empty(fifo_empty),
	.fifo_not_empty(fifo_not_empty),
	.fifo_not_full(fifo_not_full)
	);

initial begin
	#13  data_in <= 16'd3;
	    write <= 1'b1;

	#10 
	data_in <= 16'd10;
	write <= 1'b1;

	#10 
	data_in <= 16'd15;
	write <= 1'b1;

	#10 
	data_in <= 16'd18;
	write <= 1'b1;

	#5 write <= 1'b0;

	#10  read <= 1'b1;
	#10  read <= 1'b1;
	#10  read <= 1'b1;
	#10  read <= 1'b1;
	#10  read <= 1'b1;
	#10  read <= 1'b1;
	#10 read <= 1'b0;

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