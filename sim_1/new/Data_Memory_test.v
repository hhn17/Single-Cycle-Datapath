`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2021 03:43:29 PM
// Design Name: 
// Module Name: Data_Memory_test
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


module Data_Memory_test;

reg clk,rst,MemWrite,MemRead;
reg [63:0] MemAddr,WriteData;
wire [63:0] ReadData;

Data_Memory test_memory(clk,rst,MemWrite,MemRead,MemAddr,WriteData,ReadData);

initial begin
    clk=0;
    rst=1;
    
    
    #10;
    rst=0;
    MemWrite=1;
    MemAddr = 63;
    WriteData =99;
    
    #10;
    MemWrite=1;
    MemAddr = 10;
    WriteData =31;
    
    #15;
    MemWrite=0;
    MemRead=1;
    MemAddr =10;
          
    
end


always
        #10 clk = !clk;



endmodule
