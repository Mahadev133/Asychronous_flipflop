`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2025 22:43:41
// Design Name: 
// Module Name: tb_two_flipflop_sync
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


`timescale 1ns/1ps

module tb_two_flipflop_sync;

    reg clk = 0;
    reg async_in = 0;
    wire sync_out;

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    // Instantiate DUT
    two_flipflop_sync dut (
        .clk(clk),
        .async_in(async_in),
        .sync_out(sync_out)
    );

    initial begin
        $dumpfile("sync.vcd");
        $dumpvars(0, tb_two_flipflop_sync);

        $display("Time\tclk\tasync_in\tsync_out");
        $monitor("%4t\t%b\t%b\t\t%b", $time, clk, async_in, sync_out);

        // Step 1: async_in goes high
        #3 async_in = 1;  // Goes high before clk edge
        #30 async_in = 0; // Stay high long enough to be captured
        #30 $finish;
    end

endmodule


