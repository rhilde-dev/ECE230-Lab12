module d_flipflop(
    input data,
    input store,
    input reset,
    output reg memory,
    output n_mem
);

    always @(posedge store, posedge reset)begin
       if (reset)begin
        memory <= 1'b0;
       end else begin
        memory <= data;
       end
       
        
    end
        
    assign n_mem = ~memory;

endmodule