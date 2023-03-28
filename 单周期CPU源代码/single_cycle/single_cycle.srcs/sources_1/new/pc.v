`timescale 1ns / 1ps
`include "head.vh"

module pc(
    input       clk,
    input       rst,
    input       pc_jmp,
    input       pc_beq,
    //beq
    input   [31:0] pc_off,
    //jmp
    input   [31:0] pc_tar,
    output  [31:0] pc_val
    );
    reg     [31:0]  pc_register;
    wire    [31:0]  pc_next;
    assign pc_next = pc_register + 32'h4;
    
    wire    [31:0]  pc_offset = pc_off << 2;
    wire    [31:0]  pc_jmp_loc = {pc_next[31:28],pc_tar[25:0],2'b00};
    wire    [31:0]  pc_beq_loc = pc_next + pc_offset;
    
    always @(posedge clk or negedge rst) begin
        if(!rst) pc_register <= `INITIAL_VAL;
        else if(pc_jmp) pc_register <= pc_jmp_loc;
        else if(pc_beq) pc_register <= pc_beq_loc;
        else pc_register <= pc_next;
    end
    
    assign pc_val = pc_register;
    
endmodule
