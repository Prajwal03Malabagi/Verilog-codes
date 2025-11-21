module tb();
	reg clk,rst,load,mod;
	reg [3:0]d;
	wire [3:0]q;
		
	count_load dut(clk,rst,d,load,mod,q);
	
	initial 
	clk = 0;
	always #5 clk = ~clk;
	
	task inputs();
		begin
			@(negedge clk)
				load=1;
			@(negedge clk)
				load=0;
		end
	endtask
	
	task reset();
		begin
			@(negedge clk)
				rst=1;
			@(negedge clk)
				rst=0;
		end
	endtask

	initial begin
		reset;
		d=4'b0011;
		mod=1;
		inputs();
		#50;
		d=4'b0111;
		mod=0;
		inputs();
	
	
		end
endmodule
