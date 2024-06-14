module shiftreg(a,lin,rin,clk,clr,i,select);
  output[3:0]a;
  input lin,rin,clk,clr;
  input[3:0]i;
  input[1:0]select;
  reg[3:0]a;
  
  always@(posedge clk or negedge clk)
  if(~clr)
    a=4'b0000;
  else
    case(select)
      2'b00:a=a;
      2'b01:a={rin,a[3:1]};
      2'b10:a={a[2:0],lin};
      2'b11:a=i;
    endcase
endmodule

module t_shift;
  reg lin,rin,clk,clr;
  reg[3:0]i;
  reg[1:0]select;
  wire[3:0]a;
  
  shiftreg f1(a,lin,rin,clk,clr,i,select);
  always #5 clk=~clk;
  
  initial 
    begin 
      $dumpfile("shift.vcd");
      $dumpvars(1,f1.shiftreg);
      $monitor("%b%b%b%b",a[3],a[2],a[1],a[0]);
      clk=1'b1;
      clr=1'b0;#10
      clr=1'b1;
      
      i=4'b0000;lin=0;rin=1;
      select=2'b00;#30
      repeat(4)#30 select=2'b01;
      repeat(2)#30 select =2'b10;
      select=2'b11;#30
      
      $finish;
    end
/*initial begin
	$dumpfile("out1.vcd");
	$dumpvars(1,uut.code);
end*/
endmodule