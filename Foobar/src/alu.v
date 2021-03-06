`include "add32.v"
`timescale 1ns / 1ns

module alu(input [31:0] valA, valB, 
           input [1:0] OP, 
           output reg [31:0] valE);
    wire [31:0] addition, subtraction;
    add32 adder(valA, valB, 0, addition);
    add32 subtracter(~valA, valB, 1, subtraction);
   
    always @(*) begin
	    case(OP)			  
	        0 : valE = valA + valB;
	        1 : valE = valB - valA;
	        2 : valE = valA & valB;
	        3 : valE = valA ^ valB;	   		  
	    endcase 				   
		$display("alu = %h = %h (%h) %h", valE, valA, OP, valB);		
	end	
endmodule
