module tb_non_blocking;
  reg X, clk;
  wire Y2, Z2, y2, z2;
//Y1, Z1, y1, z1; 
  
  //blocking blk_i (
  //  .clk(clk), .X(X), .Y(Y1), .Z(Z1), .y(y1), .z(z1)
  //);

  nonblocking non_blk_i (
    .clk(clk), .X(X), .Y(Y2), .Z(Z2), .y(y2), .z(z2)
  );
  

always #5 clk = ~clk;

initial begin
      clk = 0;
      X   = 0;

      #5  X = 0;
      #5  X = 1;
      #5  X = 1;
      #5  X = 0;
      #10 $finish;
end
initial begin
  $monitor("%t X=%b nonblk: Y=%b Z=%b y=%b z=%b"
           //blk: Y=%b Z=%b y=%b z=%b 
           , $time, X, //Y1, Z1, y1, z1 
           Y2, Z2, y2, z2
          );
end
initial begin
  $dumpfile("wave.vcd");
  $dumpvars(0, tb_non_blocking);
  end
endmodule
