module d_flip_flop (
    input d, clk, async_reset, sync_reset, reset_value,
    output reg q
);
    always @(posedge clk or posedge async_reset) begin
        if (async_reset)
            q <= reset_value;
        else if (sync_reset)
            q <= reset_value;
        else
            q <= d;
    end
endmodule