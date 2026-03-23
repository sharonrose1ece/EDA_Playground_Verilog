module tb_deassign_and;

    reg a, b;
    wire y;

  
    deassign_and dut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $monitor("T=%0t | a=%b b=%b | y=%b", $time, a, b, y);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        #20;
        a = 0; b = 0; #10;

        $finish;
    end
  initial begin
  $dumpfile("wave.vcd");
  $dumpvars(0, tb_deassign_and);
  end
    

endmodule
