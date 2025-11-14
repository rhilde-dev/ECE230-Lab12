module top (
    input btnU, //reset
    input btnC, //input clk
    output [6:0]led
);

ripple_counter rc (.clk(btnC), .reset(btnU), .q(led[2:0]));

modulo_counter mc (.clk(btnC), .reset(btnU), .Y(led[5:3]), .modCountOut(led[6]));

endmodule