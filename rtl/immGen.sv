`timescale 1ns/100ps
`ifndef DISABLE_DEFAULT_NET
`default_nettype none
`endif


module immGen (
    input  logic [31:0] instruction,
    output logic [63:0] immediate
);

    logic [6:0] opcode;
    assign opcode = instruction[6:0];
    
    always_comb begin
        case (opcode)
            //R-type: ADD, SUB, OR, AND
            7'b0110011: begin
                immediate = 64'h0;
            end
            
            // I-type: ADDI, SLTI, XORI, ORI, ANDI, SLLI, SRLI, SRAI, LB, LH, LW, LD, LBU, LHU, LWU, JALR
            7'b0000011: begin
                immediate = {{52{instruction[31]}}, instruction[31:20]};
            end
            
            // S-type: SB, SH, SW, SD
            7'b0100011: begin
                immediate = {{52{instruction[31]}}, instruction[31:25], instruction[11:7]};
            end
            
            // SB-type: BEQ
            7'b1100011: begin
                immediate = {{51{instruction[31]}}, instruction[31], instruction[7], 
                        instruction[30:25], instruction[11:8], 1'b0};
            end
        
            
            // Default (R-type has no immediate)
            default: begin
                immediate = 64'b0;
            end
        endcase
    end

endmodule