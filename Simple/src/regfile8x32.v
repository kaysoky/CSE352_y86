`timescale 1ns / 1ns

module regfile8x32(input [2:0] srcA, srcB, dstW, 
                   input [31:0] valE, 
                   input Write, CLK, reset, 
                   output reg [31:0] valA, valB);
    reg [31:0] eax, ecx, edx, ebx, esp, ebp, esi, edi;
    always @(reset) begin
        if (reset) begin
            eax = 0;
            ecx = 0;
            edx = 0;
            ebx = 0;
            esp = 0;
            ebp = 0;
            esi = 0;
            edi = 0;
        end
    end
    always @(posedge CLK) begin
        case(srcA)
            0 : valA = eax;
            1 : valA = ecx;
            2 : valA = edx;
            3 : valA = ebx;
            4 : valA = esp;
            5 : valA = ebp;
            6 : valA = esi;
            7 : valA = edi;
        endcase
        case(srcB)
            0 : valB = eax;
            1 : valB = ecx;
            2 : valB = edx;
            3 : valB = ebx;
            4 : valB = esp;
            5 : valB = ebp;
            6 : valB = esi;
            7 : valB = edi;
        endcase	 
        if (Write) begin
            case (dstW)
                0 : eax = valE;
                1 : ecx = valE;
                2 : edx = valE;
                3 : ebx = valE;
                4 : esp = valE;
                5 : ebp = valE;
                6 : esi = valE;
                7 : edi = valE;
            endcase
        end
    end
endmodule