//-----------------------------------------------------------------------------
//
// Title       : No Title
// Design      : Foobar
// Author      : University of Washington
// Company     : CSE
//
//-----------------------------------------------------------------------------
//
// File        : z:\ActiveHDLWorkspace\Y86\Foobar\compile\y86_cpu.v
// Generated   : Tue May 13 14:33:47 2014
// From        : z:\ActiveHDLWorkspace\Y86\Foobar\src\y86_cpu.bde
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
parameter DANGLING_INPUT_CONSTANT = 'Z';

// ----------- Signal declarations -------- //
wire 34129;
wire ALU_DOWN;
wire ALU_UP;
wire halt;
wire need_regids;
wire need_valC;
wire [3:0] 33961;
wire [3:0] 33965;
wire [3:0] 33969;
wire [3:0] 33973;
wire [1:0] 34167;
wire 34226;
wire 34230;
wire 34238;
wire 34253;
wire 34444;
wire [3:0] dstE;
wire [47:0] instrBytes;
wire [3:0] srcA;
wire [3:0] srcB;
wire [31:0] valC;
wire [31:0] valE;
wire [31:0] ZERO;

// ---- Declaration for Dangling inputs ----//
wire Dangling_Input_Signal = DANGLING_INPUT_CONSTANT;

// ----------- Continuous assignments -------//

assign ZERO = 32'h0;
// -------- Component instantiations -------//

alu ALU
(
	.OP(34167),
	.valA({34230,{31{Dangling_Input_Signal}}}),
	.valB({34238,{31{Dangling_Input_Signal}}}),
	.valE(valE)
);



y86_controller Controller
(
	.aluASelect(ALU_UP),
	.aluBSelect(ALU_DOWN),
	.alufun(34167),
	.dstE(dstE),
	.halt(halt),
	.icode(33965),
	.ifun(33961),
	.rA(33969),
	.rB(33973),
	.srcA(srcA),
	.srcB(srcB)
);



y86_splitInstruction Decode
(
	.icode(33965),
	.ifun(33961),
	.instrBytes(instrBytes),
	.need_ValC(need_valC),
	.need_regids(need_regids),
	.rA(33969),
	.rB(33973),
	.valC(valC)
);



y86_incrementPC IncPC
(
	.currentPC(currentPC),
	.halt(halt),
	.need_regids(need_regids),
	.need_valC(need_valC),
	.reset(RESET),
	.valP(34444)
);



register PC
(
	.D(34444),
	.Q(currentPC[31:0]),
	.clk(CLK),
	.reset(RESET)
);



regfile8x32 RegFile
(
	.CLK(CLK),
	.Write(34129),
	.dstW(dstE[2:0]),
	.reset(RESET),
	.srcA(srcA[2:0]),
	.srcB(srcB[2:0]),
	.valA(34226),
	.valB(34253),
	.valE(valE)
);



assign 34129 = ~(dstE[3]);


mux2 U2
(
	.S(ALU_UP),
	.in0(34226),
	.in1(valC[31:0]),
	.out(34230)
);



mux2 U3
(
	.S(ALU_DOWN),
	.in0(34253),
	.in1(ZERO[31:0]),
	.out(34238)
);



// ----------- Terminals assignment --------//
//	       ---- Input terminals ---         //
assign instrBytes[47:0] = InstrBytes[47:0];

endmodule 
