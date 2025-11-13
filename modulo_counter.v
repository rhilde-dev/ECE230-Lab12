module modulo_counter( 
    input clk, en, sel, 

    output [2:0]Q,
    output modCountOut[2:0]
);

//second attempt using dff, fa, and comparator

wire [2:0]Q;
wire modOut[2:0];

//TODO: figure out why modOut can't be accessed directly
three_bit_cmp cmp (.in0(Q[0]),.in1(Q[1]),.in2(Q[2]), .out0(Q[0]),.out1(Q[1]),.out2(Q[2]), .modOut(modOut));

full_adder fa0 (.A(Q[0]), .B(en), .Cin(0), .Cout);

//full_adder fa0 ();

//full_adder fa0 ();





//load enabled sync counter attempt 1

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

module three_bit_cmp ( //sends reset (0) signal if it matches 110 (6) and prints back out current count if no match
    input in0, in1, in2,
    output reg out0, out1, out2,
    output reg modOut[2:0]
);

always @ (in1, in2) begin //just check the last 2 bits
    if (in2 && in1) begin //if both eval to 1 then send reset signal to output
        out0 <= 1'b0;
        out1 <= 1'b0;
        out2 <= 1'b0;
        
        //send out to store reset
        modOut[0] <= 1'b0;
        modOut[1] <= 1'b0;
        modOut[2] <= 1'b0;

    end else begin //else send signal back out
        out0 <= in0;
        out1 <= in1;
        out2 <= in2;
        
        //send out to store current count
        modOut[0] <= in0;
        modOut[1] <= in1;
        modOut[2] <= in2;
    end
end
endmodule