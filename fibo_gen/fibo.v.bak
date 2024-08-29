module fibo_gen(
    input wire rst,        
    input wire clk,       
    output reg [7:0] fibo_out
);

    
    reg [7:0] reg0_out; 
    wire [7:0] add_out; 

    assign add_out = reg0_out+fibo_out;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            reg0_out <= 8'd1;
            fibo_out <= 8'b0; 
        end else begin
            reg0_out <= add_out;
            fibo_out <= reg0_out;
        end
    end
endmodule

