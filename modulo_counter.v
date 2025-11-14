module modulo_counter( 
    input clk, reset, 
    output [2:0]Y,
    output modCountOut
);

wire [2:0] D; //The data going into the register
wire [2:0] state; //Either send 3'b000 or the D data

assign state = (reset) ? 3'b000 : ((Q[2] && Q[0]) ? 3'b000 : D);

//3 bit register
d_flipflop dff0 (.data(state[0]), .reset(reset), .store(clk), .memory(Q[0]));
d_flipflop dff1 (.data(state[1]), .reset(reset), .store(clk), .memory(Q[1]));
d_flipflop dff2 (.data(state[2]), .reset(reset), .store(clk), .memory(Q[2]));

wire [2:0] Q; //Output of the register
wire [1:0]carry; //Cout going to each FA

assign Y[0] = Q[0];
assign Y[1] = Q[1];
assign Y[2] = Q[2];


//3 bit FA
full_adder fa0 (.A(Q[0]), .B(1'b1), .Cin(0), .Cout(carry[0]), .Y(D[0]));
full_adder fa1 (.A(Q[1]), .B(1'b0), .Cin(carry[0]), .Cout(carry[1]), .Y(D[1]));
full_adder fa2 (.A(Q[2]), .B(1'b0), .Cin(carry[1]), .Y(D[2])); //don't do anything with last carry out ig .Cout(carry[0])

wire toggle;
assign toggle = Q[0] & Q[2];

t_flipflop tff (.t(toggle), .store(clk), .memory(modCountOut)); //tff at the end

endmodule
