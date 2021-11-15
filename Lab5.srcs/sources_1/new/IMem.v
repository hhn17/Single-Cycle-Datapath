`timescale 1ns / 1ns
module Instruction_Memory(Address, ReadData1);

	parameter BITSIZE = 32;
	parameter REGSIZE = 64;
	input [REGSIZE-1:0] Address;
	output reg [BITSIZE-1:0] ReadData1;

	reg [BITSIZE-1:0] memory_file [0:REGSIZE-1];	// Entire list of memory

	// Asyncronous read of memory. Was not specified.
	always @(Address, memory_file[Address])
		begin
			ReadData1 = memory_file[Address];
		end

	
	//MY method of filling the memory instead of through a test bench
	initial
		begin
			memory_file[0] = 32'b11110010100_1111111111111111_00010; //movk x2, 1
            memory_file[1] = 32'b11110010100_0000000000000111_00001; //moxk x1, 7
            memory_file[2] = 32'b10001011000_00001_000000_00010_01010; //add x10, x2, x1		
            memory_file[3] = 32'b11110010100_0000000000000001_01010; //movk x10, 1
		end

endmodule