`timescale 1ns / 1ps
`include "head.vh"


module shifter(d,sa,sh);
    input   [31:0] d;
    input   [31:0] sa;
    output  [31:0] sh;
    reg     [31:0] sh;
    always @* begin
        sh = $signed(d) >>> sa;
    end
endmodule
