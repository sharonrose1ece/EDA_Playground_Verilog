module tb_dff_sync_reset;

    reg clk;
    reg rst;
    reg b;
    wire a;

    ff_infered ff_inst (
        .clk(clk),
        .rst(rst),
        .b(b),
        .a(a)
    );

   initial clk = 0;
    always #5 clk = ~clk;

    initial begin
      $monitor("t=%0t | clk=%b rst=%b b=%b | a=%b",
                  $time, clk, rst, b, a);

        rst = 1;   
        b = 0; //time 0
        #5 b = 1;    

        #3 rst = 0;  
        #3 rst = 1;  

        #6 b = 0;    
        #6 b=1;
        #20 $finish;
      
    end
initial begin 
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, tb_dff_sync_reset);
end
endmodule
