`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2026 11:05:37
// Design Name: 
// Module Name: mac8bit_tb
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


module mac8bit_tb;

    // Inputs
    reg clk;
    reg rst;
    reg [7:0] a;
    reg [7:0] b;

    // Outputs
    wire [16:0] Y;

    // Instantiate the Unit Under Test (UUT)
    mac8bit uut (.clk(clk),.rst(rst),.a(a),.b(b),.Y(Y));

    // Clock generation: 10ns period (100 MHz)
    always #5 clk = ~clk;

    initial begin
     $monitor("time=%0t, a=%d, b=%d, Y=%d", $time, a, b, Y);
     end
     initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        a = 0;
        b = 0;

        // Reset the system
        #20 rst = 0;

        // Test 1: Simple multiplication (2 * 3 = 6)
        a = 8'd2; b = 8'd3;
        #10;
        
        // Test 2: Accumulate (4 * 5 = 20) -> Total should be 26
        a = 8'd4; b = 8'd5;
        #10;
        
        //
         a = 8'd0; b = 8'd0;
        #10;
        //
         a = 8'd0; b = 8'd1;
        #10;
        // 
        a = 8'd4; b = 8'd22;
        #10;
        rst=1; #20 rst = 0;
        // 
         a = 8'd10; b = 8'd1;
        #10;
        //
        // Test x: Large numbers to test the 17th bit (Cout)
        // 200 * 200 = 40,000. 
        // If we do this twice, 40k + 40k = 80,000 (Exceeds 16-bit 65,535)
        a = 8'd200; b = 8'd200;
        #10;
        a = 8'd200; b = 8'd200;
        #40;
        $display("Final Accumulator Value: %d", Y);
        $finish;
    end
      
endmodule
