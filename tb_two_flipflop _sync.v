`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2025 12:47:05
// Design Name: 
// Module Name: tb_two_flipflop _sync
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


module tb_two_flipflop_sync;

    reg clk = 0;
    reg async_in = 0;
    wire sync_out;

    always #5 clk = ~clk;

    two_flipflop_sync sync_inst (
        .clk(clk),
        .async_in(async_in),
        .sync_out(sync_out)
    );

    initial begin
     
        #7 async_in = 1;
        #10 async_in = 0;
        #100 $finish;
    end

endmodule