module tb_dff_async_reset;

    reg  clk;
    reg  b, c;
    wire a;

    ff_notinfered ffi (
        .clk(clk),
        .b(b),
        .c(c),
        .a(a)
    );
 initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        

        $monitor("t=%0t | clk=%b b=%b c=%b | a=%b",
                 $time, clk, b, c, a);

        #2;
        b = 0; c = 0;   
        #10 b = 0; c = 1; 
        #10 b = 1; c = 0; 
        #10 b = 1; c = 1; 
     

        #10 
      $finish;
    end
initial begin
        $dumpfile("dumpfile.vcd");
  $dumpvars(0, tb_dff_async_reset);
end
endmodule
