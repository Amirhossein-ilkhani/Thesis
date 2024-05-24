module Quad_Port_Ram #(parameter WIDTH=32, parameter HEIGHT=48) 
(
  input [WIDTH-1:0] data_a, data_b, data_c, data_d, //input data
  input [$clog2(HEIGHT)-1:0] addr_a, addr_b, addr_c, addr_d, //Port A and Port B address
  input we_a, we_b, we_c, we_d, //write enable for Port A and Port B
  input clk, //clk
  output reg [WIDTH-1:0] q_a, q_b, q_c, q_d //output data at Port A and Port B
);
  
  reg [WIDTH-1:0] ram [0 : HEIGHT-1]; //32*47 bit ram

  // initial begin 
  //   $readmemh("memoryGBF_in.mem", ram);
  // end
  
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

    always @ (posedge clk)
    begin
      if(we_c)
        ram[addr_c] <= data_c;
    end
    
    always @ (posedge clk)
    begin
      if(we_d)
        ram[addr_d] <= data_d;
    end

    assign q_a = ram[addr_a]; 
    assign q_b = ram[addr_b]; 
    assign q_c = ram[addr_c]; 
    assign q_d = ram[addr_d];


    // Task to initialize RAM from a file
    task init_ram_from_file(input string filename);
      $readmemh(filename, ram);
    endtask

    // Task to write RAM contents to a file
    task write_ram_to_file(input string filename);
      int file;
      file = $fopen(filename, "w");
      if (file == 0) begin
          $display("Error: Could not open file %s for writing.", filename);
          return;
      end
      for (int i = 0; i < HEIGHT; i++) begin
          $fwrite(file, "%h\n", ram[i]);
      end
      $fclose(file);
  endtask
    
endmodule



// ram1.init_ram_from_file("fixed_point_weights_and_inputs1.txt");
// ram2.init_ram_from_file("fixed_point_weights_and_inputs2.txt");

// ram1.write_ram_to_file("ram1_output.txt");
// ram2.write_ram_to_file("ram2_output.txt")