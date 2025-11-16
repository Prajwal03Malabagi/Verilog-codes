module siso(d,clk,rst,q);
	input [3:0]d;
	input clk,rst;
	output [3:0]q;
	
	dff dut1(d[0],clk,rst,q[0]);
	dff dut2(q[0],clk,rst,q[1]);
	dff dut3(q[1],clk,rst,q[2]);
	dff dut4(q[2],clk,rst,q[3]);
endmodule

module dff(d,clk,rst,q);
	input d,clk,rst;
	output reg q;
	
	always@(posedge clk)
	begin
		if(rst)
			q<=0;
		else
			q<=d;
	end
endmodule
