module divide_tb;
  reg clk,rst;
  wire out1,out2,out3;
  
  divide dut(clk,rst,out1,out2,out3);
  
  always #5clk=~clk;
  
  task reset();
    begin
      @(negedge clk)rst=1;
      @(negedge clk)rst=0;
    end
  endtask
  
  initial begin
    $dumpfile("dum.vcd");
    $dumpvars(0);
    
    clk=0;
    reset;
    
    #100$finish;
  end
endmodule
