
module mux4_1_tb();
  reg a,b,c,d,s0,s1;
  wire y;
  integer i;

  mux4_1 dut(a,b,c,d,s0,s1,y);

  initial begin

    for(i=0;i<64;i=i+1)
      begin
        {a,b,c,d,s0,s1}=i;
        #10
      end
  end
endmodule
