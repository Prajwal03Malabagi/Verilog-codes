module siso_tb();
	reg clk,rst;
	reg [3:0]d;
	wire [3:0]q;
		
	siso dut(d,clk,rst,q);
	
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
	d=4'b0001;
	#50 d=4'b0010;
	end
endmodule
