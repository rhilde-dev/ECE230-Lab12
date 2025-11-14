module top (
    input btnU, //reset
    input btnC, //input clk
    output [6:0]led
);

//ripple_counter rc ();

modulo_counter mc (.clk(btnC), .en(1'b1), .sel(btnU), .Y[0](led[3]), .Y[1](led[4]), .Y[2](led[5]));

endmodule