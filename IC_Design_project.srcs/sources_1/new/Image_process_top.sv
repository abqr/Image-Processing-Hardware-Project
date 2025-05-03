`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2024 00:06:57
// Design Name: 
// Module Name: Image_process_top
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
parameter ROWS = 32;
parameter COLS = 32;


module Image_process_top(input [7:0]img[ROWS][COLS], input clock, input reset,input logic enhancement_enable, output [7:0]out[ROWS][COLS], output norm_done
    );
    wire smoothening_done;
    wire smoothened_image[ROWS][COLS];
    wire sharpened_image[ROWS][COLS];
    wire blended_matrix[ROWS][COLS];
    parameter [7:0] kernal[3][3] = '{{0,-1,0},{-1,5,-1},{0,-1,0}};
    
    smoothening smoothen(clock, reset, enhancement_enable, img, smoothened_image, smoothening_done);
    sharpening sharpen(clock, smoothened_image, kernal, sharpened_image);
    Blending add(clock, reset, enhancement_enable, img, sharpened_image, blended_matrix);
    normalization normalize(clock, reset, blended_matrix, norm_done, out);

endmodule
