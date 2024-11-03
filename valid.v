
module is_valid(fp,x,y,exponent,clk,reset,valid);
input wire [31:0] fp;
input wire clk,reset;
output reg [31:0] x,y;
output reg [7:0] exponent;
output reg valid;


always @(posedge clk, posedge reset)
begin
    if(reset)
        begin
        x<= 32'b0;
        y<= 32'b0;
        exponent <= 8'b0;
        valid <= 1'b0;
        end
    else
        begin
        if((fp[31]==0)&&(fp[22:0]!=23'b0))
            begin
            x <= {(7'b0000010),fp[22:0],2'b0};
            y <= {7'b0,fp[22:0],2'b0};
            exponent <= (fp[30:23]>7'd127)?(fp[30:23]-7'd127):({1'b1,7'd127-fp[29:23]});
            valid <= 1'b1;
            end
        else
            begin
            x <= x;
            y <= y;
            exponent <= exponent;
            valid <= 1'b0;
            end
        
        end
end


endmodule
