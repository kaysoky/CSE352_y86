//-----------------------------------------------------------------------------
//
// Title       : 2-1 mux
// Design      : Y86 Processor
// Author      : Carl Ebeling
// Company     : UW
//
//-----------------------------------------------------------------------------
`timescale 1ns / 1ns

module mux2
  #(parameter N = 32)
   (input [N-1:0] in0, in1,
    input S,
    output [N-1:0] out);

   assign out = S ? in1 : in0;
endmodule // mux2
