`timescale 1ns / 1ps

module tb_thv_cordic;

// Parameters
parameter CLK_PERIOD = 10;

// Inputs
reg [31:0] x;
reg [31:0] y;
reg clk;

// Outputs
wire [31:0] x_o;
wire [31:0] y_o;
wire [31:0] z_o;

// Instantiate the Device Under Test (DUT)
thv_cordic dut (
    .x(x),
    .y(y),
    .clk(clk),
    .x_o(x_o),
    .y_o(y_o),
    .z_o(z_o)
);


initial begin
    clk = 0;
    forever #(CLK_PERIOD / 2) clk = ~clk;
end

initial begin
    $dumpfile("tb_thv_cordic.vcd");
    $dumpvars(0, tb_thv_cordic);

    
    x = 32'b0;
    y = 32'b0;

    
    #CLK_PERIOD;

    // Test Case 1: 
    x = 32'b00000100011110101110000101000000; // Example: 2.24
    y = 32'b00000000011110101110000101000000; // Example: 0.24
    #CLK_PERIOD; 

    // Test Case 2: 
    x = 32'b00000101000000000000000000000000; // Example: 2.5
    y = 32'b00000001000000000000000000000000; // Example: 0.5
    #CLK_PERIOD; 

    // Test Case 3: 
    x = 32'b00000101101011100001010010000000; // Example: 2.84
    y = 32'b00000001101011100001010010000000; // Example: 0.84
    #CLK_PERIOD; 

    
    $monitor("time: %t | Output (x_o, y_o, z_o) = (%b, %b, %b)", $time, x_o, y_o, z_o);
    
    #(30 * CLK_PERIOD);
    
    
    $finish;
end

endmodule
