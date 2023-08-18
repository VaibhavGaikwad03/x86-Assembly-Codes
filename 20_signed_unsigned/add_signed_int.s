.section .rodata
    msg_main_print_1:
    .string "Overflow bit on\n"

    msg_main_print_2:
    .string "Overflow bit off\n"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    $-2147483640, %eax
    movl    $-8, %edx
    addl    %edx, %eax

    jo      label_overflow_bit_on
    movl    $msg_main_print_2, (%esp)
    call    printf
    jmp     label_exit

label_overflow_bit_on:
    movl    $msg_main_print_1, (%esp)
    call    printf

label_exit:

    movl    $0, (%esp)
    call    exit