module parallel_adder(a,b,c,sum,carry);
  wire c1,c2,c3;
  input [3:0]a,b;
  input c;
  output reg[3:0]sum;
  output reg carry;
  
  full dut1(a[0],b[0],c,sum[0],c1);
  full dut2(a[1],b[1],c1,sum[1],c2);
  full dut3(a[2],b[2],c2,sum[2],c3);
  full dut4(a[3],b[3],c3,sum[3],carry);
endmodule
 

module full(a,b,c,sum,carry);
  input a,b,c;
  output sum,carry;
  
  assign sum=a^b^c;
  assign carry=a&b | b&c | c&a;
endmodule
