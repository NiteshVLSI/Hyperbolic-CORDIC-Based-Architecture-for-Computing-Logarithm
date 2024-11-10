module thv_top_tb;

  // Inputs
  reg clk;
  reg reset;
  reg [31:0] fp_value;
  integer i;
  // Outputs
  wire [32:0] log_value;
  wire valid;

  // Instantiate the Unit Under Test (UUT)
  thv_top uut (
    .clk(clk),
    .reset(reset),
    .fp_value(fp_value),
    .log_value(log_value),
    .valid(valid)
  );

  // Clock Generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Function to convert 32-bit integer to real for display purposes
  function real fp_to_real(input [31:0] fp);
    reg sign;
    reg [7:0] exponent;
    reg [22:0] mantissa;
    real result;
    begin
      sign = fp[31];
      exponent = fp[30:23];
      mantissa = fp[22:0];
      
      // Check for special cases like zero, infinity, or NaN
      if (exponent == 8'b0) begin
        result = 0.0; // Zero or subnormal
      end else if (exponent == 8'b1111_1111) begin
        result = (mantissa == 0) ? (sign ? -1.0/0.0 : 1.0/0.0) : 0.0/0.0; // Infinity or NaN
      end else begin
        result = (sign ? -1.0 : 1.0) * (1.0 + mantissa / (2.0**23)) * (2.0 ** (exponent - 127));
      end
      
      fp_to_real = result;
    end
  endfunction

  // Function to convert log_value to real number
  function real log_to_real(input [32:0] log_val);
    reg sign;
    reg [7:0] integer_part;
    reg [23:0] fractional_part;
    real result;
    begin
      sign = log_val[32];
      integer_part = log_val[31:25];
      fractional_part = log_val[24:0];

      // Convert fractional part to real
      result = integer_part + (fractional_part / (2.0 ** 25));
      
      // Apply the sign
      if (sign) 
        result = -result;
      
      log_to_real = result;
    end
  endfunction

  // Test Procedure
  initial begin
    // Initialize and reset
    $display("Starting testbench for thv_top with 1000 values");
    reset = 1;
    fp_value = 32'b0;
    #20 reset = 0;
    #10;

    // Run 1000 random test cases
    for (i = 0; i < 1000; i = i + 1) begin
      fp_value = $random; // Generate a random 32-bit floating-point value
      #10; // Wait for some time to allow UUT processing
      
      // Display the equivalent floating-point and output values
      $display("Time: %0t | fp_value: %h | fp_real: %f | log_base2_value: %f | valid: %b",
               $time, fp_value, fp_to_real(fp_value), log_to_real(log_value), valid);
    end

    $display("Testbench completed");
    $finish;
  end

endmodule
