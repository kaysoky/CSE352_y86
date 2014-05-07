//-----------------------------------------------------------------------------
//
// Title       : Edge-triggered register with reset
// Design      : Y86 Processor
// Author      : Carl Ebeling
// Company     : UW
//
//-----------------------------------------------------------------------------

`timescale 1ns / 1ns

module register
  #(parameter N = 32)
   (input clk, reset,
    input [N-1:0] D,
    output reg [N-1:0] Q);

   always @ (posedge clk)
     if (reset) Q <= 32'h0;
     else       Q <= D;

endmodule // register

   