`timescale 1ns / 1ps

//parameter ROWS = 32;
//parameter COLS = 32;

module TOP_Module(clock, reset, enhancement_enable);
input clock, reset, enhancement_enable;
reg [14:0]data_address;
logic [7:0] output_image_pixel, input_image_pixel;
logic memory_enable, memory_write_enable, process_enable;

wire process_done;

byte input_image[ROWS][COLS];
byte output_image[ROWS][COLS];

integer write_address = 15'b100000000000000;
integer read_address  = 15'b000000000000000;

BRAM_wrapper bram(.BRAM_PORTA_0_addr(data_address),
                .BRAM_PORTA_0_clk(clock),
                .BRAM_PORTA_0_din(output_image_pixel),
                .BRAM_PORTA_0_dout(input_image_pixel),
                .BRAM_PORTA_0_en(memory_enable),
                .BRAM_PORTA_0_we(memory_write_enable));
integer i = 0;
integer j = 0;
always@(posedge clock) begin
    if(process_done == 0 && enhancement_enable == 1) begin
        process_enable = 1;
        memory_enable = 1;
        memory_write_enable = 0;
        if(read_address == 15'b100000000000000 && i == ROWS) begin
            read_address = 15'b000000000000000;
            i = 0;
            j = 0;
        end
        else begin
            if(j == 128)  begin
                i = i+1;
                j=0;
            end
            else begin
                data_address = read_address;
                input_image[i][j] = input_image_pixel; 
                read_address = read_address + 1;
                j = j+1;
            end         
        end
    
    end
   else if(process_done == 1 && enhancement_enable == 1) begin
        process_enable = 1;
        memory_enable = 1;
        memory_write_enable = 1;
        if(write_address == 15'b111111111111111 && i == ROWS) begin
            write_address = 15'b100000000000000;
            i = 0;
            j = 0;
        end
        else begin
            if(j == 128)  begin
                i = i+1;
                j=0;
            end
            else begin
                data_address = write_address;
                output_image_pixel = output_image[i][j]; 
                write_address = write_address + 1;
                j = j+1;
            end         
        end

    end
    else begin
        process_enable = 0;
        memory_enable = 0;
        memory_write_enable = 0;
    
    end

end

Image_process_top process(input_image, clock, reset, process_enable, output_image, process_done);



endmodule






