module ff_infered (
    input  wire clk,
    input  wire rst,   
    input  wire b,
    output reg  a
);

    always @(posedge clk or negedge rst) begin
        if (!rst)
            a <= 1'b0;  
        else
            a <= b;
    end

endmodule
