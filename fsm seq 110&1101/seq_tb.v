module seq_tb;
  reg clk,rst,din;
  wire dout;
  
  seq dut(clk,rst,din,out);
  
  always #5 clk=~clk;
  
  task reset();
    begin
      @(negedge clk)rst=0;
      @(negedge clk)rst=1;
    end
  endtask
  
  task data(input a);
    begin
      @(negedge clk)din=a;
    end
  endtask
  
  initial begin
    $dumpfile("seq.vcd");
    $dumpvars(0);
    
    clk=0;reset;data(0);
    data(0);data(1);
    data(1);data(0);
    data(1);data(1);
    data(0);
    data(1);
  end
  
  initial $monitor($time,"din=%0d,dout=%0d",din,dout);
endmodule
