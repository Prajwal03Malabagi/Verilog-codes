module seq_tb;
  reg clk,rst,in;
  wire dout;
  
  seq_0101 dut(clk,rst,in,dout);
  
  always #5 clk=~clk;
  
  task reset();
    begin
      @(negedge clk)rst=1;
      @(negedge clk)rst=0;
    end
  endtask
  
  task din(input a);
    begin
      @(negedge clk)in=a;
    end
  endtask 
  
  initial begin
    $dumpfile("seq.vcd");
    $dumpvars(0);
    clk=0;
    reset;
    din(1);
    din(1);
    din(0);
    din(1);
    din(0);
    din(1);
    din(0);
    din(1);
    din(0);
    din(0);
    $finish;
  end
endmodule
