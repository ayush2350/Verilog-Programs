`timescale 1ns / 1ps
// this program detects 1101 overalapping sequence
module Sequence_Detector(in, reset, out, clk);

input in, reset, clk;
output reg out;

parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;

reg [1:0] state, next_state;

always @(posedge clk or posedge reset) begin

    if (reset) begin
        state <= s0;
    end
    
    else begin
        state <= next_state;
    end    

end

always @(posedge clk or posedge reset) begin

    if(reset) begin
        out <= 1'b0;
    end
    
    else begin
        out <= ((state == s3) && (in == 1))? 1'b1 : 1'b0;
    end

end

always @(in or state) begin

    case (state)
    
        s0 : next_state <= in ? s1:s0;
        
        s1 : next_state <= in ? s2:s0;
        
        s2 : next_state <= in ? s2:s3;
        
        s3 : next_state <= in ? s1:s0;
        
    endcase    
end
endmodule
