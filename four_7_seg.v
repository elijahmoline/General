module display(
  input CLK100MHZ,
  output [7:0] AN,
  output CA,CB,CC,CD,CE,CF,CG,DP
);
  clk_1kHz gate1(CLK100MHZ,CLK_1kHz);
  clk_2kHz gate2(CLK100MHZ,CLK_2kHz);
  
  assign AN[7:4] = 8'b1111_11; 
  assign AN[0] = ~CLK_1kHz & ~CLK_2kHz;   
  assign AN[1] = CLK_1kHz & ~CLK_2kHz;
  assign AN[2] = ~CLK_1kHz & CLK_2kHz;
  assign AN[3] = CLK_1kHz & CLK_2kHz;
  
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
