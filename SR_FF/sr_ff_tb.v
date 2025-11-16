module tb();
	reg clk,rst,s,r;
	wire q,qb;
	integer i;
	sr_ff dut(clk,rst,s,r,q,qb);
	
	initial 
	clk = 0;
	always #5 clk = ~clk;
	
	task reset();
		begin
			@(negedge clk)
				rst=0;
			@(negedge clk)
				rst=1;
		end
	endtask

	initial begin
	reset;
	for(i=0;i<4;i=i+1)
		begin
			{s,r}=i;
			#10;
		end
	end
endmodule
