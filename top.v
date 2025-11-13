module top (
    input btnU, //reset
    input btnC, //input clk
    output led[6:0]
);

ripple_counter rc ();

modulo_counter mc (.clk(btnC), .en(1'b1), .sel(btnU), .Q[2:0](.led[5:3]));

endmodule