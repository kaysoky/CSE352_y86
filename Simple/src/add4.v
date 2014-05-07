`include "add1.v"
`include "cla4.v"
`timescale 1ns / 1ns

module add4(input [3:0] A, B, 
            input Cin,
            output BG, BP, 
            output [3:0] S);
    wire [3:0] Gs, Ps, Cs;
    
    cla4 CLA(Gs, Ps, Cin, BG, BP, Cs);
    add1 Adders[3:0](A, B, Cs, Gs, Ps, S);
endmodule