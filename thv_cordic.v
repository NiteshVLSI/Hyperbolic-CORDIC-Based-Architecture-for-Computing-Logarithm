// Code your design here


module thv_cordic(x,y,clk,x_o,y_o,z_o);
input wire[31:0] x,y;
input wire clk;
output reg [31:0] x_o,y_o,z_o;

wire [31:0] x_1_2_in,x_2_3_in,x_3_4_in,x_4_5_in,x_5_6_in,x_6_7_in,x_7_8_in,x_8_9_in,x_9_10_in,x_10_11_in,x_11_12_in,x_12_13_in,x_13_14_in,x_14_15_in,x_15_16_in,x_16_17_in,x_17_18_in,x_18_out;

reg [31:0] x_0_1_out,x_1_2_out,x_2_3_out,x_3_4_out,x_4_5_out,x_5_6_out,x_6_7_out,x_7_8_out,x_8_9_out,x_9_10_out,x_10_11_out,x_11_12_out,x_12_13_out,x_13_14_out,x_14_15_out,x_15_16_out,x_16_17_out,x_17_18_out;

wire [31:0] y_1_2_in,y_2_3_in,y_3_4_in,y_4_5_in,y_5_6_in,y_6_7_in,y_7_8_in,y_8_9_in,y_9_10_in,y_10_11_in,y_11_12_in,y_12_13_in,y_13_14_in,y_14_15_in,y_15_16_in,y_16_17_in,y_17_18_in,y_18_out;

  reg [31:0] y_0_1_out,y_1_2_out,y_2_3_out,y_3_4_out,y_4_5_out,y_5_6_out,y_6_7_out,y_7_8_out,y_8_9_out,y_9_10_out,y_10_11_out,y_11_12_out,y_12_13_out,y_13_14_out,y_14_15_out,y_15_16_out,y_16_17_out,y_17_18_out;

wire [31:0] z_1_2_in,z_2_3_in,z_3_4_in,z_4_5_in,z_5_6_in,z_6_7_in,z_7_8_in,z_8_9_in,z_9_10_in,z_10_11_in,z_11_12_in,z_12_13_in,z_13_14_in,z_14_15_in,z_15_16_in,z_16_17_in,z_17_18_in,z_18_out;

reg [31:0] z_0_1_out,z_1_2_out,z_2_3_out,z_3_4_out,z_4_5_out,z_5_6_out,z_6_7_out,z_7_8_out,z_8_9_out,z_9_10_out,z_10_11_out,z_11_12_out,z_12_13_out,z_13_14_out,z_14_15_out,z_15_16_out,z_16_17_out,z_17_18_out;

wire [31:0] value_0,value_1,value_2,value_3,value_4,value_5,value_6,value_7,value_8,value_9,value_10,value_11,value_12,value_13,value_14,value_15;
assign value_0 = 32'b00000001100101011100000000100000;
assign value_1 = 32'b00000000101111001010100111000000;
assign value_2 = 32'b00000000010111001101000101100000;
assign value_3 = 32'b00000000001011100011101000000000;
assign value_4 = 32'b00000000000101110001011101000000;
assign value_5 = 32'b00000000000010111000101011100000;
assign value_6 = 32'b00000000000001011100010101100000;
assign value_7 = 32'b00000000000000101110001010100000;
assign value_8 = 32'b00000000000000010111000101100000;
assign value_9 = 32'b00000000000000001011100010100000;
assign value_10= 32'b00000000000000000101110001100000;
assign value_11= 32'b00000000000000000010111000100000;
assign value_12= 32'b00000000000000000001011100100000;
assign value_13= 32'b00000000000000000000101110000000;
assign value_14= 32'b00000000000000000000010111000000;
assign value_15= 32'b00000000000000000000001011100000;

shift_add #(1) stage_1 (.x_i(x_0_1_out), .y_i(y_0_1_out), .z_i(z_0_1_out), .value(value_0), .x(x_1_2_in), .y(y_1_2_in), .z(z_1_2_in));
shift_add #(2) stage_2 (.x_i(x_1_2_out), .y_i(y_1_2_out), .z_i(z_1_2_out), .value(value_1), .x(x_2_3_in), .y(y_2_3_in), .z(z_2_3_in));
shift_add #(3) stage_3 (.x_i(x_2_3_out), .y_i(y_2_3_out), .z_i(z_2_3_out), .value(value_2), .x(x_3_4_in), .y(y_3_4_in), .z(z_3_4_in));
shift_add #(4) stage_4 (.x_i(x_3_4_out), .y_i(y_3_4_out), .z_i(z_3_4_out), .value(value_3), .x(x_4_5_in), .y(y_4_5_in), .z(z_4_5_in));
shift_add #(4) stage_5 (.x_i(x_4_5_out), .y_i(y_4_5_out), .z_i(z_4_5_out), .value(value_4), .x(x_5_6_in), .y(y_5_6_in), .z(z_5_6_in));
shift_add #(5) stage_6 (.x_i(x_5_6_out), .y_i(y_5_6_out), .z_i(z_5_6_out), .value(value_4), .x(x_6_7_in), .y(y_6_7_in), .z(z_6_7_in));
shift_add #(6) stage_7 (.x_i(x_6_7_out), .y_i(y_6_7_out), .z_i(z_6_7_out), .value(value_5), .x(x_7_8_in), .y(y_7_8_in), .z(z_7_8_in));
shift_add #(7) stage_8 (.x_i(x_7_8_out), .y_i(y_7_8_out), .z_i(z_7_8_out), .value(value_6), .x(x_8_9_in), .y(y_8_9_in), .z(z_8_9_in));
shift_add #(8) stage_9 (.x_i(x_8_9_out), .y_i(y_8_9_out), .z_i(z_8_9_out), .value(value_7), .x(x_9_10_in), .y(y_9_10_in), .z(z_9_10_in));
shift_add #(9) stage_10 (.x_i(x_9_10_out), .y_i(y_9_10_out), .z_i(z_9_10_out), .value(value_8), .x(x_10_11_in), .y(y_10_11_in), .z(z_10_11_in));
shift_add #(10) stage_11 (.x_i(x_10_11_out), .y_i(y_10_11_out), .z_i(z_10_11_out), .value(value_9), .x(x_11_12_in), .y(y_11_12_in), .z(z_11_12_in));
shift_add #(11) stage_12 (.x_i(x_11_12_out), .y_i(y_11_12_out), .z_i(z_11_12_out), .value(value_10), .x(x_12_13_in), .y(y_12_13_in), .z(z_12_13_in));
shift_add #(12) stage_13 (.x_i(x_12_13_out), .y_i(y_12_13_out), .z_i(z_12_13_out), .value(value_11), .x(x_13_14_in), .y(y_13_14_in), .z(z_13_14_in));
shift_add #(13) stage_14 (.x_i(x_13_14_out), .y_i(y_13_14_out), .z_i(z_13_14_out), .value(value_12), .x(x_14_15_in), .y(y_14_15_in), .z(z_14_15_in));
shift_add #(13) stage_15 (.x_i(x_14_15_out), .y_i(y_14_15_out), .z_i(z_14_15_out), .value(value_12), .x(x_15_16_in), .y(y_15_16_in), .z(z_15_16_in));
shift_add #(14) stage_16 (.x_i(x_15_16_out), .y_i(y_15_16_out), .z_i(z_15_16_out), .value(value_13), .x(x_16_17_in), .y(y_16_17_in), .z(z_16_17_in));
shift_add #(15) stage_17 (.x_i(x_16_17_out), .y_i(y_16_17_out), .z_i(z_16_17_out), .value(value_14), .x(x_17_18_in), .y(y_17_18_in), .z(z_17_18_in));
shift_add #(16) stage_18 (.x_i(x_17_18_out), .y_i(y_17_18_out), .z_i(z_17_18_out), .value(value_15), .x(x_18_out), .y(y_18_out), .z(z_18_out));




always @(posedge clk)
begin


x_0_1_out <= x;
y_0_1_out <= y;
z_0_1_out <= 32'b0;

x_1_2_out <= x_1_2_in;
y_1_2_out <= y_1_2_in;
z_1_2_out <= z_1_2_in;

x_2_3_out <= x_2_3_in;
y_2_3_out <= y_2_3_in;
z_2_3_out <= z_2_3_in;

x_3_4_out <= x_3_4_in;
y_3_4_out <= y_3_4_in;
z_3_4_out <= z_3_4_in;

x_4_5_out <= x_4_5_in;
y_4_5_out <= y_4_5_in;
z_4_5_out <= z_4_5_in;

x_5_6_out <= x_5_6_in;
y_5_6_out <= y_5_6_in;
z_5_6_out <= z_5_6_in;

x_6_7_out <= x_6_7_in;
y_6_7_out <= y_6_7_in;
z_6_7_out <= z_6_7_in;

x_7_8_out <= x_7_8_in;
y_7_8_out <= y_7_8_in;
z_7_8_out <= z_7_8_in;

x_8_9_out <= x_8_9_in;
y_8_9_out <= y_8_9_in;
z_8_9_out <= z_8_9_in;

x_9_10_out <= x_9_10_in;
y_9_10_out <= y_9_10_in;
z_9_10_out <= z_9_10_in;

x_10_11_out <= x_10_11_in;
y_10_11_out <= y_10_11_in;
z_10_11_out <= z_10_11_in;

x_11_12_out <= x_11_12_in;
y_11_12_out <= y_11_12_in;
z_11_12_out <= z_11_12_in;

x_12_13_out <= x_12_13_in;
y_12_13_out <= y_12_13_in;
z_12_13_out <= z_12_13_in;

x_13_14_out <= x_13_14_in;
y_13_14_out <= y_13_14_in;
z_13_14_out <= z_13_14_in;

x_14_15_out <= x_14_15_in;
y_14_15_out <= y_14_15_in;
z_14_15_out <= z_14_15_in;

x_15_16_out <= x_15_16_in;
y_15_16_out <= y_15_16_in;
z_15_16_out <= z_15_16_in;

x_16_17_out <= x_16_17_in;
y_16_17_out <= y_16_17_in;
z_16_17_out <= z_16_17_in;

x_17_18_out <= x_17_18_in;
y_17_18_out <= y_17_18_in;
z_17_18_out <= z_17_18_in;

x_o <= x_18_out;
y_o <= y_18_out;
z_o <= (z_18_out<<1);


end





endmodule