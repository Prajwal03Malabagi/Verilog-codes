module siso_tb;
  reg clk,rst,din;
  wire dout;
  
  siso dut(clk,rst,din,dout);
  
  always #5clk=~clk;
  
  task reset();
    begin
      @(negedge clk)rst=1;
      @(negedge clk)rst=0;
    end
  endtask
  
  task data(input in);
    begin
      @(negedge clk) din=in;
    end
  endtask
  
  task intialize();
    begin
      din=0;
    end
  endtask
  
  initial begin
    $dumpfile("siso.vcd");
    $dumpvars(0);
    clk=0;
   // intialize;
    reset;
    data(1);
    data(0);
    data(1);
    data(0);
    
    #100 $finish;
  end
  
  initial $monitor($time,"clk=%0d,rst=%0d,din=%0d,dout=%0d",clk,rst,din,dout);
endmodule
