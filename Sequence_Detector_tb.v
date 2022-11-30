`timescale 1ns / 1ps

module Sequence_Detector_tb();

reg IN, CLK, RESET;
wire OUT;

Sequence_Detector dut(.in(IN), .clk(CLK), .reset(RESET), .out(OUT));
 initial begin
    CLK = 0;
    RESET = 1;
    #5 RESET = 1;
    #5 RESET = 0;
 end
 
 always #5 CLK = ~CLK;
 
 initial begin
    #10 IN = 1;
    #10 IN = 1;
    #10 IN = 0;
    #10 IN = 1; //
    #10 IN = 1;
    #10 IN = 0;
    #10 IN = 0;
    #10 IN = 1;
    #10 IN = 1;
    #10 IN = 0;
    #10 IN = 1; //
    #10 IN = 0;
    #10 IN = 1;
    #10 IN = 0;
    #10 IN = 1;
    #10 IN = 1;
    #10 IN = 0;
    #10 IN = 0;
    #10 IN = 1;
    #10 IN = 1;
    #10 IN = 0;
    #10 IN = 0;
    #10 IN = 1;
    #10 IN = 1;
    #10 IN = 0;
    #10 IN = 1; //
    #10 IN = 1;
    #10 IN = 0;
    #10 IN = 1; //
    #10 IN = 0;
    #10 $finish;
        
 end

endmodule
