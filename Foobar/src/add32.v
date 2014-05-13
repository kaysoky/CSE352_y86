`include "add16.v"
`timescale 1ns / 1ns

module add32(input [31:0] A, B, 
             input Cin, 
             output [31:0] Sum);
    wire G, P, C16, Gnull, Pnull;
    assign C16 = G | (P & Cin);
    
    add16 LSBs(Cin, A[15:0], B[15:0], G, P, Sum[15:0]);
    add16 MSBs(C16, A[31:16], B[31:16], Gnull, Pnull, Sum[31:16]);
endmodule