module multiplexer(
    input A, B, 
    input Enable,
    input Sel,
    output Y
    );
    
    assign Enable = 1'b1;
    
    assign Y = (Sel == 1'b0) && Enable ? A :
               B;

endmodule