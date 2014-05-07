//*************************************************************
// This is the instruction memory for the y86 processor version 1
// There are 512 locations of 1 byte each	
// This memory is initialized from a file which is given as
// a parameter.  You can change this parameter by right-clicking
// the iram component in the schematic and changing the property
// within the Properties menu.
//*************************************************************

`timescale 1ns / 1ns

module y86_iram
  (input  clk,
    input [31:0] addr,
    output [47:0] data);

   parameter file = "iram.hex";   // Don't edit this here!
   localparam SIZE = 4096;
   
   // The memory array
   reg [7:0] 	      mem[0:SIZE-1] ; // Memory byte array
   
   integer i;
   initial begin
	  for (i=0; i < SIZE; i = i+1) begin
		  mem[i] = 0;
	  end
      $readmemh (file, mem) ;
   end

   assign data = {mem[addr+5], mem[addr+4], mem[addr+3], mem[addr+2], mem[addr+1], mem[addr]};

endmodule
