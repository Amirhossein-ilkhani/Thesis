module Dual_Port_Ram #(parameter WIDTH=32, parameter HEIGHT=48) 
(
  input [WIDTH-1:0] data_a, data_b, //input data
  input [$clog2(HEIGHT):0] addr_a, addr_b, //Port A and Port B address
  input we_a, we_b, //write enable for Port A and Port B
  input clk, //clk
  output reg [WIDTH-1:0] q_a, q_b //output data at Port A and Port B
);
  
  reg [WIDTH-1:0] ram [0 : HEIGHT-1]; //32*47 bit ram
  initial begin 
    $readmemh("memory.mem", ram);
  end
  
  always @ (posedge clk)
    begin
      if(we_a)
        ram[addr_a] <= data_a;
    end
  
  always @ (posedge clk)
    begin
      if(we_b)
        ram[addr_b] <= data_b;
    end
    
    assign q_a = ram[addr_a]; 
    assign q_b = ram[addr_b]; 
    
endmodule