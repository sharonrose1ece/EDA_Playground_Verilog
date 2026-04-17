module d_ff (
    input  wire clk,
    input  wire reset,   
    input  wire d,
    output reg  q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 1'b0;
    else
       q <= d;
end

endmodule


T FF

module t_ff (
    input  wire clk,
    input  wire reset,
    input  wire t,
    output reg  q
);

always @(posedge clk or posedge reset) begin
    if (reset)
    q <= 1'b0;
    else if (t)
    q <= ~q;     // toggle
    else
    q <= q;      // hold
end

end module





module mux4_case (
    input  wire [1:0] sel,
    input  wire [5:2] data,
    output reg        y
);

always @(*) begin
    case (sel)
        2'b00: y = data[2];
        2'b01: y = data[3];
        2'b10: y = data[4];
        2'b11: y = data[5];
        default: y = 1'b0;
    endcase
end

endmodule


module demux1to4_case (
    input  wire       data,
    input  wire [1:0] sel,
    output reg  [3:0] y
);

always @(*) begin
    y = 4'b0000;   

    case (sel) //casex, casez
        2'b00: y[0] = data;
        2'b01: y[1] = data;
        2'b10: y[2] = data;
        2'b11: y[3] = data;
        default: y = 4'b0000;
    endcase
end

endmodule


module encoder4to2_case (
    input  wire [3:0] a,
    output reg  [1:0] y
);
always @(*) begin
    case (a)
        4'b0001: y = 2'b00;
        4'b0010: y = 2'b01;
        4'b0100: y = 2'b10;
        4'b1000: y = 2'b11;
      endcase
end
endmodule


module decoder2to4_case (
    input  wire [1:0] a,
    input  wire       en,
    output reg  [3:0] y
);
always @(*) begin
    y = 4'b0000;
    if (en) begin
        case (a)
            2'b00: y = 4'b0001;
            2'b01: y = 4'b0010;
            2'b10: y = 4'b0100;
            2'b11: y = 4'b1000;
            default: y = 4'b0000;
        endcase
    end
end
endmodule




module tb_simple;


  reg  [1:0] sel;         // mux/demux select
  reg  [3:0] data;        
    wire       y;            // mux output
  mux4_case dut (
    .sel(sel),
    .d0(data[3:0]), .d1(data[1]), .d2(data[2]), .d3(data[3]),
   .y(y)
   );

  

  
  

  initial begin
    $dumpfile("sim.vcd");
    $dumpvars(0, tb_simple);
  end


  initial begin
   
    sel   = 2'b00;
    data= 4'b0000;
    
    data4 = 4'b1010;     
    sel   = 2'b00; #5;
   sel   = 2'b01; #5;
    sel   = 2'b10; #5;
    sel   = 2'b11; #5;
    

        // $display("Final: sel=%b data4=%b y=%b", sel, data4, y);

    $finish;
  end

endmodule
