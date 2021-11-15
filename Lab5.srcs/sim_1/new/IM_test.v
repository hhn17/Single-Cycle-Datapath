`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2021 04:17:47 PM
// Design Name: 
// Module Name: IM_test
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


module IM_test;
reg [63:0] Address;
wire [31:0] ReadData1;
reg[7:0] i=4'b0;

Instruction_Memory test_IM(Address, ReadData1);
initial begin
Address =0;

for (i=1;i<16;i=i+1) begin
  Address=i;
  
    #30;
    end
end
endmodule
