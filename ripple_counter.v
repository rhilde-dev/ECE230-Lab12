module ripple_counter(
    input reset,
    input clk,
    output q[2:0]
);

wire w1, w2;

t_flipflop tff1 (.t(1), .store(clk), .memory(q[0]), .n_mem(w1));
t_flipflop tff2 (.t(1), .store(w1), .memory(q[1]), .n_mem(w2));
t_flipflop tff3 (.t(1), .store(w2), .memory(q[2])); 

//assign q[0] = w1;
//assign q[1] = w2;
//assign q[2] = w3;

endmodule