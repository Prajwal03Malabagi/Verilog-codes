module vending_tb;
	reg clk,rst,i,j;
	wire x,y;
	
	vending dut(clk,rst,i,j,x,y);
	
	always #5 clk=~clk;
	
	task reset();
		begin
			@(negedge clk)
				rst=1;
			@(negedge clk)
				rst=0;
		end
	endtask
	
	task inputs(input a,b);
		begin
			@(negedge clk)
			i=a;
			j=b;
		end
	endtask;
	
	
	initial begin
		clk=0;
		reset;
		/*inputs(0,0);
		inputs(0,1);
		inputs(1,0);
		inputs(1,1);
		inputs(1,1);
		inputs(1,1);
		inputs(1,0);
		inputs(1,1);*/
		inputs(1,1);
		inputs(1,1);
		#60 $finish;
	end
endmodule
