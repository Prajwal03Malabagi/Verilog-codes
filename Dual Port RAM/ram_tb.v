module top_tb;
    parameter width=64,depth=16,size=4;
  reg clk,rst,wr_en,rd_en;
  reg [size-1:0]wr_addr,rd_addr;
  reg [width-1:0]din;
  wire [width-1:0]dout;
    

  
  ram dut(clk,rst,wr_en,rd_en,wr_addr,rd_addr,din,dout);
  
  always #5 clk=~clk;
  
  task reset();
    begin
      @(negedge clk)rst=1;
      @(negedge clk)rst=0;
    end
  endtask
  
  task write(input a,input [size-1:0]b,input[width-1:0]c);
    begin
      @(negedge clk)
      wr_en=a;
      wr_addr=b;
      din=c;
    end
  endtask
  
  task read(input a,input[size-1:0]b);
    begin
      @(negedge clk)
      rd_en=a;
      rd_addr=b;
    end
  endtask
  
  initial begin
    $dumpfile("ram.vcd");
    $dumpvars(0);
    
    clk=0;
    reset;
    write(1,4'd5,64'd55);
    read(1,4'd5);
    
    #100 $finish;
  end
endmodule
