module thv_top(clk,reset,valid,fp_value,log_value);
input wire clk,reset;
input wire [31:0] fp_value;
output wire [32:0] log_value;
output wire valid;
wire [31:0] x,y;
wire [7:0] exponent_in,exponent_out;
wire [31:0] v_1,v_2,value;

is_valid is_valid_inst(.fp(fp_value),.clk(clk),.reset(reset),.x(x),.y(y),.exponent(exponent_in),.valid(valid));
delay_unit delay_unit_inst(.exponent(exponent_in),.clk(clk), .exponent_out(exponent_out));
thv_cordic thv_cordic_inst(.x(x),.y(y),.clk(clk),.x_o(v_1),.y_o(v_2),.z_o(value));
au au_inst(.clk(clk),.value(value),.reset(reset),.exponent(exponent_out),.log_value(log_value));



endmodule