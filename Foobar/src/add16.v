`include "add4.v"
`timescale 1ns / 1ns

module add16(input Cin, 
             input [15:0] A, B, 
             output BG, BP, 
             output [15:0] Sum);
    wire [3:0] Gs, Ps, Cs;
    
    cla4 CLA(Gs, Ps, Cin, BG, BP, Cs);
    add4 Adders[3:0](A, B, Cs, Gs, Ps, Sum);
endmodule