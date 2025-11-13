module modulo_counter( 
    input clk, reset, 
    output [2:0]Y,
    output [2:0]modCountOut
);

//second attempt using dff, fa, and comparator

wire [2:0]Q;
wire [2:0]modOut;

wire cmp;

assign cmp = (Q == 3'b101); //five is 0101 in binary

assign modOutCount = modOut; //data needed to be stored after each count 

//d_flipflop (.data()); make dff to store data from comparator

wire [1:0]carry;

full_adder fa0 (.A(Q[0]), .B(1'b1), .Cin(0), .Cout(carry[0]), .Y(D[0]));
full_adder fa1 (.A(Q[1]), .B(1'b0), .Cin(carry[0]), .Cout(carry[1]), .Y(D[1]));
full_adder fa2 (.A(Q[0]), .B(1'b0), .Cin(carry[1]), .Y(D[2])); //don't do anything with last carry out ig .Cout(carry[0])


//3 sets of dffs
wire [2:0]D; //output of fa and input of dff

wire [2:0] state;

assign state = (reset) ? 3'b000 : (cmp ? 3'b000 : D);

d_flipflop dff0 (.data(state[0]), .reset(reset), .store(1'b1), .memory(Q[0]));
d_flipflop dff1 (.data(state[1]), .reset(reset), .store(1'b1), .memory(Q[1]));
d_flipflop dff2 (.data(state[2]), .reset(reset), .store(1'b1), .memory(Q[2]));

//load enabled sync counter attempt 1

//three_bit_cmp cmp (.in0(Q[0]),.in1(Q[1]),.in2(Q[2]), .out0(Q[0]),.out1(Q[1]),.out2(Q[2]), .modOut(modOut));

//wire [2:0]x_or;
//wire [2:0]enOut;
//wire [2:0]dIn;
//wire [2:0]dOut;

////bit 0
//assign x_or[0] = en ^ dOut[0];
//multiplexer m0 (.A(x_or[0]), .B(1'b0), .Sel(sel), .Enable(1'b1), .Y(dIn[0])); //perhaps give functionality to toggle enable
//d_flipflop d0 (.data(dIn[0]), .store(clk), .memory(dOut[0]));
//assign enOut[0] = en & dOut[0]; //enable for next counter

////bit 1
//assign x_or[1] = enOut[0] ^ dOut[1];
//multiplexer m1 (.A(x_or[1]), .B(1'b0), .Sel(sel), .Enable(1'b1), .Y(dIn[1])); //perhaps give functionality to toggle enable
//d_flipflop d1 (.data(dIn[1]), .store(clk), .memory(dOut[1]));
//assign enOut[1] = en & dOut[1]; //enable for next counter

////bit 2
//assign x_or[2] = enOut[1] ^ dOut[2];
//multiplexer m2 (.A(x_or[2]), .B(1'b0), .Sel(sel), .Enable(1'b1), .Y(dIn[2])); //perhaps give functionality to toggle enable
//d_flipflop d2 (.data(dIn[2]), .store(clk), .memory(dOut[2]));
////assign enOut[2] = en & dOut[2];

////assign output

//assign Q0 = dOut[0];
//assign Q1 = dOut[1];
//assign Q2 = dOut[2];

//assign
endmodule

//module three_bit_cmp ( //sends reset (0) signal if it matches 110 (6) and prints back out current count if no match
//    input in0, in1, in2,
//    output reg out0, out1, out2,
//    output reg [2:0] modOut
//);

//always @ (in1, in2) begin //just check the last 2 bits
//    if (in2 && in1) begin //if both eval to 1 then send reset signal to output
//        out0 <= 1'b0;
//        out1 <= 1'b0;
//        out2 <= 1'b0;
        
//        //send out to store reset
//        modOut[0] <= 1'b0;
//        modOut[1] <= 1'b0;
//        modOut[2] <= 1'b0;

//    end else begin //else send signal back out
//        out0 <= in0;
//        out1 <= in1;
//        out2 <= in2;
        
//        //send out to store current count
//        modOut[0] <= in0;
//        modOut[1] <= in1;
//        modOut[2] <= in2;
//    end
//end
//endmodule


