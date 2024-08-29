module tb;
    reg clock;
    reg rst;
    wire [7:0] fibo_out;

    fibo_gen uut (
        .clk(clock),
        .rst(rst),
        .fibo_out(fibo_out)
    );
    initial begin
        clock = 0;
        forever #5 clock = ~clock; 
    end
    initial begin
        rst = 1'b1;
	#1 rst = 1'b0;
	#100;
        $finish;
    end
    initial begin
        $monitor("At time %t, fibo_out = %d", $time, fibo_out);
    end
endmodule
