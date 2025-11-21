module vending(clk,rst,i,j,x,y);
	input clk,rst,i,j;
	output x,y;
	
	parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
	
	reg [2:0]state, n_s;

		always @(posedge clk)
	begin
		if(rst)
			state<=s0;
		else 
			state<=n_s;
	end

	
	always @(*) 
	begin
		n_s=s0;
		case(state)
			s0:if({i,j}==2'b11) n_s=s2;
				else if({i,j}==2'b10) n_s=s1;
				else n_s=s0;
			s1:if({i,j}==2'b11) n_s=s3;
				else if({i,j}==2'b10) n_s=s2;
				else n_s=s1;
			s2:if({i,j}==2'b11) n_s=s4;
				else if({i,j}==2'b10) n_s=s3;
				else n_s=s2;
			s3:n_s=s0;
			s4:n_s=s0;
		endcase
	end
	
	
	assign x=(state==s4 || state==s3);
	assign y=(state==s4);
endmodule
