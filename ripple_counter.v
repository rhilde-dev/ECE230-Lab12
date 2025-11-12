module ripple_counter(
    input reset,
    input clk,
    output q[2:0]
);

wire w1, w2, w3;

t_flipflop tff1 (.clk(clk), .reset(reset), .t(1'b1), .q(w1));
t_flipflop tff2 (.clk(w1), .reset(reset), .t(1'b1), .q(w2));
t_flipflop tff3 (.clk(w2), .reset(reset), .t(1'b1), .q(w3));


//assign w1

endmodule