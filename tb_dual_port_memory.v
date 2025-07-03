`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2025 22:36:08
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

    parameter ADDR_WIDTH = 4;
    parameter DATA_WIDTH = 8;

    reg wr_clk = 0, rd_clk = 0;
    reg wr_en = 0, rd_en = 0;
    reg [ADDR_WIDTH-1:0] wr_addr = 0, rd_addr = 0;
    reg [DATA_WIDTH-1:0] din = 0;
    wire [DATA_WIDTH-1:0] dout;

    // Clock generation
    always #5 wr_clk = ~wr_clk;
    always #7 rd_clk = ~rd_clk;

    // Instantiate memory
    dual_port_memory #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) mem_inst (
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
        $display("==== Start Dual-Port Memory Test ====");

        // Write data at address 2
        @(posedge wr_clk);
        wr_en   = 1;
        wr_addr = 4'd2;
        din     = 8'hA5;
        @(posedge wr_clk);
        wr_en   = 0;

        // Wait some time before read (safely out of write zone)
        repeat (3) @(posedge rd_clk);

        // Read data from address 2
        @(posedge rd_clk);
        rd_en   = 1;
        rd_addr = 4'd2;
        @(posedge rd_clk);
        rd_en   = 0;

        // Wait for data to settle
        #2;
        $display("Read from address 2: dout = %h", dout);

        #20;
        $display("==== End Simulation ====");
        $finish;
    end

endmodule


