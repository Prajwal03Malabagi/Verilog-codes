module add_tb;

  reg a,b,c;
  wire s,cout;
  
  adder f1(a,b,c,s,cout)

  initial begin
    $dumpfile ("add_tb.vcd");
    $dumpvars(0,add_tb.vcd);
    a=0;b=0;c=0;
    @10
    a=0;b=0;c=1;#10
    a=0;b=1;c=0;#10
    a=0;b=1;c=1;#10
    a=1;b=0;c=0;#10
    a=1;b=0;c=1;#10
    a=1;b=1;c=0;#10
    a=1;b=1;c=1;
  end
endmodule
