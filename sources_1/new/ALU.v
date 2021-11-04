`timescale 1ns / 1ns

module ALU(input [31:0] instruction,
            input [63:0] Reg1Data,Reg2Data, 
            input [3:0] ALUop,
            output reg [63:0] ALU_Out, 
            output zero
);

always@(Reg1Data,Reg2Data,ALUop) begin
    case(ALUop)
        4'd1: ALU_Out=Reg1Data & Reg2Data;
        4'd2: ALU_Out=Reg1Data | Reg2Data;
        4'd3: ALU_Out= ~Reg1Data ;
        4'd4: ALU_Out=Reg1Data;
        4'd5: ALU_Out=Reg2Data;
        4'd6: ALU_Out=Reg1Data + Reg2Data;
        4'd7: ALU_Out=Reg1Data - Reg2Data;
        4'd8: begin
            ALU_Out[15:0]<=instruction [20:5];
            ALU_Out[63:16]<=Reg2Data[63:16]; 
            end
    endcase
end

assign zero= (ALU_Out ==0)? 1'b1:1'b0;

endmodule