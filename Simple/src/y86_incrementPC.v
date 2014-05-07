`timescale 1ns / 1ns

module y86_incrementPC
    (input reset,   
    input halt,
    input [31:0] currentPC,	 
    input 	need_regids,
    input 	need_valC,
    output [31:0] valP);

    assign valP = (reset ? 0 : 
                    (halt ? 32'hFFFFFFFF : (
                       currentPC + 1 + (need_regids ? 1 : 0) + (need_valC ? 4 : 0) 
                       )
                    )
                  );
endmodule
