module tb_array_buf;

    reg  [2:0] in;
    wire [2:0] out;

 
  array_buf array_i (.in(in), .out(out));

initial begin
      $monitor("time=%0t  in=%b  out=%b", $time, in, out);
	in = 3'b000;
        #10 in = 3'b001;
        #10 in = 3'b010;
        #10 in = 3'b011;
        #10 in = 3'b100;
        #10 in = 3'b101;
        #10 in = 3'b110;
        #10 in = 3'b111;
     #10;

      $finish;
    end

endmodule
