`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2021 12:17:14 AM
// Design Name: 
// Module Name: Datapath_test
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


module Datapath_test;

reg clk,rst;

Datapath data_test(clk,rst);

initial begin
clk=0;
rst=0;

#4;
rst=1;
#10;
rst=0;

end

always
        #10 clk = !clk;
endmodule
