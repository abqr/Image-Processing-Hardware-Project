`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2024 00:28:02
// Design Name: 
// Module Name: test1
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


module test1(

    );
logic enhancement_enable, clock;
byte input_image[128][128];

TOP_Module t1(clock, enhancement_enable, input_image);

initial begin
clock = 0;
forever #10 clock = ~clock;
end

initial begin
enhancement_enable = 1;
#400000;
$finish; 
end

endmodule
