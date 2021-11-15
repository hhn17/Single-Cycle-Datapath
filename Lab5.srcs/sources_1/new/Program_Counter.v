`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2021 11:50:46 PM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(input clk,rst,zero, UncondBranch,Branch,
                        input [31:0] instruction, 
                        output reg [63:0] counter_out
 );
 
 reg [63:0] instruction_index;
 always @(posedge clk,posedge rst)begin
    if (rst) begin
        instruction_index =0;
  
    end
    else if ( UncondBranch) begin
        instruction_index =instruction [20:0];
    end
    else if (Branch & (~zero)) begin
        instruction_index =instruction [20:5];
    end
    else begin
        instruction_index=instruction_index+1;
    end
 end
 
 always @(negedge clk) begin
    counter_out =instruction_index;
 end
endmodule
