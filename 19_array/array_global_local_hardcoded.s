.section .rodata
    msg_main_print:
    .string "%d\n"

.section .data
.globl  g_arr
.type   g_arr, @object
.size   g_arr, 12
.align  4
    g_arr:
    .int 10, 20, 30

.section .text
.globl  main 
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $12, %esp

    movl    $40, -12(%ebp)
    movl    $50, -8(%ebp)
    movl    $60, -4(%ebp)

    movl    $2, %eax
    movl    g_arr(, %eax, 4), %eax
    pushl   %eax
    pushl   $msg_main_print
    call    printf
    addl    $8, %esp

    movl    $2, %eax
    movl    -12(%ebp, %eax, 4), %eax
    pushl   %eax
    pushl   $msg_main_print
    call    printf
    addl    $8, %esp

    pushl   $0
    call    exit

    