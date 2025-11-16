module tb();
	reg clk,rst,t;
	wire q,qb;
		
	tff dut(clk,rst,t,q,qb);
	
	initial 
	clk = 0;
	always #5 clk = ~clk;
	
	task reset();
		begin
			@(negedge clk)
				rst=1;
			@(negedge clk)
				rst=0;
		end
	endtask

	initial begin
	//clk = 0;
	reset;
	t=1'b0;#10;
	t=1'b1;#10;
	t=1'b0;#10;
	t=1'b1;#10;
	t=1'b1;#10;
	reset;
	t=1'b1;#10;
	end
endmodule
