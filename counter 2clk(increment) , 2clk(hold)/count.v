module count(clk,rst,q);
  input clk,rst;
  output reg [3:0] q;
  reg [2:0]count;
  
  always@(posedge clk)
    begin
      if(rst)begin
        q<=0;
        count<=0;end
      else begin
        if(count<2)begin
        q<=q+1;
        count<=count+1;end
        else if(count>=2 && count<3)begin
        q<=q;count<=count+1;
      end
      else begin
        q<=q+1;count<=0;end
    end
    end
endmodule
