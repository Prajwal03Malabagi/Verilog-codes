module tff(clk,rst,t,q,qb);
	input clk,rst,t;
	output q,qb;
	wire w1;
	
	xor n1(w1,q,t);
	dff dut(clk,rst,w1,q,qb);
endmodule

module dff(clk,rst,d,q,qb);
	input clk,rst,d;
	output reg q;
	output qb;

	always @(posedge clk)begin
		if(rst)
			q<=0;
		else 
			q<=d;
	end
	assign qb=~q;
endmodule
