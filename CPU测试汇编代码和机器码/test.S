    .org 0x0
    .set noat
    .set noreorder
    .set nomacro
    .global _start
    
_start:
    add $t1, $t1, 5
    addiu $t2, $t2, 20
    add $t4, $t4, 5
    lui $t5, 0xbfc1
    sw $t4, ($t5)
    lw $t6, ($t5)
    add $t3, $t3, 2
    srav $t2, $t2, $t3     
    beq $t4, $t6, loop
    add $t4, $t1, 5
loop:
    addiu $t2, $t2, 1
    j loop
    addiu $t2, $t2, 20
    
