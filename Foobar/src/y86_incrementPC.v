`timescale 1ns / 1ns

module y86_incrementPC
    (input reset,   
    input halt,
    input [31:0] currentPC,	 
    input 	need_regids,
    input 	need_valC,
    output reg [31:0] valP);
	
	always @(*) begin	  
		valP = currentPC;
		if (reset) 
			valP = 0;
		if (need_regids)
			valP = valP + 1;
		if (need_valC)
			valP = valP + 4;
		valP = valP + 1;
		if (halt)
			valP = currentPC;	  
	end	
endmodule
