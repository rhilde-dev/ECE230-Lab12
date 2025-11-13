module modulo_counter( //load enabled sync counter
    input clk, en, sel, 
//    input D[2:0], //not needed as we are just loading zeros
    output Q[2:0],
);

wire [2:0]x_or;
wire [2:0]enOut;
wire [2:0]dIn;
wire [2:0]dOut;

//bit 0
assign x_or[0] = en ^ dOut[0];
multiplexer m0 (.A(x_or[0]), .B(1'b0), .Sel(sel), .Enable(1'b1), .Y(dIn[0])); //perhaps give functionality to toggle enable
d_flipflop d0 (.data(dIn[0]), .store(clk), .memory(dOut[0]));
assign enOut[0] = en & dOut[0];

//bit 1
assign x_or[1] = en ^ dOut[1];
multiplexer m1 (.A(x_or[1]), .B(1'b0), .Sel(sel), .Enable(1'b1), .Y(dIn[1])); //perhaps give functionality to toggle enable
d_flipflop d1 (.data(dIn[1]), .store(clk), .memory(dOut[1]));
assign enOut[1] = en & dOut[1];

//bit 2
assign x_or[2] = en ^ dOut[2];
multiplexer m2 (.A(x_or[2]), .B(1'b0), .Sel(sel), .Enable(1'b1), .Y(dIn[2])); //perhaps give functionality to toggle enable
d_flipflop d2 (.data(dIn[2]), .store(clk), .memory(dOut[2]));
assign enOut[2] = en & dOut[2];

//assign output

assign Q[0] = dOut[0];
assign Q[1] = dOut[1];
assign Q[2] = dOut[2];








endmodule