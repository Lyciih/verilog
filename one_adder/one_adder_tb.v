module one_adder_tb;

reg a,b,c_in;
wire s,c_out;

one_adder test(s,c_out,c_in,a,b);


initial begin
    $dumpfile("test_one_adder.vcd");
    $dumpvars(0,one_adder_tb);
    #2 c_in=1'b0;  a=1'b0;  b=1'b0;
    #2 c_in=1'b0;  a=1'b1;  b=1'b0;
    #2 c_in=1'b0;  a=1'b0;  b=1'b1;
    #2 c_in=1'b0;  a=1'b1;  b=1'b1;
    #2 c_in=1'b1;  a=1'b0;  b=1'b0;
    #2 c_in=1'b1;  a=1'b1;  b=1'b0;
    #2 c_in=1'b1;  a=1'b0;  b=1'b1;
    #2 c_in=1'b1;  a=1'b1;  b=1'b1;

    #20 $finish;

end
    

endmodule