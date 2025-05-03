`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2024 12:25:13 PM
// Design Name: 
// Module Name: sharpening
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

parameter P = 32;

module sharpening(
   input clk,
   input reg [7:0] image[P][P],
   input logic [7:0] kernal[3][3],
//   output logic [7:0] multiplication[3][3],
//   output logic [7:0] mul[3][3],
   output logic [7:0] out_image[P][P]
   //output logic [7:0] output_image[N][N]
//   output logic [7:0] padmatrix[P+2][P+2]   
);
   logic [7:0] multiplication[3][3];
   logic [7:0] mul[3][3];
   logic [7:0] padmatrix[P+2][P+2];   
   reg [7:0] zeropad[P+2][P+2];
   //reg [7:0] out_image1[N][N] = '{default: '0};
   int i=0,j=0,k=0,l=0,m=0,q=0,p=0,r=0;
   int add, div, addition;
    
   always@(posedge clk) begin
      //for(j=0;j<N;j=j+1) begin
      zeropad[i][j] <= image[i][j];
      j <= j + 1;
      if(j==(P-1)) begin
         j <= 0;
         i <= i + 1;
         if(i==(P-1)) begin
            i <= P-1;
            j <= P-1; 
            multiplication[k][l] <= $signed({1'b0,zeropad[k+q][l+m]}) * $signed(kernal[k][l]);
            l <= l + 1;
            if(l==3) begin
               l <= 0;
               k <= k + 1;
               if(k==2) begin
                  k <= 0; 
                  m <= m+1;
                  if(m==(P-1) && q<P) begin
                     q <= q+1;
                     m <= 0;
                  end
                  foreach(multiplication[i,j]) begin
                     mul[i][j] = multiplication[i][j];
                     add = $signed(add) + mul[i][j];
                     //multiplication[i][j] <= 0;   
                  end 
                  //multiplication[i][j] = 0;
                  addition = $signed(add);
                  out_image[p][r] = addition;
                  add = 0;
//                  r = r + 1;
                  if(r==P && p<P) begin
                     p = p + 1;
                     r = 0;
                  end
                  else begin
                    r = r + 1;
                  end     
               end
            end    
         end
      end         
   end  

   assign padmatrix = zeropad;
     
endmodule
