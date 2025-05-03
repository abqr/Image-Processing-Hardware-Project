`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2024 08:40:25 PM
// Design Name: 
// Module Name: smoothening_tb
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


module smoothening_tb(

    );
    //byte img[40][40];
    //byte fil[3][3];
    //byte out[40][40];
    int fd,fd1;
    localparam Z = 512;
    logic clk;
    logic [7:0] image[Z][Z];
    logic [7:0] kernal[3][3];
    logic [7:0] multiplication[3][3];
    //logic [7:0] zeropad[6][6];
    logic [7:0] out_image[Z][Z];
    //logic [7:0] output_image[Z][Z];
    logic [7:0] padmatrix[Z+2][Z+2];
    logic [7:0] mul[3][3];
    
    //int i,j;
    
    initial begin
    clk = 0;
    forever #1 clk = ~clk;
    end
    
    smoothing uut(clk,image,kernal,multiplication,mul,out_image,padmatrix);

    //smoothing uut(img,fil,out);
    initial begin
        fd = $fopen("C:\\Users\\AASHREY PATEL\\Desktop\\python\\venv\\original_image.txt","r");
        for(int i=0;i<Z;i++)
            for(int j=0;j<Z;j++)
                begin
                    $fscanf(fd,"%h",image[i][j]);
                end
        kernal =  '{{1,2,1},{2,4,2},{1,2,1}};
//        foreach(kernal[i,j]) begin
//        kernal[i][j] = kernal[i][j]>>4; end
        $fclose(fd);
         fd1 = $fopen("C:\\Users\\AASHREY PATEL\\Desktop\\python\\venv\\smooth_image.txt","w");
         #10000000;
         for(int i=0;i<Z;i++)begin
            for(int j=0;j<Z;j++)
                begin
                    $fwrite(fd1,"%h ",out_image[i][j]);
                end
                $fwrite(fd1,"\n");
                end
             $fclose(fd1);   
        #10000000;
    end
endmodule