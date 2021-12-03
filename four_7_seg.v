module display(
  input CLK100MHZ,
  output [7:0] AN,
  output CA,CB,CC,CD,CE,CF,CG,DP
);
  clk_1kHz gate1(CLK100MHZ,CLK_1kHz);
  clk_2kHz gate2(CLK100MHZ,CLK_2kHz);
  
  wire [7:0] C0;
  wire [7:0] C1;
  wire [7:0] C2;
  wire [7:0] C3;
  
  assign C0[7:0] = 8'b0110_0001;
  assign C1[7:0] = 8'b1101_1011;
  assign C2[7:0] = 8'b1111_0011;
  assign C3[7:0] = 8'b0110_0111;
  
  assign AN[7:4] = 8'b1111_11; 
  assign AN[0] = ~CLK_1kHz & ~CLK_2kHz;   
  assign AN[1] = CLK_1kHz & ~CLK_2kHz;
  assign AN[2] = ~CLK_1kHz & CLK_2kHz;
  assign AN[3] = CLK_1kHz & CLK_2kHz;
  
  assign CA = CLK_1kHz & CLK_2kHz & C0[7] | CLK_1kHz & ~CLK_2kHz & C1[7] | ~CLK_1kHz & CLK_2kHz & C2[7] | CLK_1kHz & CLK_2kHz & C3[7]; 
  assign CB = CLK_1kHz & CLK_2kHz & C0[6] | CLK_1kHz & ~CLK_2kHz & C1[6] | ~CLK_1kHz & CLK_2kHz & C2[6] | CLK_1kHz & CLK_2kHz & C3[6];
  assign CC = CLK_1kHz & CLK_2kHz & C0[5] | CLK_1kHz & ~CLK_2kHz & C1[5] | ~CLK_1kHz & CLK_2kHz & C2[5] | CLK_1kHz & CLK_2kHz & C3[5];
  assign CD = CLK_1kHz & CLK_2kHz & C0[4] | CLK_1kHz & ~CLK_2kHz & C1[4] | ~CLK_1kHz & CLK_2kHz & C2[4] | CLK_1kHz & CLK_2kHz & C3[4];
  assign CE = CLK_1kHz & CLK_2kHz & C0[3] | CLK_1kHz & ~CLK_2kHz & C1[3] | ~CLK_1kHz & CLK_2kHz & C2[3] | CLK_1kHz & CLK_2kHz & C3[3];
  assign CF = CLK_1kHz & CLK_2kHz & C0[2] | CLK_1kHz & ~CLK_2kHz & C1[2] | ~CLK_1kHz & CLK_2kHz & C2[2] | CLK_1kHz & CLK_2kHz & C3[2];
  assign CG = CLK_1kHz & CLK_2kHz & C0[1] | CLK_1kHz & ~CLK_2kHz & C1[1] | ~CLK_1kHz & CLK_2kHz & C2[1] | CLK_1kHz & CLK_2kHz & C3[1];
  
endmodule

module clk_1kHz(
    input incoming_CLK100MHZ,
    output reg outgoing_CLK
    );
   
    reg[16:0] ctr=0;
    
    always @ (posedge incoming_CLK100MHZ) begin
        if (ctr == 49_999) begin
            outgoing_CLK <= 1'b1;
            ctr <= ctr + 1;            
        end else if (ctr == 99_999) begin
            outgoing_CLK <= 1'b0;
            ctr <= 0;
        end else begin
            ctr <= ctr + 1;
        end
    end
endmodule
module clk_2kHz(
    input incoming_CLK100MHZ,
    output reg outgoing_CLK
    );
   
    reg[16:0] ctr=0;
    
    always @ (posedge incoming_CLK100MHZ) begin
      if (ctr == 99_999) begin
            outgoing_CLK <= 1'b1;
            ctr <= ctr + 1;            
        end else if (ctr == 199_999) begin
            outgoing_CLK <= 1'b0;
            ctr <= 0;
        end else begin
            ctr <= ctr + 1;
        end
    end
endmodule
