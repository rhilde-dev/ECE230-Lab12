module top (
    input btnU, //reset
    input btnC, //input clk
    output led[6:0]
);

ripple_counter rc ();

modulo_counter mc ();



endmodule