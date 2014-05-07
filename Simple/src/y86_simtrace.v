`timescale 1ns / 1ns

module y86_simtrace 
  #(parameter DEBUG = 1)
  (input clk);

   always @ (posedge clk)
     if (DEBUG) begin
	$display ("_PC_____ _eax____ _ecx____ _edx____ _ebx____ _esp____ _ebp____ _esi____ _edi____");
	//$display ("----------------------------------------------------------------------------------------------------");
	$display ("%h %h %h %h %h %h %h %h %h", 
		SIM_CPU.currentPC[31:0],
		SIM_CPU.RegFile.r0eax[31:0],
		SIM_CPU.RegFile.r1ecx[31:0],
		SIM_CPU.RegFile.r2edx[31:0],
		SIM_CPU.RegFile.r3ebx[31:0],
		SIM_CPU.RegFile.r4esp[31:0],
		SIM_CPU.RegFile.r5ebp[31:0],
		SIM_CPU.RegFile.r6esi[31:0],
		SIM_CPU.RegFile.r7edi[31:0],
		);
     end
endmodule // y86_simtrace