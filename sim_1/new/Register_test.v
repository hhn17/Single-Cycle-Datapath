`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2021 03:23:52 PM
// Design Name: 
// Module Name: Register_test
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


module Register_test;

reg [4:0] ReadSelect1, ReadSelect2, WriteSelect;
reg [63:0] WriteData;
reg WriteEnable;
reg clk,rst;

wire [63:0] ReadData1,ReadData2;

Register_File reg_test(ReadSelect1,ReadSelect2,WriteSelect,WriteData,WriteEnable,ReadData1,ReadData2,clk,rst);

initial begin
    clk=0;
    rst=1;
    
    #10;
    rst=0;
    ReadSelect1=9;
    ReadSelect2=10;
    WriteEnable=1;
    WriteSelect=10;
    WriteData = 127;
    
    #15;
    WriteSelect=9;
    WriteData = 32;
    
        
    
end


always
        #10 clk = !clk;
endmodule
