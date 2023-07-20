.section .rodata
    msg_main_print:
    .string "%d\n"

.section .text
.globl  main 
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $48, %esp

    movl    $10, -48(%ebp)
    movl    $20, -44(%ebp)
    movl    $30, -40(%ebp)
    movl    $40, -36(%ebp)
    movl    $50, -32(%ebp)
    movl    $60, -28(%ebp)
    movl    $70, -24(%ebp)
    movl    $80, -20(%ebp)
    movl    $90, -16(%ebp)
    movl    $100, -12(%ebp)
    movl    $110, -8(%ebp)
    movl    $120, -4(%ebp)

    movl    $2, %eax
    # leal    -48(%ebp, %eax, 16), %ebx # first attempt 

    movl    $4, %eax    # size of element
    movl    $4, %ecx    # no of elements
    mull    %ecx
    movl    $2, %ecx    # index 
    mull    %ecx
    leal    -48(%ebp), %ebx
    addl    %eax, %ebx
    movl    $3, %eax
    movl    (%ebx, %eax, 4), %eax

    pushl   %eax
    pushl   $msg_main_print
    call    printf
    addl    $8, %esp

    pushl   $0
    call    exit

