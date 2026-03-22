module tb_dff_no_generate;

    reg        clk;
    reg        rst_n;
    reg  [3:0] d;      
    wire [3:0] q;

    dff_no_generate dut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        $monitor("t=%0t clk=%b rst_n=%b d=%b q=%b", $time, clk, rst_n, d, q);

        rst_n = 0;
        d     = 4'b0000;

         #10 rst_n = 1;         

        #10 d = 4'b0001;
      #10 d = 4'b0011;
        #10 d = 4'b0101;
        #10 d = 4'b1111;

        #20 $finish;
  

  end 
  initial begin
    $dunpfile("wave.vcd");
    $dumpvars(0, tb_dff_no_generate);
  end
endmodule
