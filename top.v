module top (
    input btnU, //reset
    input btnC, //input clk
    output [6:0]led
);

//ripple_counter rc ();

modulo_counter mc (.clk(btnC), .en(1'b1), .sel(btnU), .Q0(led[3]), .Q1(led[4]), .Q2(led[5]));

endmodule