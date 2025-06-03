module add(a,b,c,s,cout)

  input a,b,c;
  output s,cout;
  
  assign s=a^b^c;
  assign cout=a&b+c&(a^b);
end
