`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2025 12:52:56
// Design Name: 
// Module Name: dual_port_memory
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


module dual_port_memory #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 8
)(
    input wire                    wr_clk,
    input wire                    rd_clk,
    input wire                    wr_en,
    input wire                    rd_en,
    input wire [ADDR_WIDTH-1:0]   wr_addr,
    input wire [ADDR_WIDTH-1:0]   rd_addr,
    input wire [DATA_WIDTH-1:0]   din,
    output reg [DATA_WIDTH-1:0]   dout
);


    reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];


    always @(posedge wr_clk) begin
        if (wr_en)
            mem[wr_addr] <= din;
    end


    always @(posedge rd_clk) begin
        if (rd_en)
            dout <= mem[rd_addr];
    end

endmodule