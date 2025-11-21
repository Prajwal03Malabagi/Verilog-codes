module ram(clk,rst,wr_en,rd_en,wr_addr,rd_addr,din,dout);
  parameter width=16,depth=64,size=6;
  input clk,rst,wr_en,rd_en;
  input [size-1:0]wr_addr,rd_addr;
  input [width-1:0]din;
  output reg [width-1:0]dout;
  integer i;
  
  
  reg [width-1:0]mem[(depth-1):0];
  
  always@(posedge  clk)
    begin
      if(rst)
        for(i=0;i<depth;i=i+1)
          mem[i]<=0;
      else
        begin
          if(wr_en)
            begin
              mem[wr_addr]<=din;
            end
        end
    end
  always@(posedge clk)
    begin
      if(rst)
        dout<=0;
      else
        if(rd_en)
          dout<=mem[rd_addr];
    end
endmodule
