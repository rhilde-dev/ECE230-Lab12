module ripple_counter(
    input reset,
    input clk,
    output [2:0]q
);

wire w1, w2;

t_flipflop tff1 (.t(1), .reset(reset), .store(clk), .memory(q[0]), .n_mem(w1));
t_flipflop tff2 (.t(1), .reset(reset), .store(w1), .memory(q[1]), .n_mem(w2));
t_flipflop tff3 (.t(1), .reset(reset), .store(w2), .memory(q[2])); 

endmodule