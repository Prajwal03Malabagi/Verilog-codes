module sff(clk,rst,s,r,q,qb);
	input clk,rst,s,r;
	output reg q;
	output qb;
	
	always @(posedge clk,negedge rst)begin
		if(~rst)
			q<=0;
		else 
			case({s,r})
				2'b00:q<=q;
				2'b01:q<=0;
				2'b10:q<=1;
				default:q<=1'bx;
			endcase
	end
	assign qb=~q;
endmodule
