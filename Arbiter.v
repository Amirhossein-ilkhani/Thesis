module Arbiter #(
  parameter NumRequests = 4
) (
  input [NumRequests-1:0] request,
  output reg [NumRequests-1:0] grant,
  output reg [$clog2(NumRequests):0] select
);
  integer i;
  always @(request) begin
    grant = 0;
    select = '{default: 'z}; 
    for (i = 0; i < NumRequests; i = i+1) begin
      if (request[i]) begin
        grant[i] = 1;
        select = i;
        break;
      end
    end
  end

endmodule