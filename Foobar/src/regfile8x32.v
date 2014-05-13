`timescale 1ns / 1ns

module regfile8x32(input [2:0] srcA, srcB, dstW, 
                   input [31:0] valE, 
                   input Write, CLK, reset, 
                   output reg [31:0] valA, valB, r0eax, r1ecx, r2edx, r3ebx, r4esp, r5ebp, r6esi, r7edi);
    always @(posedge CLK) begin
        if (reset) begin
            r0eax = 0;
            r1ecx = 0;
            r2edx = 0;
            r3ebx = 0;
            r4esp = 0;
            r5ebp = 0;
            r6esi = 0;
            r7edi = 0;
        end
        if (Write) begin
            case (dstW)
                0 : r0eax = valE;
                1 : r1ecx = valE;
                2 : r2edx = valE;
                3 : r3ebx = valE;
                4 : r4esp = valE;
                5 : r5ebp = valE;
                6 : r6esi = valE;
                7 : r7edi = valE;
            endcase
            $display("writing (%h) = %h", dstW, valE);
        end
        case(srcA)
            0 : valA <= r0eax;
            1 : valA <= r1ecx;
            2 : valA <= r2edx;
            3 : valA <= r3ebx;
            4 : valA <= r4esp;
            5 : valA <= r5ebp;
            6 : valA <= r6esi;
            7 : valA <= r7edi;
        endcase
        case(srcB)
            0 : valB <= r0eax;
            1 : valB <= r1ecx;
            2 : valB <= r2edx;
            3 : valB <= r3ebx;
            4 : valB <= r4esp;
            5 : valB <= r5ebp;
            6 : valB <= r6esi;
            7 : valB <= r7edi;
        endcase
    end
    always @(srcA) begin
        case(srcA)
            0 : valA = r0eax;
            1 : valA = r1ecx;
            2 : valA = r2edx;
            3 : valA = r3ebx;
            4 : valA = r4esp;
            5 : valA = r5ebp;
            6 : valA = r6esi;
            7 : valA = r7edi;
        endcase
    end
    always @(srcB) begin
        case(srcB)
            0 : valB = r0eax;
            1 : valB = r1ecx;
            2 : valB = r2edx;
            3 : valB = r3ebx;
            4 : valB = r4esp;
            5 : valB = r5ebp;
            6 : valB = r6esi;
            7 : valB = r7edi;
        endcase
    end
endmodule