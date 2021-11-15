`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2021 03:04:45 PM
// Design Name: 
// Module Name: ALU_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_test;

reg [31:0] instruction;
reg [63:0]Reg1Data,Reg2Data;
reg [3:0] ALUop;
wire zero;
wire [63:0] ALU_Out;

ALU test_ALU(instruction, Reg1Data ,Reg2Data,ALUop,ALU_Out ,zero);
initial begin
Reg1Data =1;
Reg2Data =7;
instruction =32'b10001011000_00001_000000_00010_01010;
ALUop=4'b0001;

#10;
ALUop=4'b0110;



end
endmodule
