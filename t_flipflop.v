module t_flipflop(
    input t,
    input store,
    input reset,
    output memory,
    output n_mem
);

    wire data;
    wire Q, notQ;
    
    multiplexer mux (.A(Q),.B(notQ),.Enable(1'b1), .Sel(t), .Y(data));

    d_flipflop dflip (.data(data), .reset(reset), .store(store), .memory(Q), .n_mem(notQ));
    
    assign memory = Q;
    assign n_mem = notQ;

endmodule