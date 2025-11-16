module seq(clk,rst,din,dout);
  input clk,rst,din;
  output reg dout;
  
  parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
  reg[1:0]state,out;
  
  always @(posedge clk)begin
    if(rst)
      state<=0;
  	else 
      state<=out;
  end
  
  always @(*)begin
    out=s0;dout=0;
    case(state)
      s0:if(din) out=s1;else out=s0;
      s1:if(din) out=s2;else out=s0;
      s2:if(din) out=s2;else begin dout=1;out=s3;end
      s3:if(din) begin dout=1;out=s2 ;end else out=s0;
     // default :out=s0;
    endcase
  end
  
endmodule
