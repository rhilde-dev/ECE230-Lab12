module d_flipflop(
    input data,
    input store,
    output reg memory,
    output n_mem
);

    always @(posedge store)begin
        memory <= data;
        
    end
        
    assign n_mem = ~memory;

endmodule