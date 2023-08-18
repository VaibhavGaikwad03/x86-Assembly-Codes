.section .rodata
    msg_main_print_numerator:
    .string "Enter numerator : \t"

    msg_main_print_denominator:
    .string "Enter denominator : \t"

    msg_main_print_quotient:
    .string "Quotient is : %d\n"

    msg_main_print_remainder:
    .string "Remainder is : %d\n"

    msg_main_scan:
    .string "%d"

.section .text
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $12, %esp

    pushl   $msg_main_print_numerator
    call    printf
    addl    $4, %esp

    leal    -4(%ebp), %eax
    pushl   %eax
    pushl   $msg_main_scan
    call    scanf
    addl    $8, %esp

    pushl   $msg_main_print_denominator
    call    printf
    addl    $4, %esp

    leal    -8(%ebp), %eax
    pushl   %eax
    pushl   $msg_main_scan
    call    scanf
    addl    $8, %esp

    movl    -4(%ebp), %eax
    movl    -8(%ebp), %ecx
    xorl    %edx, %edx
    cltd
    idiv    %ecx

    movl    %edx, -12(%ebp)

    pushl   %eax
    pushl   $msg_main_print_quotient
    call    printf
    addl    $8, %esp

    movl    -12(%ebp), %eax

    pushl   %eax
    pushl   $msg_main_print_remainder
    call    printf
    addl    $8, %esp

    pushl   $0
    call    exit

    