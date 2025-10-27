module skip(a,b,c,s,carry);
	input [3:0]a,b;
	input c;
	output [3:0]s;
	output carry;
	wire c1,c2,c3,c4,w1,w2,w3,w4,sel;

	assign w1=a[0]^b[0];
	assign w2=a[1]^b[1];
	assign w3=a[2]^b[2];
	assign w4=a[3]^b[3];
	assign sel=w1&w2&w3&w4;

	full dut1(a[0],b[0],c,s[0],c1);
	full dut2(a[1],b[1],c1,s[1],c2);
	full dut3(a[2],b[2],c2,s[2],c3);
	full dut4(a[3],b[3],c3,s[3],c4);
	mux dut5(c4,c,sel,carry);
endmodule
	



module full(a,b,c,s,carry);
	input a,b;
	input c;
	output s,carry;

	assign s=a^b^c;
	assign carry=(a&b)|(c&b)|(c&a);
endmodule

module mux(a,b,s,y);
	input a,b,s;
	output y;

	assign y=s?b:a;
endmodule
	
