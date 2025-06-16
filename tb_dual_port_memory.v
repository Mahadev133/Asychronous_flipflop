`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2025 12:38:54
// Design Name: 
// Module Name: tb_dual_port_memory
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


module tb_dual_port_memory;

    reg wr_clk = 0, rd_clk = 0;
    reg wr_en = 0, rd_en = 0;
    reg [3:0] wr_addr = 0, rd_addr = 0;
    reg [7:0] din = 0;
    wire [7:0] dout;

  
    always #5 wr_clk = ~wr_clk;
    always #7 rd_clk = ~rd_clk;

    dual_port_memory mem_inst (
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .wr_addr(wr_addr),
        .rd_addr(rd_addr),
        .din(din),
        .dout(dout)
    );

    initial begin
     
        #10 wr_en = 1;
        din = 8'hA5;
        wr_addr = 4'd2;
        #10 wr_en = 0;


        #30 rd_en = 1;
        rd_addr = 4'd2;
        #10 rd_en = 0;

        #50 $finish;
    end

endmodule
