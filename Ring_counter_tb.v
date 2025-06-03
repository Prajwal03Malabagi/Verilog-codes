module ring_counter_tb;
  reg clk,rst;
  wire [3:0]q;
  
  ring_counter dut(clk,rst,q);
  
  always #5 clk=~clk;
  
  initial begin
    clk=0;
    rst=1;
    
    #5; rst=0;
    
    #100; $finish;
  end
  
  initial begin
    $display(" time \t clk \t rst\t q\t");
    $monitor("%0t, %d, %d, %b", $time,clk,rst,q);
  end
endmodule
