module mux4(a,b,c,d,s0,s1,y);
  input a,b,c,d,s0,s1;
  output y;
  wire y0,y1;
  
  mux dut1(a,b,s0,y0);
  mux dut2(c,d,s0,y1);
  mux dut3(y0,y1,s1,y);
endmodule

module mux(a,b,s,y);
  input a,b,s;
  output reg y;
  
  always @(*)begin
    if(s)
      y<=b;
    else
      y<=a;
  end
endmodule
