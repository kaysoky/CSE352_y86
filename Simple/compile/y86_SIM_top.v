//-----------------------------------------------------------------------------
//
// Title       : y86 Simulation Top-Level
// Design      : Simple
// Author      : Ian Finder
// Company     : University of Washington
//
//-----------------------------------------------------------------------------
//
// File        : Z:\ActiveHDLWorkspace\Y86\Simple\compile\y86_SIM_top.v
// Generated   : Tue May  6 15:55:43 2014
// From        : Z:\ActiveHDLWorkspace\Y86\Simple\src\y86_SIM_top.bde
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

module y86_SIM_top ;

// ----------- Signal declarations -------- //
wire SIM_cpu_clk;
wire SIM_cpu_reset;
wire [47:0] SIM_curr_inst;
wire [31:0] SIM_inst_addr;

// -------- Component instantiations -------//

y86_cpu SIM_CPU
(
	.CLK(SIM_cpu_clk),
	.InstrBytes(SIM_curr_inst),
	.RESET(SIM_cpu_reset),
	.currentPC(SIM_inst_addr)
);



y86_iram
#(
	.file("testv1.hex"))
SIM_IRAM
(
	.addr(SIM_inst_addr),
	.clk(SIM_cpu_clk),
	.data(SIM_curr_inst)
);



ClockGen
#(
	.period(30))
SIM_clock
(
	.CLK(SIM_cpu_clk),
	.reset(SIM_cpu_reset)
);



y86_simtrace U1
(
	.clk(SIM_cpu_clk)
);



endmodule 
