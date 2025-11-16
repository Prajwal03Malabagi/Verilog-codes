module tb();
	reg clk,rst,d;
	wire q,qb;
		
	dff dut(clk,rst,d,q,qb);
	
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
	d=1'b0;#10;
	d=1'b1;#10;
	d=1'b0;#10;
	d=1'b1;#10;
	d=1'b1;#10;
	reset;
	d=1'b1;#10;
	end
endmodule
