`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2021 12:12:27 AM
// Design Name: 
// Module Name: Datapath
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


module Datapath(input clk,rst);

wire zero;
wire [63:0] counter_out;
wire [31:0] instruction;
wire Reg2Loc,UncondBranch,Branch,MemRead,MemtoReg;
wire [3:0] ALUop;
wire MemWrite,ALUsrc,RegWrite;

reg [4:0] ReadSelect1, ReadSelect2,WriteSelect;
reg [63:0] WriteData;

wire[63:0] ReadData1,ReadData2;
reg [63:0] Reg1Data,Reg2Data;
wire [63:0] ALU_output;
wire [63:0] ReadData;



Program_Counter counter( clk,rst,zero,UncondBranch,Branch,instruction,counter_out);
Instruction_Memory IM(counter_out,instruction );
Control_Logic control(rst,instruction,Reg2Loc,UncondBranch,Branch,MemRead,MemtoReg,ALUop,MemWrite,ALUsrc,RegWrite);
Register_File register(instruction ,ReadSelect1, ReadSelect2, WriteSelect, WriteData, RegWrite, ReadData1, ReadData2, clk, rst);
ALU alu(instruction ,Reg1Data,Reg2Data,ALUop, ALU_output,zero);
Data_Memory memory(clk,rst,MemWrite,MemRead,ALU_output,ReadData1,ReadData); 


always @(Reg2Loc,instruction ,posedge rst) begin
    if(rst) begin
        ReadSelect1=31;
        ReadSelect2=31;
        WriteSelect=31;
    end
    else if (Reg2Loc) begin
        ReadSelect1=instruction[4:0];
        ReadSelect2=instruction [9:5];
        WriteSelect=instruction [4:0];
    end
    else if (Reg2Loc==0) begin
        ReadSelect1=instruction[9:5];
        ReadSelect2=instruction [20:16];
        WriteSelect=instruction [4:0];
    end    
end

always@(instruction,posedge rst, ALUsrc,ReadData2,ReadData1) begin
    if (rst) begin
        Reg1Data =0;
        Reg2Data =0;
    end
    else if (ALUsrc) begin
        Reg1Data =ReadData2;
        Reg2Data =$signed(instruction[20:10]);
    end
    else begin
        Reg1Data=ReadData1;
        Reg2Data =ReadData2;
    end
end

always@(posedge rst, MemtoReg, instruction , ReadData,ALU_output) begin
    if (rst) begin
        WriteData =0;
    end
    else if (MemtoReg) begin
        WriteData =ReadData ;
    end
    else begin
        WriteData =ALU_output;
    end
end


endmodule
