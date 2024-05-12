module Generator_Addr_in #(
	parameter END_ROW = 16,
	parameter HEIGHT = 32
	)(
	input clk,rst,en,
	input [7:0] i,j,k,
	output [$clog2(HEIGHT)-1:0] Addr
	);

	reg [1:0] ps, ns;
	reg en_0;
	wire [1:0] cnt_0,cnt_1;
	wire co_0,co_1;

	Counter #(2) k0 (.clk(clk), .rst(rst), .en(en_0), .count(cnt_0), .co(co_0));
	Counter #(2) k1 (.clk(clk), .rst(rst), .en(co_0), .count(cnt_1), .co(co_1));

	always @(ps, en, co_0, co_1) begin
        en_0 = 0;
        case(ps)
            0: ns = (en) ? 1 : 0;
            1: begin
                ns = (co_1 & co_0) ? 0 : 1;
                en_0 = 1;
			end
        endcase
    end

	always @(posedge clk, posedge rst) begin
		if(rst) begin
			ps <= 0;
			ns <= 0;
		end
		else
			ps <= ns;
	end


	assign Addr = (END_ROW*4*i)+(4*k)+(END_ROW*cnt_1)+cnt_0;
	
endmodule