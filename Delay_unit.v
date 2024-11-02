module delay_unit(
    input wire [7:0] exponent,
    input wire clk, 
    output reg [7:0] exponent_out
);

reg [7:0] exp_0_1_out, exp_1_2_out, exp_2_3_out, exp_3_4_out, exp_4_5_out, 
          exp_5_6_out, exp_6_7_out, exp_7_8_out, exp_8_9_out, exp_9_10_out, 
          exp_10_11_out, exp_11_12_out, exp_12_13_out, exp_13_14_out, 
          exp_14_15_out, exp_15_16_out, exp_16_17_out, exp_17_18_out;

always @(posedge clk) begin
    exp_0_1_out  <= exponent;
    exp_1_2_out  <= exp_0_1_out;
    exp_2_3_out  <= exp_1_2_out;
    exp_3_4_out  <= exp_2_3_out;
    exp_4_5_out  <= exp_3_4_out;
    exp_5_6_out  <= exp_4_5_out;
    exp_6_7_out  <= exp_5_6_out;
    exp_7_8_out  <= exp_6_7_out;
    exp_8_9_out  <= exp_7_8_out;
    exp_9_10_out <= exp_8_9_out;
    exp_10_11_out <= exp_9_10_out;
    exp_11_12_out <= exp_10_11_out;
    exp_12_13_out <= exp_11_12_out;
    exp_13_14_out <= exp_12_13_out;
    exp_14_15_out <= exp_13_14_out;
    exp_15_16_out <= exp_14_15_out;
    exp_16_17_out <= exp_15_16_out;
    exp_17_18_out <= exp_16_17_out;
    exponent_out  <= exp_17_18_out;
end

endmodule
