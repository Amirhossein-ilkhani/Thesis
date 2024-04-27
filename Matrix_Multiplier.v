module Matrix_Multiplier#(
	parameter WIDTH = 32,
	parameter HEIGHT = 48,
	parameter ROW = 4,
	parameter COL = 4
	)(
	input clk,rst,
    input start,
    input w_a,w_b,
    input [WIDTH-1 : 0] Data_in_a,Data_in_b,
    input [$clog2(HEIGHT): 0] Addr_in_a,Addr_in_b,
    input [ROW*COL*WIDTH-1 : 0] result_in,
    output [ROW*COL*WIDTH-1 : 0] result_out,
    output Done
	);

	wire [WIDTH-1 : 0] data_input, data_weight;
    wire [$clog2(HEIGHT): 0] addr_a, addr_b;
    wire [$clog2(HEIGHT): 0] addr_lbf_a, addr_lbf_b;
    wire cs;
    wire [ROW-1 : 0] read_fifo, write_fifo;
    wire done;
    wire s;

	Dual_Port_Ram #(.WIDTH(WIDTH), .HEIGHT(HEIGHT)) ram_inst(
        .clk(clk),
        .data_a(Data_in_a),
        .data_b(Data_in_b),
        .addr_a(addr_lbf_a),
        .addr_b(addr_lbf_b),
        .we_a(w_a),
        .we_b(w_b),
        .q_a(data_input),
        .q_b(data_weight)
    );

    Controller #(.ADD_WIDTH(6), .ROW(ROW), .COL(COL)) Distributer_ins(
        .clk(clk),
        .rst(rst),
        .start(start),
        .done(done),
        .cs(cs),
        .read_fifo(read_fifo),
        .write_fifo(write_fifo),
        .add_a(addr_a),
        .add_b(addr_b),
        .w_b(),
        .s(s)
    ); 

    DataPath #(.WIDTH(WIDTH), .ROW(ROW), .COL(COL)) data_path (
        .clk(clk),
        .rst(rst),
        .cs(cs),
        .read(read_fifo),
        .write(write_fifo),
        .data_in_i(data_input),
        .data_in_w(data_weight),
        .result_in(result_in),
        .result_out(result_out),
        .done(done)
    );

    assign addr_lbf_a = (s) ? addr_a : Addr_in_a;
    assign addr_lbf_b = (s) ? addr_b : Addr_in_b;
    assign Done = done;



endmodule