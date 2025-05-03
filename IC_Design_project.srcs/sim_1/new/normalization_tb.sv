`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2024 02:12:38 AM
// Design Name: 
// Module Name: normalization_tb
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


//module normalization_tb();

//    logic clk;
//    logic reset;
//    logic done;
//    logic [7:0] min_value;
//    logic [7:0] max_value;
//    logic [7:0] data_in[4][4];
//    logic [7:0] data_out[4][4];
//    int i,j;
    
//   matrix_pixel_normalizer uut(clk,reset,min_value,max_value,data_in,done,data_out);
   
//   initial begin
//   clk = 0;
//   forever #5 clk = ~clk;
//   end
   
//   initial begin
//    reset = 1;
//    #10;
//    reset = 0;
//    min_value = 1;
//    max_value = 6;
//    data_in[0][0] = 1;
//    data_in[0][1] = 2;
//    data_in[0][2] = 2;
//    data_in[0][3] = 2;  
//    data_in[1][0] = 3;
//    data_in[1][1] = 2;
//    data_in[1][2] = 2;
//    data_in[1][3] = 2; 
//    data_in[2][0] = 5;
//    data_in[2][1] = 3;
//    data_in[2][2] = 3;
//    data_in[2][3] = 3;
//    data_in[3][0] = 6;
//    data_in[3][1] = 4;
//    data_in[3][2] = 4; 
//    data_in[3][3] = 4;
    
//    end
//endmodule


parameter Z = 512;
module normalization_tb(

    );
    int fd,fd1;
    
    logic clk;
    logic reset, done;
    logic [7:0] min_val, max_val;
    logic [7:0] input_matrix[Z][Z];
    logic [7:0] normalized_matrix[Z][Z];
    
    //int i,j;
    
    initial begin
    clk = 0;
    forever #1 clk = ~clk;
    end
    
    matrix_pixel_normalizer uut(clk,reset,min_val,max_val,input_matrix,done,normalized_matrix);

    //smoothing uut(img,fil,out);
    initial begin
        reset = 1;
        min_val = 27;
        max_val = 255;
        #2 
        reset = 0;
        fd = $fopen("C:\\Users\\AASHREY PATEL\\Desktop\\python\\venv\\blended_image.txt","r");
        for(int i=0;i<Z;i++)
            for(int j=0;j<Z;j++)
                begin
                    $fscanf(fd,"%h",input_matrix[i][j]);
                end
  //      kernal =  '{{1,2,1},{2,4,2},{1,2,1}};
//        foreach(kernal[i,j]) begin
//        kernal[i][j] = kernal[i][j]>>4; end
        $fclose(fd);
         fd1 = $fopen("C:\\Users\\AASHREY PATEL\\Desktop\\python\\venv\\normalized_image.txt","w");
         #10000000;
         for(int i=0;i<Z;i++)begin
            for(int j=0;j<Z;j++)
                begin
                    $fwrite(fd1,"%h ",normalized_matrix[i][j]);
                end
                $fwrite(fd1,"\n");
                end
             $fclose(fd1);   
        #10000000;
    end
endmodule