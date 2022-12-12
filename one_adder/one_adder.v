module one_adder(sum,c_out,c_in,a,b);
input c_in,a,b;
output sum,c_out;
wire d,e,f;


xor a_xor_b(d,a,b),
    a_xor_b_xor_c(sum,d,c_in);
and a_and_b(e,a,b),
    a_xor_b_and_c(f,d,c_in);
or  out(c_out,e,f);

endmodule

