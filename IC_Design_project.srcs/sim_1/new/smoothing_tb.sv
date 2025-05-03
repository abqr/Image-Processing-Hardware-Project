`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2024 17:12:34
// Design Name: 
// Module Name: smoothing_tb
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

module smoothing_tb();

    logic clk;
    logic [7:0] image[4][4];
    logic [7:0] kernal[3][3];
    logic [7:0] multiplication[3][3];
    //logic [7:0] zeropad[6][6];
    //logic [7:0] output_image[4][4];
    logic [7:0] padmatrix[6][6];
    logic [7:0] mul[3][3];
    
    int i,j;
    
   smoothening uut(clk,image,kernal,multiplication,mul,padmatrix);
   
   initial begin
   clk = 0;
   forever #5 clk = ~clk;
   end
   
   initial begin
   
    kernal[0][0] = 1;
    kernal[0][1] = -1;
    kernal[0][2] = 1;
    kernal[1][0] = 1;
    kernal[1][1] = -1;
    kernal[1][2] = 1;
    kernal[2][0] = 1;
    kernal[2][1] = -1;
    kernal[2][2] = 1; 
    
    image[0][0] = 1;
    image[0][1] = 2;
    image[0][2] = 2;
    image[0][3] = 2;  
    image[1][0] = 3;
    image[1][1] = 2;
    image[1][2] = 2;
    image[1][3] = 2; 
    image[2][0] = 5;
    image[2][1] = 3;
    image[2][2] = 3;
    image[2][3] = 3;
    image[3][0] = 6;
    image[3][1] = 4;
    image[3][2] = 4; 
    image[3][3] = 4;
    
    end
endmodule
