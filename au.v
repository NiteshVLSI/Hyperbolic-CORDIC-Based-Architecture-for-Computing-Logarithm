module au(clk,value,exponent,log_value,reset);
input wire clk,reset;
input wire [7:0] exponent;
input wire [31:0] value;
output reg [32:0] log_value;

always @(posedge clk,posedge reset)
begin
   if(reset)
       log_value <= 32'b0;
   else
       begin
           if(exponent[7]==0)
               log_value <= {exponent,value[24:0]};
           else
               begin
                log_value <= {1'b1,({exponent[6:0],25'b0}-{7'b0,value[24:0]})};
               end
       end

end

endmodule