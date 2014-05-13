`timescale 1ns / 1ns

module cla4(input [3:0] G, P, 
            input Cin,
            output BG, BP, 
            output [3:0] Cout);
    assign Cout[0] = Cin;
    assign Cout[1] = G[0] | (P[0] & Cout[0]);
    assign Cout[2] = G[1] | (P[1] & Cout[1]);
    assign Cout[3] = G[2] | (P[2] & Cout[2]);
    assign BG = G[3] | 
               (G[2] & P[3]) | 
               (G[1] & P[3] & P[2]) | 
               (G[0] & P[3] & P[2] & P[1]);
    assign BP = &P;
endmodule