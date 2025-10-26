module mux4_1(a, b, c, d, s0, s1, y);
  input a, b, c, d;
  input s0, s1;
  output reg y;

  always @(*) begin
    case ({s1, s0})
      2'b00: y = a;
      2'b01: y = b;
      2'b10: y = c;
      2'b11: y = d;
    endcase
  end
endmodule
