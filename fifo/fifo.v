module fifo(clk,rst,wr_en,rd_en,din,empty,full,dout);
	input clk,rst,wr_en,rd_en;
	input [7:0]din;
	output empty,full;
	output reg [7:0]dout;

	reg [3:0] wr_ptr,rd_ptr;
	reg [3:0] count=0
	;
	integer i;
	reg [7:0]mem[15:0];

	always @(posedge clk)
	begin
		if(rst)
		begin
			wr_ptr<=0;
			

			for(i=0;i<16;i=i+1)
				mem[i]<=0;
		end
		else if(wr_en && !full)
		begin
			mem[wr_ptr]<=din;
			wr_ptr<=wr_ptr+1;
			count=count+1;
		end
	end

	always @(posedge clk)
	begin
		if(rst)
			rd_ptr<=0;


		else if(rd_en && !empty)
		begin
			dout<=mem[rd_ptr];
			rd_ptr<=rd_ptr+1;
			count=count-1;
		end

	end

	assign full=(count==4'b1111);
	assign empty=(count==4'b0000);
endmodule
