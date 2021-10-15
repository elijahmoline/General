`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2021 01:12:08 PM
// Design Name: 
// Module Name: lab5
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


module lab5(
    input [7:0] SW,
     output [7:0] LED, 
      output LED17_R,
       output LED17_G,
        output LED17_B
    );
    assign LED17_R = SW[0];
    assign LED17_G = SW[1];
    assign LED17_B = SW[2];
    assign LED[3] = SW[3];
endmodule
