`timescale 1ns / 1ns
// Controller module
module y86_controller(
    input [3:0] icode,
    input [3:0] ifun,
    input [3:0] rA,
    input [3:0] rB,
    output [3:0] srcA,
    output [3:0] srcB,
    output reg [3:0] dstE,
    output reg aluASelect,
    output reg aluBSelect,
    output reg [1:0] alufun,
    output reg halt);

    // Instruction codes
    localparam IHALT = 4'h0;
    localparam INOP = 4'h1;
    localparam IRRMOVL = 4'h2;
    localparam IIRMOVL = 4'h3;
    localparam IOPL = 4'h6;
    
    // Select register A
    assign srcA = rA;

    // Select register B
    assign srcB = rB;

    // Control logic
    always @(*) begin
        dstE = rB;
        case(icode)
            IHALT   : halt = 1;
            IRRMOVL : begin 
                      aluASelect = 0; // RegA
                      aluBSelect = 1; // Zero
                      alufun = 3; // XOR
                      end
            IIRMOVL : begin
                      aluASelect = 1; // ValC
                      aluBSelect = 1; // Zero
                      alufun = 3; // XOR
                      end
            IOPL    : begin 
                      aluASelect = 0; // RegA
                      aluBSelect = 0; // RegB
                      alufun = ifun[1:0];
                      end
        endcase
        $display ("dstE[3] = %h", dstE[3]);
    end

endmodule // y86_controller
