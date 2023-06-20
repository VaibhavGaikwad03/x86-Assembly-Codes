.section .rodata
    msg_main_print_enter_number:
    .string "Enter a number : \t"

    msg_main_print_less_than:
    .string "Number is less than 2\n"

    msg_main_print_greater_than:
    .string "Number is greater than 2\n"

    msg_main_print_equal_to:
    .string "Number is 2\n"

    msg_main_scan:
    .string "%d"

.section .text
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $4, %esp
    pushl   $msg_main_print_enter_number
    call    printf
    addl    $4, %esp

    leal    -4(%ebp), %ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8, %esp

    movl    -4(%ebp), %eax
    cmpl    $2, %eax
    jge      label_else_if
    pushl   $msg_main_print_less_than
    call    printf
    addl    $4, %esp
    jmp     label_exit

label_else_if:
    je      label_else
    pushl   $msg_main_print_greater_than
    call    printf
    addl    $4, %esp
    jmp     label_exit

label_else:
    pushl   $msg_main_print_equal_to
    call    printf
    addl    $4, %esp
    jmp     label_exit

label_exit:
    pushl   $0
    call    exit
