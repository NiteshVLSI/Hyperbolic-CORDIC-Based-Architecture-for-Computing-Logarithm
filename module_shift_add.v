module shift_add(x_i, y_i, z_i, value, x, y, z);
    parameter STAGE = 16;
    input wire [31:0] x_i, y_i, z_i, value;
    output reg [31:0] x, y, z;

    

  wire [31:0] x_shift, y_shift;
  assign x_shift = {x_i[31],(x_i[30:0] >> STAGE)};
  assign y_shift = {y_i[31],(y_i[30:0] >> STAGE)};
    
  reg [31:0] x_p, y_p;
    
    always @(*) begin
        if (y_i[31]) begin    
            if (x_i[31]) begin 
                x = {1'b1, (x_i[30:0] + y_shift[30:0])};
                y = {1'b1, (y_i[30:0] + x_shift[30:0])}; 
            end else begin
                x = (x_i[29:0] > y_shift[29:0]) ? {2'b00, (x_i[29:0] - y_shift[29:0])} : {2'b10, (y_shift[29:0] - x_i[29:0])};
                y = (y_i[29:0] < x_shift[29:0]) ? {2'b00, (x_shift[29:0] - y_i[29:0])} : {2'b10, (y_i[29:0] - x_shift[29:0])};
            end
        end else begin  
            if (x_i[31]) begin  
              x = {1'b1, (x_i[30:0] + y_shift[30:0])};
              y = {1'b0,(y_i[30:0] + x_shift[30:0]) };
            end else begin
                 x = (x_i[29:0] > y_shift[29:0]) ? {2'b00, (x_i[29:0] - y_shift[29:0])} : {2'b10, (y_shift[29:0] - x_i[29:0])};
                y = (y_i[29:0] > x_shift[29:0]) ? {2'b00, (-x_shift[29:0] + y_i[29:0])} : {2'b10, (-y_i[29:0] + x_shift[29:0])};
            end
        end

        
    end
    
    // Adjust z based on the sign of y_i and z_i
    always @(*) begin
        if (y_i[31]) begin
            if (z_i[31]) begin
                z = {1'b1, (z_i[30:0] + y_i[30:0])};
            end else begin
              z = (z_i[29:0] > value[29:0]) ? (z_i - value) : {1'b1, (value[30:0] - z_i[30:0])};
            end
        end else begin
            if (z_i[31]) begin
                z = (z_i[29:0] > value[29:0]) ? {2'b10, (z_i[29:0] - value[29:0])} : {2'b00, (value[29:0] - z_i[29:0])};
            end else begin
              z = {1'b0, (z_i[30:0] + value[30:0])};
            end
        end
    end
endmodule
