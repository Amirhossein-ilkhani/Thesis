module Arbiter #(
  parameter NumRequests = 4
) (
  input request [0 : NumRequests-1] ,
  output reg grant [0 : NumRequests-1] ,
  output reg [$clog2(NumRequests)-1:0] select
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