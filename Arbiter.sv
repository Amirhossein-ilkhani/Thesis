module Arbiter #(
  parameter NumRequests = 4
) (
  input [0 : NumRequests-1] request,
  output reg [0 : NumRequests-1] grant,
  output reg [$clog2(NumRequests)-1:0] select,
  output reg en_add_gen
);
  integer i;
  always @(request) begin
    grant = 0;
    select = '{default: 'z};
    en_add_gen = 0; 
    for (i = 0; i < NumRequests; i = i+1) begin
      if (request[i]) begin
        grant[i] = 1;
        select = i;
        en_add_gen = 1;
        break;
      end
    end
  end

endmodule