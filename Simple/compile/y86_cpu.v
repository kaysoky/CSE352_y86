//-----------------------------------------------------------------------------
//
// Title       : No Title
// Design      : Simple
// Author      : University of Washington
// Company     : CSE
//
//-----------------------------------------------------------------------------
//
// File        : Z:\ActiveHDLWorkspace\Y86\Simple\compile\y86_cpu.v
// Generated   : Tue May  6 15:55:41 2014
// From        : Z:\ActiveHDLWorkspace\Y86\Simple\src\y86_cpu.bde
// By          : Bde2Verilog ver. 2.01
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`ifdef _VCP
`else
`define library(a,b)
`endif


// ---------- Design Unit Header ---------- //
`timescale 1ps / 1ps

module y86_cpu (CLK,RESET,InstrBytes,currentPC) ;

// ------------ Port declarations --------- //
input CLK;
wire CLK;
input RESET;
wire RESET;
input [47:0] InstrBytes;
wire [47:0] InstrBytes;
output [31:0] currentPC;
wire [31:0] currentPC;

// ----------------- Constants ------------ //
parameter DANGLING_INPUT_CONSTANT = 1'bZ;

// ----------- Signal declarations -------- //
wire [47:0] instrBytes;

// ---- Declaration for Dangling inputs ----//
wire Dangling_Input_Signal = DANGLING_INPUT_CONSTANT;

// ----------- Continuous assignments -------//

assign ZERO = 32'h0;
// -------- Component instantiations -------//

y86_alu ALU
(
	.OP({2{Dangling_Input_Signal}}),
	.valA({32{Dangling_Input_Signal}}),
	.valB({32{Dangling_Input_Signal}}),
	.valE()
);



y86_controller Controller
(
	.aluASelect(),
	.aluBSelect(),
	.alufun(),
	.dstE(),
	.halt(),
	.icode({4{Dangling_Input_Signal}}),
	.ifun({4{Dangling_Input_Signal}}),
	.rA({4{Dangling_Input_Signal}}),
	.rB({4{Dangling_Input_Signal}}),
	.srcA(),
	.srcB()
);



y86_splitInstruction Decode
(
	.icode(),
	.ifun(),
	.instrBytes(instrBytes),
	.need_ValC(),
	.need_regids(),
	.rA(),
	.rB(),
	.valC()
);



y86_incrementPC IncPC
(
	.currentPC({32{Dangling_Input_Signal}}),
	.halt(Dangling_Input_Signal),
	.need_regids(Dangling_Input_Signal),
	.need_valC(Dangling_Input_Signal),
	.reset(Dangling_Input_Signal),
	.valP()
);



register PC
(
	.D(Dangling_Input_Signal),
	.Q(currentPC[31:0]),
	.clk(Dangling_Input_Signal),
	.reset(Dangling_Input_Signal)
);



y86_regfile RegFile
(
	.ValE({32{Dangling_Input_Signal}}),
	.clk(Dangling_Input_Signal),
	.dstE({3{Dangling_Input_Signal}}),
	.reset(Dangling_Input_Signal),
	.srcA({3{Dangling_Input_Signal}}),
	.srcB({3{Dangling_Input_Signal}}),
	.valA(),
	.valB(),
	.write(Dangling_Input_Signal)
);



// ----------- Terminals assignment --------//
//	       ---- Input terminals ---         //
assign instrBytes[47:0] = InstrBytes[47:0];

endmodule 
