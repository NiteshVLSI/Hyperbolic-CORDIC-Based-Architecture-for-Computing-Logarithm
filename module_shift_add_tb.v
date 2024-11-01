// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module shift_add_tb;

    // Parameter for the shift amount
    parameter STAGE = 4;

    // Inputs (fixed-point: 1 sign bit + 3 integer bits + 25 fractional bits)
    reg [31:0] x_i;
    reg [31:0] y_i;
    reg [31:0] z_i;
    reg [31:0] value;

    // Outputs
    wire [31:0] x;
    wire [31:0] y;
    wire [31:0] z;

    // Instantiate the shift_add module
    shift_add #(.STAGE(STAGE)) uut (
        .x_i(x_i),
        .y_i(y_i),
        .z_i(z_i),
        .value(value),
        .x(x),
        .y(y),
        .z(z)
    );

    // Task to convert fixed-point binary to decimal
    function real fixed_to_real;
        input [31:0] fixed_val;
        reg signed [31:0] signed_val;
        begin
            // Interpret as signed for two's complement
            signed_val = fixed_val[31] ? -({1'b0, fixed_val[30:0]}) : fixed_val;
            // Convert to real with 25 fractional bits
            fixed_to_real = signed_val / 2.0 ** 25;
        end
    endfunction

    // Apply multiple test vectors
    initial begin
        // Test Vector Set 1: Mixed signs, small values
        x_i = 32'b10000011010110001000000100100000; // -1.67286
        y_i = 32'b00000011101111101110011110000000; // 1.87285
        z_i = 32'b00000000001011100011101000000000; // 0.09286
        value = 32'b00000000001011100011101000000000; // 0.09286
        #10;

        // Test Vector Set 2: Both positive
        x_i = 32'b00000001010101100100000100000000; // 1.34567
        y_i = 32'b00000001001001000100000000000000; // 1.14567
        z_i = 32'b00000000000000000000000000000000; // 0
        value = 32'b00000000000101010101010100000000; // 0.333333
        #10;

        // Test Vector Set 3: Both negative, small values
        x_i = 32'b10000001010101100100000100000000; // -1.34567
        y_i = 32'b10000001001001000100000000000000; // -1.14567
        z_i = 32'b00000000000000000000000000000000; // 0
        value = 32'b00000000000101010101010100000000; // 0.333333
        #10;

        // Test Vector Set 4: Negative and small positive
        x_i = 32'b10000011110000000000000000000000; // -2.0
        y_i = 32'b00000000110000000000000000000000; // 0.75
        z_i = 32'b00000000000000000000000000000000; // 0
        value = 32'b00000000000000000000000000000000; // 0
        #10;

        // Test Vector Set 5: Large positive and small negative
        x_i = 32'b00000001111111111111111111111111; // 1.99999994
        y_i = 32'b10000000000000000000000000000001; // -0.00000006
        z_i = 32'b00000000000000000000000000000000; // 0
        value = 32'b00000000001111111111111111111111; // 0.99999994
        #10;

        // Test Vector Set 6: Both values small negative
        x_i = 32'b10000000010101000000000000000000; // -0.333333
        y_i = 32'b10000000001100110011001100110011; // -0.2
        z_i = 32'b00000000000000000000000000000000; // 0
        value = 32'b00000000000000000000000000000000; // 0
        #10;

        // Test Vector Set 7: Positive and small positive
        x_i = 32'b00000001000000000000000000000000; // 1.0
        y_i = 32'b00000000000101010101010101010101; // 0.333333
        z_i = 32'b00000000010000000000000000000000; // 0.5
        value = 32'b00000000001000000000000000000000; // 0.25
        #10;

        // Test Vector Set 8: Small positive and zero
        x_i = 32'b00000000000101010101010101010101; // 0.333333
        y_i = 32'b00000000000000000000000000000000; // 0
        z_i = 32'b00000000000101010101010101010101; // 0.333333
        value = 32'b00000000000101010101010101010101; // 0.333333
        #10;

        // Test Vector Set 9: Zero and small negative
        x_i = 32'b00000000000000000000000000000000; // 0
        y_i = 32'b10000000000101010101010101010101; // -0.333333
        z_i = 32'b00000000000000000000000000000000; // 0
        value = 32'b00000000000000000000000000000000; // 0
        #10;

        // End simulation
        $finish;
    end

    // Monitor the output values, converting to real for readability
    initial begin
        $monitor("At time %t: x_i = %f, y_i = %f, z_i = %f, value = %f, x = %f, y = %f, z = %f", 
                 $time, 
                 fixed_to_real(x_i), 
                 fixed_to_real(y_i), 
                 fixed_to_real(z_i), 
                 fixed_to_real(value), 
                 fixed_to_real(x), 
                 fixed_to_real(y), 
                 fixed_to_real(z));
    end

endmodule
