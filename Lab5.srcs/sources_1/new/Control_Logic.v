`timescale 1ns / 1ns
module Control_Logic(input rst,
                     input [31:0] instruction, 
                     output Reg2Loc,UncondBranch,Branch,MemRead,MemtoReg,
                     output [3:0] ALUop,
                     output MemWrite,ALUsrc,RegWrite
);

reg [11:0] control_code;
assign Reg2Loc =control_code [11];
assign UncondBranch =control_code[10];
assign Branch =control_code [9];
assign MemRead =control_code[8];
assign MemtoReg=control_code[7];
assign ALUop[3:0] = control_code[6:3];
assign MemWrite=control_code[2];
assign ALUsrc=control_code [1];
assign RegWrite=control_code[0];


always@(instruction, posedge rst) begin
    if (rst) begin
        control_code =12'b0;
    end
    else begin
        case (instruction[31:21])
            11'h0A0: control_code= 12'b110000101000; //Branch
            11'h450: control_code= 12'b000000001001; //AND
            11'h458: control_code= 12'b000000110001; //ADD
            11'h550: control_code= 12'b000000010001; //ORR
            11'h5A0: control_code= 12'b101000100000; //CBNZ
            11'h658: control_code= 12'b000000111001; //SUB
            11'h794: control_code =12'b100001000001; //MOVK
            11'h7C0: control_code= 12'b100000110110; //STUR
            11'h7C2: control_code= 12'b100110110011; //LDUR
            default: control_code=12'b0;
        endcase
    end
end

endmodule