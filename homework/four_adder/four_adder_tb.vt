module main;
reg signed [3:0] a;
reg signed [3:0] b;
reg signed c;
wire signed [3:0] sum;
wire c_out;

four_adder test(sum, c_out, c, a, b);


initial
begin
    $dumpfile("test_four_adder.vcd");
    $dumpvars(0,main);
    a = 4'b0000;
    b = 4'b0000;
    c = 0;
    repeat(2)begin
	    repeat(16)begin
		    repeat(16)begin   
			$monitor("%dns monitor: a=%b b=%b c=%b sum=%b", $stime, a, b, c, sum);
			#2 b=b+1;
			end
		a=a+1;
        	b=0;
		end
    	a = 4'b0000;
    	b = 4'b0000;
    	c = 1;
	end
end
	



initial #2000 $finish;


endmodule
