`timescale 1ns / 1ps
module carry_save_adder(
    input  signed [15:0] A,
    input  signed [15:0] B,
    input  signed [15:0] C,
    output signed [15:0] SUM,
    output signed [15:0] CARRY
);
    assign SUM = A ^ B ^ C; // sum is calculated without carry 
    assign CARRY = $signed((A & B) | (B & C) | (A & C)) <<< 1;// here carry is calculated and left shifter 
endmodule
