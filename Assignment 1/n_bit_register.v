module n_bit_register #(
    parameter N = 8
)(
    input [N-1:0] d, clk, async_reset, sync_reset,[N-1:0] reset_value,
    output [N-1:0] q
);
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : d_flip_flop_gen
            d_flip_flop dff (
                .d(d[i]),
                .clk(clk),
                .async_reset(async_reset),
                .sync_reset(sync_reset),
                .reset_value(reset_value[i]),
                .q(q[i])
            );
        end
    endgenerate
endmodule