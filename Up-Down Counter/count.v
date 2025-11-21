module count_load(clk,rst,d,load,mod,q);
	input clk,rst,load,mod;
	input [3:0]d;
	output reg [3:0]q;
	
	always @(posedge clk)
	begin
		if(rst)
			q<=0;
		else if(load)
			q<=d;
		else if (mod)
			q<=q+1;
		else 
			q<=q-1;
	end
endmodule
