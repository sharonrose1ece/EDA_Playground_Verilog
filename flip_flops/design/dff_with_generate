module dff_with_generate (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [3:0]  d,
    output reg  [3:0]  q
);

genvar i;
generate
    for (i = 0; i < 4; i = i + 1) begin : dff_gen
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n)
                q[i] <= 1'b0;
            else
                q[i] <= d[i];
        end
    end
endgenerate

endmodule
