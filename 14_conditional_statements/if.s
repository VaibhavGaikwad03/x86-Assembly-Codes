.section .rodata
    msg_main_print_enter:
    .string "Enter number : \t"

    msg_main_scan:
    .string "%d"

    msg_main_print_even:
    .string "Number is even\n"

.section .text
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $4, %esp

    pushl   $msg_main_print_enter
    call    printf
    addl    $4, %esp

    leal    -4(%ebp), %ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $4, %esp

    movl    $2, %ecx
    movl    -4(%ebp), %eax
    xorl    %edx, %edx
    divl    %ecx
    cmpl    $0, %edx
    jne     label_exit
    pushl   $msg_main_print_even
    call    printf
    addl    $4, %esp

label_exit:
    pushl   $0
    call    exit
