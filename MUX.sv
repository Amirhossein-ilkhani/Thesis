module MUX #(
    WIDTH = 8,
    N = 4
)(
    input [WIDTH-1:0] in_i [0 : N-1],
    input [WIDTH-1:0] in_j [0 : N-1],
    input [WIDTH-1:0] in_k [0 : N-1],
    input [$clog2(N)-1:0] Sel,
    output [WIDTH-1:0] o_i,
    output [WIDTH-1:0] o_j,
    output [WIDTH-1:0] o_k
);

    assign o_i = in_i[Sel];
    assign o_j = in_j[Sel];
    assign o_k = in_k[Sel];

endmodule