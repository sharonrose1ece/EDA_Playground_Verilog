module tb_generate_for;

      reg  [2:0] i0;
    reg  [2:0] i1;
     wire [2:0] out;

    generate_for #(.N(3)) dut (
        .i0(i0),
        .i1(i1),
        .out(out)
    );
initial begin

$monitor("time=%0t  i0=%b  i1=%b  out=%b", $time, i0, i1, out);

        i0 = 3'b000; i1 = 3'b000;
        #10 i0 = 3'b001; i1 = 3'b001;
  
        #10 i0 = 3'b011; i1 = 3'b110;
        #10 i0 = 3'b011; i1 = 3'b010;
        #10 i0 = 3'b110; i1 = 3'b110;

        #10 $finish;
    end
endmodule
