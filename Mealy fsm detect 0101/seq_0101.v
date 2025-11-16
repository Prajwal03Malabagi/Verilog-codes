module seq_0101(clk,rst,din,dout);
  input clk,rst,din;
  output reg dout;
  
  parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
  reg [1:0]state,n_s;
  
  always @(posedge clk)
    begin
      if(rst)
        state<=s0;
      else 
        state<=n_s;
    end
  always @(*)
    begin
      dout=0;n_s=s0;
      case(state)
        s0:if(din)n_s=s0; else n_s=s1;
        s1:if(din)n_s=s2; else n_s=s1;
        s2:if(din)n_s=s0; else n_s=s3;
        s3:if(din)begin dout=1;n_s=s2; end else n_s=s1;
      endcase
    end
endmodule
