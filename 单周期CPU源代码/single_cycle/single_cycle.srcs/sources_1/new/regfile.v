`timescale 1ns / 1ps
`include "head.vh"

module regfile(
    input  wire       clk,
    input  wire       rst,

    input  wire[4:0]  reg_ra1,
    input  wire[4:0]  reg_ra2,
    
    input  wire       reg_we,
    input  wire[4:0]  reg_wa,
    input  wire[31:0] reg_wd,
    
    output wire[31:0] reg_rd1,
    output wire[31:0] reg_rd2
    );
    
    reg [31:0] registers[31:0];
    
    assign reg_rd1 = ( (reg_ra1 != 0) ?  registers[reg_ra1] :  32'h00000000);
    assign reg_rd2 = ( (reg_ra2 != 0) ?  registers[reg_ra2] : 32'h00000000 );
    
    integer i;
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            for (i = 0; i <= 31; i = i + 1) registers[i] <= `INITIAL_VAL;
        end
        if (rst && reg_we == 1'b1 && reg_wa != 5'b0) registers[reg_wa] <= reg_wd;
    end
    
endmodule
