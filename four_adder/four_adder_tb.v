module main;
reg signed [3:0] a;
reg signed [3:0] b;
wire signed [3:0] sum;
wire c_out;

four_adder test(sum, c_out, 1'b0, a, b);


initial
begin
    $dumpfile("test_four_adder.vcd");
    $dumpvars(0,main);
    a = 4'b0000;
    b = 4'b0000;
    repeat(16)begin
        repeat(16)begin   
            $monitor("%dns monitor: a=%b b=%b sum=%b", $stime, a, b, sum);
            #2 b=b+1;
        end
        a=a+1;
        b=0;
    end

end



initial #2000 $finish;


endmodule