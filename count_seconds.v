module display_seconds(
  input CLK100MHZ,
  output [7:0]LED
);
  clk_1Hz(CLK100MHZ,CLK_1Hz);
  count_ticks gate1(CLK_1Hz, sum[7:0]);
  assign LED[7:0] = sum[7:0];
endmodule

module     count_ticks( 
    input CLK_IN, 
    output reg [7:0] sum_out
    );
    
    always @(posedge CLK_IN) begin
        sum_out <= sum_out + 8'b0000_0001;
    end
        
endmodule
module clk_1Hz(
    input incoming_CLK100MHZ,
    output reg outgoing_CLK
    );
    
    // creates 1HZ clock from a 100MHZ clock
    // 1HZ clock has a period of 1 second = 1000ms
    // 100MHz is 100,000,000 cycles
    // log2(10,0000,000) = 26.6, so 27 bits needed for counter
    reg[26:0] ctr;
    
    always @ (posedge incoming_CLK100MHZ) begin
        if (ctr == 49_999_999) begin
            outgoing_CLK <= 1'b1;
            ctr <= ctr + 1;            
        end
        else if (ctr == 99_999_999) begin
            outgoing_CLK <= 1'b0;
            ctr <= 0;
        end
        else begin
            ctr <= ctr + 1;
        end
    end
endmodule
