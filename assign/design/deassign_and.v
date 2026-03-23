module deassign_and (
    input  wire a,
    input  wire b,
    output reg  y
);

    initial begin
      
        assign y = a & b;
        #50;
        deassign y;
    end

endmodule
