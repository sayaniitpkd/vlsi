module fibo_gen #(
    parameter N = 8
)(
    input clk, async_reset, sync_reset,
    output [N-1:0] fibo_out
);

    wire [N-1:0] reg0_out;
    wire [N-1:0] add_out;

    n_bit_adder #(
        .N(N)
    ) adder (
        .a(reg0_out),
        .b(fibo_out),
        .cin(1'b0),
        .sum(add_out),
        .cout()
    );

    n_bit_register #(
        .N(N)
    ) reg0 (
        .d(add_out),
        .clk(clk),
        .async_reset(async_reset),
        .sync_reset(sync_reset),
        .reset_value({{N-1{1'b0}}, 1'b1}),
        .q(reg0_out)
    );

    n_bit_register #(
        .N(N)
    ) reg1 (
        .d(reg0_out),
        .clk(clk),
        .async_reset(async_reset),
        .sync_reset(sync_reset),
        .reset_value({N{1'b0}}),
        .q(fibo_out)
    );
endmodule