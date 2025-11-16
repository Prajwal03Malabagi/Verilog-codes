module siso(clk,rst,din,dout);
  input clk,rst,din;
  output reg dout;
  reg [2:0]q,count;
  
  always@(posedge clk)
    begin
      if(rst)begin
        dout<=0;
      	q<=0;
        count<=0;
      end
      else begin
        count<=count+1;
        if(count<2)
          begin
            q[0]<=din;
            q[1]<=q[0];
            q[2]<=q[1];
            dout<=q[2];
          end
        else if(count>2 && count<4)begin
          dout<=dout;
        end
        else 
          count<=0;
        
      end
    end
endmodule
      
