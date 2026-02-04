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
    reg clk;
    reg rst;
    reg [7:0] a, b;
    wire [16:0] Y;
    
    mac8bit uut (.clk(clk), .rst(rst), .a(a), .b(b), .Y(Y));

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | a=%d b=%d | Y=%d", $time, a, b, Y);
        
      
        clk = 0; rst = 1; a = 0; b = 0;
        repeat(2) @(posedge clk); 

        rst <= 0; 
        @(negedge clk); a <= 8'd2;   b <= 8'd3;    
        @(negedge clk); a <= 8'd4;   b <= 8'd5;    
        @(negedge clk); a <= 8'd4;   b <= 8'd22;   
        @(negedge clk); a <= 8'd10;  b <= 8'd1;    
        @(negedge clk); a <= 8'd30;  b <= 8'd221;  
        @(negedge clk); a <= 8'd10; b <= 8'd10;
        @(negedge clk); a <= 8'd0; b <= 8'd1;
        @(negedge clk); a <= 8'd100; b <= 8'd10;
        @(negedge clk); a <= 8'd100; b <= 8'd100;
        @(negedge clk); a <= 8'd200; b <= 8'd200;
        @(negedge clk); a <= 8'd200; b <= 8'd200; //overflow test
        @(negedge clk); a <= 0; b <= 0; // Flush pipeline
        repeat(4) @(posedge clk);    
        @(posedge clk);  // Extra cycle for final reg update

        $strobe("Final Verification Y = %d", Y); //display y after reg settles
        #10 $finish;
    end
endmodule

