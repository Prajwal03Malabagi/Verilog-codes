module parallel_adder_tb;
  reg [3:0]a,b;
  reg c;
  wire [3:0]sum;
  wire carry;
  
  parallel_adder dut(a,b,c,sum,carry);
  
  initial begin
    
    for(i=0;i<8;i=i+1)
      begin
        {a,b,c}=i;
        #10;
      end

    
  end
endmodule
