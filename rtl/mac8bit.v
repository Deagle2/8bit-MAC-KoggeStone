`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2026 10:35:12
// Design Name: 
// Module Name: mac8bit
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


module mac8bit(
input clk, rst,
input [7:0] a,b,
output [16:0] Y

);
//A,B → prod_wire → [R1] → prod_reg → (+ acc_reg) → sum_wire → [R2] → acc_reg
wire [15:0] prod_wire;   // multiplier output
reg  [15:0] prod_reg;    // pipeline register
wire [15:0] sum_wire;    // adder output
reg  [16:0] acc_reg;     // accumulator, 17 bits for sum and carry

// 8x8 multiplier
mult8x8 u1 (.a(a), .b(b), .p(prod_wire));

// 16 bit kogge stone adder 
ks_16bit u2(.A(prod_reg), .B(acc_reg[15:0]), .S(sum_wire), .Cout(cout)); //MAC adds prod_reg and acc_reg
// Force acc_reg lower 16 bits and cout to get remaining 1 bit
always @(posedge clk) begin
    if(rst) begin
        prod_reg <= 0;
        acc_reg  <= 0;
    end
    else begin 
        prod_reg <= prod_wire;
        acc_reg  <= {cout, sum_wire};
    end      
end

assign Y = acc_reg;
endmodule


