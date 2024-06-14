module binrip(q,clk,reset);
  output q;
  input clk,reset;
  reg q;
  
  always@(negedge clk or posedge reset )
  
  if(reset)
    q=1'b0;
  else
    q=~q;
    
endmodule

module bin(a0,a1,a2,clk,reset);
  output a0,a1,a2;
  input clk,reset;
  
  binrip f0(a0,clk,reset);
  binrip f1(a1,a0,reset);
  binrip f2(a2,a1,reset);
endmodule
module t_binrip;
  reg clk,reset;
  wire a0,a1,a2;
  
  bin b0(a0,a1,a2,clk,reset);
  always #5 clk=~clk;
  initial
    begin 
      $dumpfile("test3.vcd");
      $dumpvars(1,b0.bin);
      $monitor("%b %b %b",a2,a1,a0);
      clk=1'b0;
      reset=1'b1;
      
      #4
      reset =1'b0;
      #75
     
    $finish;
  end 
endmodule