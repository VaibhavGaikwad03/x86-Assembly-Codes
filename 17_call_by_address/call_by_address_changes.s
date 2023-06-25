.section .rodata
    msg_main_print1:
    .string "In main, %d\n"

    msg_main_print2:
    .string "Leaving main, %d\n"

    msg_fun_print1:
    .string "In fun, %d\n"

    msg_fun_print2:
    .string "Leaving fun, %d\n"

.section .text
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $4, %esp
    movl    $10, -4(%ebp)

    movl    -4(%ebp), %eax
    pushl   %eax
    pushl   $msg_fun_print1
    call    printf
    addl    $8, %esp

    leal   -4(%ebp), %ebx
    pushl   %ebx
    call    fun
    addl    $4, %esp

    movl    -4(%ebp), %eax
    pushl   %eax
    pushl   $msg_fun_print2
    call    printf
    addl    $8, %esp  

    pushl   $0
    call    exit

.globl  fun
.type   fun, @function
fun:
    pushl   %ebp
    movl    %esp, %ebp

    movl    8(%ebp), %ebx
    movl    (%ebx), %eax
    pushl   %eax
    pushl   $msg_fun_print1
    call    printf
    addl    $8, %esp

    movl    8(%ebp), %ebx
    addl    $1, (%ebx)

    movl    (%ebx), %eax
    pushl   %eax
    pushl   $msg_fun_print2
    call    printf
    addl    $8, %esp

    movl    %ebp, %esp
    popl    %ebp
    ret
