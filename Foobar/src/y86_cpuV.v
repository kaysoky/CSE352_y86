`ifdef _VCP
`else
`define library(a,b)
`endif

module y86_cpuV (input CLK,RESET,
                input [47:0] InstrBytes,
                output [31:0] currentPC);

wire [3:0] rA, rB, icode, ifun, dstE, srcA, srcB;
wire need_valC, need_regids, ALU_UP, ALU_DOWN, halt;
wire [31:0] valC, valA, valB, valE, outMuxUp, outMuxDown, valP;
wire [1:0] alufun;

y86_splitInstruction Decode
(
	.icode(icode),
	.ifun(ifun),
	.instrBytes(InstrBytes),
	.need_ValC(need_valC),
	.need_regids(need_regids),
	.rA(rA),
	.rB(rB),
	.valC(valC)
);

y86_controller Controller
(
	.aluASelect(ALU_UP),
	.aluBSelect(ALU_DOWN),
	.alufun(alufun),
	.dstE(dstE),
	.halt(halt),
	.icode(icode),
	.ifun(ifun),
	.rA(rA),
	.rB(rB),
	.srcA(srcA),
	.srcB(srcB)
);

alu ALU
(
	.OP(alufun),
	.valA(outMuxUp),
	.valB(outMuxDown),
	.valE(valE)
);

regfile8x32 RegFile
(
	.CLK(CLK),
	.Write(~(dstE[3])),
	.dstW(dstE[2:0]),
	.reset(RESET),
	.srcA(srcA[2:0]),
	.srcB(srcB[2:0]),
	.valA(valA),
	.valB(valB),
	.valE(valE)
);

mux2 U2
(
	.S(ALU_UP),
	.in0(valA[31:0]),
	.in1(valC[31:0]),
	.out(outMuxUp)
);

mux2 U3
(
	.S(ALU_DOWN),
	.in0(valB[31:0]),
	.in1(0),
	.out(outMuxDown)
);

y86_incrementPC IncPC
(
	.currentPC(currentPC),
	.halt(halt),
	.need_regids(need_regids),
	.need_valC(need_valC),
	.reset(RESET),
	.valP(valP)
);

register PC
(
	.D(valP[31:0]),
	.Q(currentPC),
	.clk(CLK),
	.reset(RESET)
);											   

endmodule 
