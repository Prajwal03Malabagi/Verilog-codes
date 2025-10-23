module priority_en(i,y,v);
  input [3:0]i;
  output reg [1:0]y;
  output reg v;
  
  always @(*)begin
    y=0;v=0;
    
    if(i==4'b0000)begin
      v=0;end
    else if(i[3]==1)begin
      y=2'b11;
      v=1;
    end
    else if(i[2]==1)begin
      y=2'b10;
      v=1;
    end
    else if(i[1]==1)begin
      y=2'b01;
    end
    else begin
      y=2'b00;
      v=1;
    end
  end
endmodule
