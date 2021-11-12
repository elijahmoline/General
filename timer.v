`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2021 12:04:52 PM
// Design Name: 
// Module Name: counters
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


module clocks(
input CLK100MHZ,
input high,
input low,
output reg CLK_OUT
    );
    reg [27:0] ctr=0;
    always @ (posedge CLK100MHZ) begin
        if(ctr==high) begin
            CLK_OUT <= 1'b0;
            ctr <= ctr + 1;            
        end else if(ctr==low) begin
            CLK_OUT <= 1'b1;
            ctr <= 0;
        end else begin
            ctr <= ctr + 1;
        end         
    end
    
endmodule

module blink(
input CLK100MZ,
output [0:6]LED
);
clocks c3 (CLK100MHZ,99_999_999,99_999_999,CLK3);
clocks c4 (~CLK3,99_999_999,99_999_999,CLK4);
clocks c5 (~CLK4,99_999_999,99_999_999,CLK5);
clocks c6 (~CLK5,99_999_999,99_999_999,CLK6);

assign LED[3]=CLK3;
assign LED[4]=CLK4;
assign LED[5]=CLK5;
assign LED[6]=CLK6;

endmodule
