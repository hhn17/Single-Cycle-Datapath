`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2021 12:28:34 AM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(input clk,rst,MemWrite,MemRead, 
                   input [63:0] MemAddr,WriteData, 
                   output reg [63:0] ReadData);
 
 reg [63:0] Memory_file [63:0];     
 integer i;
 
 
 always@(posedge MemRead) begin
     if (MemRead) begin
        ReadData =Memory_file[MemAddr];
    end
 end
 
 always@( posedge clk,posedge rst ) begin
    if (rst) begin
        for (i=0; i<64; i=i+1) 
                Memory_file[i] = 63'b0;
    end
    
    else if (MemWrite) begin
        Memory_file[MemAddr]=WriteData ;
    end
 end       
 
 
             

endmodule
