module memory_tb;

  // Declare a wire to connect to the memory output
  wire [15:0][31:0] values;

  // Instantiate the memory module
  memory mem_inst(.values(values));

  // Function to convert 32-bit fixed-point to real using two's complement for sign
  function real fixed_to_real(input [31:0] fixed_val);
    reg signed [31:0] signed_val;
    begin
      // Cast fixed_val as signed to interpret it correctly in two's complement format
       
      // Convert to real, dividing by 2^25 due to 25 fractional bits
      fixed_to_real = fixed_val / (2.0 ** 25);
    end
  endfunction

  initial begin
    // Display header for clarity
    $display("Testing memory module values in decimal format...");

    // Print each value in the memory array in decimal format
    for (int i = 0; i < 16; i++) begin
      #5
      $display("values[%0d] = %f", i, fixed_to_real(values[i]));
      
    end

    $stop;  // End the simulation
  end

endmodule
