module generate_for #(parameter N = 3)
(
    input  wire [N-1:0] i0,
    input  wire [N-1:0] i1,
    output wire [N-1:0] out
);

    genvar j;
    generate
        for (j=0; j<N; j=j+1) begin : xor_ar
            xor g1 (out[j], i0[j], i1[j]);
        end
    endgenerate


// xor_ar[0].g1
// xor_ar[1].g1
// xor_ar[2].g1

endmodule
