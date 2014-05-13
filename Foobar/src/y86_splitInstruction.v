`timescale 1ns / 1ns

module y86_splitInstruction
    (input [47:0] instrBytes,
    output reg need_regids,
    output reg need_ValC,
    output [3:0] icode,
    output [3:0] ifun,
    output reg [3:0] rA, rB,
    output reg [31:0] valC); 

    assign icode = instrBytes[7:4];
    assign ifun = instrBytes[3:0];		  												 

    // Does fetched instruction have a register IDs byte?
    always @(*) begin	   									
        case (icode)
            4'h2 : begin
                   need_regids = 1;
                   rA = instrBytes[15:12];
                   rB = instrBytes[11:8];
                   end
            4'h3 : begin
                   need_regids = 1;
                   rA = 4'hF;
                   rB = instrBytes[11:8];
                   end
            4'h4 : begin
                   need_regids = 1;
                   rA = instrBytes[15:12];
                   rB = instrBytes[11:8];
                   end
            4'h5 : begin
                   need_regids = 1;
                   rA = instrBytes[15:12];
                   rB = instrBytes[11:8];
                   end
            4'h6 : begin
                   need_regids = 1;
                   rA = instrBytes[15:12];
                   rB = instrBytes[11:8];
                   end
            4'hA : begin
                   need_regids = 1;
                   rA = instrBytes[15:12];
                   rB = 4'hF;
                   end
            4'hB : begin
                   need_regids = 1;
                   rA = instrBytes[15:12];
                   rB = 4'hF;
                   end
            default : begin
                      need_regids = 0;
                      rA = 4'hF;
                      rB = 4'hF;
                      end
        endcase	  									   
		
    	// Does fetched instruction have a constant word (4 bytes)?
        case (icode)
            4'h3 : begin
                   need_ValC = 1;
                   valC = instrBytes[47:16];
                   end
            4'h4 : begin
                   need_ValC = 1;
                   valC = instrBytes[47:16];
                   end
            4'h5 : begin
                   need_ValC = 1;
                   valC = instrBytes[47:16];
                   end
            4'h7 : begin
                   need_ValC = 1;
                   valC = instrBytes[39:8];
                   end
            4'h8 : begin
                   need_ValC = 1;
                   valC = instrBytes[39:8];
                   end
            default : begin
                      need_ValC = 0;
                      valC = 0;
                      end
        endcase		
		
		$display ("_PC_____ _eax____ _ecx____ _edx____ _ebx____ _esp____ _ebp____ _esi____ _edi____");
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
		
		$display ("instrBytes = %h, icode = %h, ifun = %h, need_regids = %h, rA = %h, rB = %h, need_ValC = %h, valC = %h", 
		instrBytes, icode, ifun, need_regids, rA, rB, need_ValC, valC);  	
		
		$display ("-----");
    end

endmodule // y86_splitInstruction
