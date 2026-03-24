module array_buf (
    input  wire [2:0] in,
    output wire [2:0] out
);

    buf b[2:0] (out, in);

endmodule
