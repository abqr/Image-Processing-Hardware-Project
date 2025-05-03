`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2024 11:46:07 AM
// Design Name: 
// Module Name: blending_tb
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

//parameter integer ROWS = 4; // Number of rows in the matrix
//parameter integer COLS = 4; // Number of columns in the matrix

//module blending_tb();

//    logic clk;
//    logic reset;
//    logic enable; // Enable signal to start blending
//    logic [7:0] original_matrix[ROWS][COLS]; // 2D packed array for original pixels
//    logic [7:0] sharpened_matrix[ROWS][COLS]; // 2D packed array for sharpened pixels
//    logic [7:0] blended_matrix[ROWS][COLS]; // 2D packed array for blended pixels
//    logic done;
    
//   sequential_matrix_blend_sv uut(clk,reset,enable,original_matrix,sharpened_matrix,blended_matrix,done);
   
//   initial begin
//   clk = 0;
//   forever #5 clk = ~clk;
//   end
   
//   initial begin
//    reset = 1;
//    #10;
//    reset = 0; enable = 1;
//    original_matrix[0][0] = 1;
//    original_matrix[0][1] = 2;
//    original_matrix[0][2] = 2;
//    original_matrix[0][3] = 2;  
//    original_matrix[1][0] = 3;
//    original_matrix[1][1] = 2;
//    original_matrix[1][2] = 2;
//    original_matrix[1][3] = 2; 
//    original_matrix[2][0] = 5;
//    original_matrix[2][1] = 3;
//    original_matrix[2][2] = 3;
//    original_matrix[2][3] = 3;
//    original_matrix[3][0] = 6;
//    original_matrix[3][1] = 4;
//    original_matrix[3][2] = 4; 
//    original_matrix[3][3] = 4;
    
//    sharpened_matrix[0][0] = 1;
//    sharpened_matrix[0][1] = 2;
//    sharpened_matrix[0][2] = 2;
//    sharpened_matrix[0][3] = 2;  
//    sharpened_matrix[1][0] = 3;
//    sharpened_matrix[1][1] = 2;
//    sharpened_matrix[1][2] = 2;
//    sharpened_matrix[1][3] = 2; 
//    sharpened_matrix[2][0] = 5;
//    sharpened_matrix[2][1] = 3;
//    sharpened_matrix[2][2] = 3;
//    sharpened_matrix[2][3] = 3;
//    sharpened_matrix[3][0] = 6;
//    sharpened_matrix[3][1] = 4;
//    sharpened_matrix[3][2] = 4; 
//    sharpened_matrix[3][3] = 4;
    
//    end
//endmodule

    parameter pixels = 512;
module blending_tb(

    );
    int fd,fd1,fd2;
    
    logic clk;
    logic reset;
    logic enable; // Enable signal to start blending
    logic [7:0] original_matrix[pixels][pixels]; // 2D packed array for original pixels
    logic [7:0] sharpened_matrix[pixels][pixels]; // 2D packed array for sharpened pixels
    logic [7:0] blended_matrix[pixels][pixels]; // 2D packed array for blended pixels
    logic done;
    
    sequential_matrix_blend uut(clk,reset,enable,original_matrix,sharpened_matrix,blended_matrix,done);
    
    initial begin
    clk = 0;
    forever #1 clk = ~clk;
    end
    
    //smoothing uut(img,fil,out);
    initial begin
        reset = 1;
        #2 
        reset = 0; enable = 1;
        fd = $fopen("C:\\Users\\AASHREY PATEL\\Desktop\\python\\venv\\sharp_image.txt","r");
        for(int i=0;i<pixels;i++)
            for(int j=0;j<pixels;j++)
                begin
                    $fscanf(fd,"%h",original_matrix[i][j]);
                end
                
        fd2 = $fopen("C:\\Users\\AASHREY PATEL\\Desktop\\python\\venv\\original_image.txt","r");
        for(int i=0;i<pixels;i++)
            for(int j=0;j<pixels;j++)
                begin
                    $fscanf(fd2,"%h",sharpened_matrix[i][j]);
                end        
  //      kernal =  '{{1,2,1},{2,4,2},{1,2,1}};
//        foreach(kernal[i,j]) begin
//        kernal[i][j] = kernal[i][j]>>4; end
        $fclose(fd);
        $fclose(fd2);
         fd1 = $fopen("C:\\Users\\AASHREY PATEL\\Desktop\\python\\venv\\blended_image.txt","w");
         #10000000;
         for(int i=0;i<pixels;i++)begin
            for(int j=0;j<pixels;j++)
                begin
                    $fwrite(fd1,"%h ",blended_matrix[i][j]);
                end
                $fwrite(fd1,"\n");
                end
             $fclose(fd1);   
        #10000000;
    end
endmodule