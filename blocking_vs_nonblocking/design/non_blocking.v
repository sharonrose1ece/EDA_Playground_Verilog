module non_blocking (
    input  wire clk,
    input  wire X,
    output reg  Y,
    output reg  Z,
    output reg  y,
    output reg  z
);

    
    always @(posedge clk) begin
        Z <= Y;
        Y <= X;

        y <= X;
        z <= y;
    end

endmodule
