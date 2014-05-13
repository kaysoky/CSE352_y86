`timescale 1ns / 1ns

module add1(input A, B, Cin,
            output G, P, S);
    assign G = A & B;
    assign P = A ^ B;
    assign S = ( A & ~B & ~Cin) ^ 
               (~A &  B & ~Cin) ^ 
               (~A & ~B &  Cin) ^
               ( A &  B &  Cin);
endmodule