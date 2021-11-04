`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2021 02:50:30 PM
// Design Name: 
// Module Name: control_test
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


module control_test;

reg rst;
reg[31:0] instruction;
wire Reg2Loc,UncondBranch,Branch,MemRead,MemReg, MemWrite,ALUscr,RegWrite;
wire [3:0] ALUop;

Control_Logic test_module(rst,instruction , Reg2Loc,UncondBranch,Branch,MemRead,MemReg,ALUop ,MemWrite,ALUscr,RegWrite);

initial begin
rst=1;

#10;
rst=0;
instruction= 32'b11111000000_00000000011_00010_00001;
end

endmodule
