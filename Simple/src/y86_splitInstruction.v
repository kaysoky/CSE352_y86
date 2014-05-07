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
                   rA = instrBytes[11:8];
                   rB = instrBytes[15:12];
                   end
            4'h3 : begin
                   need_regids = 1;
                   rA = 4'hF;
                   rB = instrBytes[15:12];
                   end
            4'h4 : begin
                   need_regids = 1;
                   rA = instrBytes[11:8];
                   rB = instrBytes[15:12];
                   end
            4'h5 : begin
                   need_regids = 1;
                   rA = instrBytes[11:8];
                   rB = instrBytes[15:12];
                   end
            4'h6 : begin
                   need_regids = 1;
                   rA = instrBytes[11:8];
                   rB = instrBytes[15:12];
                   end
            4'hA : begin
                   need_regids = 1;
                   rA = instrBytes[11:8];
                   rB = 4'hF;
                   end
            4'hB : begin
                   need_regids = 1;
                   rA = instrBytes[11:8];
                   rB = 4'hF;
                   end
            default : begin
                      need_regids = 0;
                      rA = 4'hF;
                      rB = 4'hF;
                      end
        endcase
    end
        
    // Does fetched instruction have a constant word (4 bytes)?
    always @(*) begin
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
    end

endmodule // y86_splitInstruction
