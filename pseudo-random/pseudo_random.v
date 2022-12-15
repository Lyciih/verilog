module mux(output out, input a,input b, input f);
wire c1,c2;

and (c1, a, f),
    (c2, b, ~f);
or  (out, c1, c2);
endmodule



module latch(output out, output out2, input a, input f, input reset);
wire c0,c1,c2;
and  (c1,a,~reset);
or  (c0,f,reset);
mux g1(out, c1, c2, c0);
not (out2, out),
    (c2, out2);
endmodule

module flip_flop(output out, input a, input f, input reset);
wire c1,c2,c3,c4;

not     (c1,f),
        (out,c3);
latch   g1(, c2, a, c1, 1'b0),
        g2(c3, out, c2, f, reset);
endmodule




module pseudo_random(output [0:2] Q, input clk, input reset);
wire c1;
flip_flop   g1(Q[0], c1, clk, reset),
            g2(Q[1], Q[0], clk, reset),
            g3(Q[2], Q[1], clk, reset);
xor         (c1, Q[2], Q[0]);

endmodule


/*
module main;

reg f_mux,a_mux,b_mux;
wire out_mux;
mux test_mux(out_mux, a_mux, b_mux, f_mux);

reg f_latch, a_latch, reset_latch;
wire out_latch, out_latch_n;
latch test_latch(out_latch, out_latch_n, a_latch, f_latch, reset_latch);

reg clk_flip_flop, a_flip_flop, reset_flip_flop;
wire out_flip_flop;
flip_flop test_flip_flop(out_flip_flop, a_flip_flop, clk_flip_flop, reset_flip_flop);

reg clk_pseudo_random, reset_pseudo_random;
wire [0:2] out_pseudo_random;
pseudo_random test_pseudo_random(out_pseudo_random, clk_pseudo_random, reset_pseudo_random);


initial
begin
    $dumpfile("test_pseudo_random.vcd");
    $dumpvars(0,main);
    /*
    $display("\ntest mux\n");
    f_mux = 0;
    a_mux = 0;
    b_mux = 0;

    #10 a_mux = 1;
    #10 f_mux = 1;
    #10 b_mux = 1;
    #10 a_mux = 0;
    #10 f_mux = 0;


    $display("\ntest latch\n");
    f_latch = 0;
    a_latch = 0;
    reset_latch = 0;

    #10 a_latch = 1;
    #10 f_latch = 1;
    #10 f_latch = 0;
    #10 a_latch = 0;
    #10 f_latch = 1;
    #10 f_latch = 0;
    #10 reset_latch = 1;
    $display("a_latch = %b   f_latch = %b   out_latch = %b   out_latch_n = %b   reset_latch = %b", a_latch, f_latch, out_latch, out_latch_n, reset_latch);


    $display("\ntest flip_flop\n");
    clk_flip_flop = 0;
    a_flip_flop = 0;
    reset_flip_flop = 0;

    #10 clk_flip_flop = 1;
    #10 clk_flip_flop = 0;
    #10 a_flip_flop = 1;

    #10 clk_flip_flop = 1;
    #10 a_flip_flop = 0;

    #10 clk_flip_flop = 0;
    #10 a_flip_flop = 0;

    #10 clk_flip_flop = 1;
    #10 a_flip_flop = 1;
    #10 clk_flip_flop = 0;

    #10 reset_flip_flop = 1;

    $display("\ntest pseudo_random\n");
    
    clk_pseudo_random = 0;
    reset_pseudo_random = 0;

    #10 reset_pseudo_random = 1;
    #10 reset_pseudo_random = 0;

    #10 clk_pseudo_random = 1;
    #10 clk_pseudo_random = 0;

    #10 clk_pseudo_random = 1;
    #10 clk_pseudo_random = 0;

    #10 clk_pseudo_random = 1;
    #10 clk_pseudo_random = 0;

    #10 clk_pseudo_random = 1;
    #10 clk_pseudo_random = 0;

    #10 clk_pseudo_random = 1;
    #10 clk_pseudo_random = 0;

    #10 clk_pseudo_random = 1;
    #10 clk_pseudo_random = 0;

    #10 clk_pseudo_random = 1;
    #10 clk_pseudo_random = 0;

    #10 clk_pseudo_random = 1;
    #10 clk_pseudo_random = 0;

    #10 reset_pseudo_random = 1;
    #10 reset_pseudo_random = 0;




end


always @(a_mux or b_mux or f_mux) begin
    $monitor("a_mux = %b   b_mux = %b   f_mux = %b   out_mux = %b", a_mux, b_mux, f_mux, out_mux);   
end

always @(a_latch or f_latch or reset_latch) begin
    $monitor("a_latch = %b   f_latch = %b   out_latch = %b   out_latch_n = %b   reset_latch = %b", a_latch, f_latch, out_latch, out_latch_n, reset_latch);   
end

always @(a_flip_flop or clk_flip_flop or reset_flip_flop) begin
    $monitor("a_flip_flop = %b   clk_flip_flop = %b   out_flip_flop = %b   reset_flip_flop = %b", a_flip_flop, clk_flip_flop, out_flip_flop, reset_flip_flop);   
end

always @(clk_pseudo_random or reset_pseudo_random) begin
    $monitor("clk_pseudo_random = %b   out_pseudo_random = %b   reset_pseudo_random = %b", clk_pseudo_random, out_pseudo_random, reset_pseudo_random);   
end

endmodule
*/