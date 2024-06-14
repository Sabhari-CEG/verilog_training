module code(
    input a,
    input b,
    input c,
    input d,
    input e,
    output v,
    output w,
    output x,
    output y,
    output z
);
wire v,w,x,y,z;
    not(v,a);
    not(w,b);
    not(x,c);
    not(y,d);
    not(z,e);
endmodule

module stimuli;
reg a;
reg b;
reg c;
reg d;
reg e;
wire v;
wire w;
wire x;
wire y;
wire z;

code uut(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .v(v),
    .w(w),
    .x(x),
    .y(y),
    .z(z)
);

initial
begin
a=0;
b=0;
c=0;
d=0;
e=0;
#50 a=1;
#50 b=1;
#50 c=1;
#50 d=1;
#50 e=1;
#100;
end

initial
begin
$display("20 40 60 80 100");
$monitor( "%b %b %b %b %b",z,y,x,w,v);
end 
initial begin
	$dumpfile("out.vcd");
	$dumpvars(1,uut.code);
end
endmodule









