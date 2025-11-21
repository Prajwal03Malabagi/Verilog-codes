module fifo_tb;
	reg clk,rst,wr_en,rd_en;
	reg [7:0] din;
	wire full,empty;
	wire [7:0] dout;
	integer i,j;
	fifo dut(clk,rst,wr_en,rd_en,din,full,empty,dout);
	
	always #5 clk=~clk;

	task reset();
		begin
			@(negedge clk) rst=1;
			@(negedge clk) rst=0;
		end
	endtask

	task write(input wr,input [7:0]a);
		begin
			wr_en=wr;
			@(negedge clk) din=a;
		end
	endtask

	task read(input rd);
		begin
			rd_en=rd;
		end
	endtask

	initial begin

		clk=0;
		reset;
		for(i=0;i<6;i=i+1)
			#10 write(1,{$random}%128);
		for(j=0;j<6;j=j+1)
			#10 read(1);
		#10 $finish();

	end
endmodule
