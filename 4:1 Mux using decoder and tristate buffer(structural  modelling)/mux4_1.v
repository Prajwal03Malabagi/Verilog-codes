module mux_decoder(a,b,d,y);
  input a,b;
  input [3:0]d;
  output y;
  wire [3:0]m;
  
  decoder dut1(a,b,m);
  tri_state dut2(d[0],m[0],y);
  tri_state dut3(d[1],m[1],y);
  tri_state dut4(d[2],m[2],y);
  tri_state dut5(d[3],m[3],y);
  
endmodule

module decoder(a,b,m);
  input a,b;
  output reg [3:0]m;
  
  always @(*)begin
    case({a,b})
      2'b00:m=4'b0001;
      2'b01:m=4'b0010;
      2'b10:m=4'b0100;
      2'b11:m=4'b1000;
    endcase
  end
endmodule

module tri_state(d,en,y);
  input d,en;
  output reg y;
  
  always @(*) begin
    if(en)
      y=d;
    else
      y=1'dz;
  end
endmodule
