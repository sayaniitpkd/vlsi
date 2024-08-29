module fibo_tb;
    parameter N = 8;
    reg clock;
    reg async_reset;
    reg sync_reset;
    wire [N-1:0] fibo_out;

    fibo_gen #(
        .N(N)
    ) uut (
        .clk(clock),
        .async_reset(async_reset),
        .sync_reset(sync_reset),
        .fibo_out(fibo_out)
    );

    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    initial begin
        async_reset = 1'b0;
        sync_reset = 1'b1;
        #6 sync_reset = 1'b0;
        #60;
        async_reset = 1'b1;
        #2 async_reset = 1'b0;
        #57;
        $finish;
    end
endmodule
