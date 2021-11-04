`timescale 1ns / 1ns
module Register_File(instruction,ReadSelect1, ReadSelect2, WriteSelect, WriteData, WriteEnable, ReadData1, ReadData2, clk, rst);

    parameter BITSIZE = 64;
    parameter REGSIZE = 32;
    input [31:0] instruction;
    input [$clog2(REGSIZE)-1:0] ReadSelect1, ReadSelect2, WriteSelect;
    input [BITSIZE-1:0] WriteData;
    input WriteEnable;
    output reg [BITSIZE-1:0] ReadData1, ReadData2;
    input clk, rst;
    //input [31:0] instruction;

    reg [BITSIZE-1:0] reg_file [REGSIZE-1:0];   // Entire list of registers

    integer i;                                  // Used below to rst all registers

    // Asyncronous read of register file.
    always @(ReadSelect1, reg_file[ReadSelect1],instruction )
        begin
            ReadData1 = reg_file[ReadSelect1];
        end

    // Asyncronous read of register file.
    always @(ReadSelect2, reg_file[ReadSelect2],instruction )
        begin
            ReadData2 = reg_file[ReadSelect2];
        end

    // Write back to register file on clk edge.
    always @(posedge clk)
        begin
            if (rst)
                for (i=0; i<REGSIZE; i=i+1) reg_file[i] <= 'b0; // rst all registers
            else
            begin
                if (WriteEnable && WriteSelect != 31)
                    reg_file[WriteSelect] <= WriteData; //If writeback is enabled and not 0 register.
            end
        end

endmodule