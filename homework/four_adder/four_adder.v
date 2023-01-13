module one_adder(output sum, output c_out,input c_in,input a,input b);
wire d,e,f;

xor g1(d,a,b);
xor g2(sum,d,c_in);
and g3(e,a,b);
and g4(f,d,c_in);
or  g5(c_out,e,f);

endmodule







module four_adder(output [3:0] sum,output c_out,input c_in,input [3:0] a,input [3:0] b);
wire    [2:0]   temp;

one_adder e(sum[0],temp[0],c_in,a[0],b[0]);
one_adder f(sum[1],temp[1],temp[0],a[1],b[1]);
one_adder g(sum[2],temp[2],temp[1],a[2],b[2]);
one_adder h(sum[3],c_out,temp[2],a[3],b[3]);


endmodule

