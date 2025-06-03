module halfadder_tb;
  reg a,b;
  wire s,c;

  halfadder a1(a,b,s,c);

  initial begin
    $dumpfile("halfadder_tb.vcd");
    $dumpvars(0,halfadder_tb);
    a=0;b=0;
    #10 a=0;b=1;
    #10 a=1;b=0;
    #10 a=1;b=1;
  end
endmodule
