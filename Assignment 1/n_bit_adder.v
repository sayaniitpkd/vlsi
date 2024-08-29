module n_bit_adder #(
    parameter N = 8
)(
    input [N-1:0] a, [N-1:0] b, cin,
    output [N-1:0] sum, cout
);
    wire [N:0] carry;
    assign carry[0] = cin;
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : full_adder_gen
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate
    assign cout = carry[N];
endmodule