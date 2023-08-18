.section .rodata
    msg_main_print_1:
    .string "Carry bit on\n"

    msg_main_print_2:
    .string "Carry bit off\n"

.section .text
.globl  main 
.type   main, @function
main:
    andl    $-16, %esp
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    movl    $4294967290, %eax
    movl    $5, %edx
    addl    %edx, %eax

    jc      label_carry_bit_on
    movl    $msg_main_print_2, (%esp)
    call    printf
    jmp     label_exit

label_carry_bit_on:
    movl    $msg_main_print_1, (%esp)
    call    printf

label_exit:

    movl    $0, (%esp)
    call    exit