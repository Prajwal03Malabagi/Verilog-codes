module divide(clk,rst,out1,out2,out3);
	input clk,rst;
  output out1,out2,out3;
  
  reg [2:0]count,count1;
  
  reg a,b,c;
  
  always@(posedge clk)
    begin
      if(rst)begin
        count<=0;
        count1<=0;
      end
      else begin
        if(count<4 && count1<4)begin
          count<=count+1;
          count1<=count1+1;
        end
        else begin
          count<=0;
          count1<=0;
        end
      end
    end
  always @(negedge clk)begin
    a<=count[1];
  end
  
  assign out1=count[2]|a;
  assign out2=count1[2];
  assign out3=count1[1];
endmodule
      
  
