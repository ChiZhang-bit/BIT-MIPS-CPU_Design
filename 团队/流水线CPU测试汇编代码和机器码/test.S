    .org 0x0
    .set noat
    .set noreorder
    .set nomacro
    .global _start
_start:
    addi $t1, $t3, 10
    sub $t2, $t3, -10
    # 数据相关 此处插入两条空指令
    sub $t3, $t1, $t1
    addu $t4, $t2, 20
    
    or $t5, $t2, $t1
    xori $t6, $t3, 10  
    andi $t7, $t2, 10
    
    subu $s1, $t2, $t1
    # 数据相关 插入三条空指令
    andi $s2, $s1, 10
    ori $s3, $t2, 10
    
    nor $s4, $t0, $t1
    xori $s5, $t0, 0
    lui $s6, 0x1001
    # 数据相关 插入三条空指令
    sw $s5, ($s6)
    lw $s7, ($s6)
loop:
    xor $t2, $t2, $t2
    addi $t2, $t2, 1
    j loop
    # 控制相关 冲刷流水线 下一条指令不会被执行
    ori $t6, $t6, 10
    
    
