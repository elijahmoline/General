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
output [0:1]LED
);
wire CLK1,CLK2;
clocks c2 (CLK100MHZ,99_999,199_999,CLK2);// on for 1ms, off for 2 ms
clocks c1 (CLK100MHZ,199_999_999,99_999_999,CLK1);//on for 2s, off for 1s

assign LED[0]=CLK1;
assign LED[1]=CLK2;

endmodule
