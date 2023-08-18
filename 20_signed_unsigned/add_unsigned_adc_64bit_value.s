.section .rodata
    msg_main_print:
    .string "Addition is : %qd"

.section .data
.globl  data1
.type   data1, @object
.size   data1, 8
.align  4
data1:
    .quad    4294967296

.globl  data2
.type   data2, @object
.size   data2, 8
.align  4
data2:
    .quad    2147483648

.section .text
.globl  main
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    data1, %eax
    movl    data1 + 4, %edx
    movl    data2, %ecx
    movl    data2 + 4, %ebx

    addl    %eax, %ecx
    adcl    %edx, %ebx

    movl    $msg_main_print, (%esp)
    movl    %ecx, 4(%esp)
    movl    %ebx, 8(%esp)
    call    printf

    movl    $0, (%esp)
    call    exit