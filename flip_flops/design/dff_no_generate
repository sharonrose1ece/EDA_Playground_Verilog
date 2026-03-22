module dff_no_generate (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [3:0]  d,
    output reg  [3:0]  q
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        q[0] <= 0;
        q[1] <= 0;
        q[2] <= 0;
        q[3] <= 0;
    end else begin
        q[0] <= d[0];
        q[1] <= d[1];
        q[2] <= d[2];
        q[3] <= d[3];
    end
end

endmodule
