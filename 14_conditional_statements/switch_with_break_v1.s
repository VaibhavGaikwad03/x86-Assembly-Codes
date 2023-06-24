.section .rodata
    msg_main_print_menu:
    .string "1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n"

    msg_main_print_enter_data:
    .string "Enter your choice : \t"

    msg_main_scan:
    .string "%d"

    msg_main_print_addition:
    .string "Addition\n"

    msg_main_print_subtraction:
    .string "Subtraction\n"

    msg_main_print_multiplication:
    .string "Multiplication\n"

    msg_main_print_divison:
    .string "Division\n"

    msg_main_print_invalid:
    .string "Invalid choice\n"

.section    .text
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $4, %esp

    pushl   $msg_main_print_menu
    call    printf
    addl    $4, %esp

    pushl   $msg_main_print_enter_data
    call    printf
    addl    $4, %esp

    leal    -4(%ebp), %ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8, %esp

    movl    -4(%ebp), %eax
    cmpl    $1, %eax
    jne     label_choice_2
    pushl   $msg_main_print_addition
    call    printf
    addl    $4, %esp
    jmp     label_exit

label_choice_2:
    cmpl    $2, %eax
    jne     label_choice_3
    pushl   $msg_main_print_subtraction
    call    printf
    addl    $4, %esp
    jmp     label_exit

label_choice_3:
    cmpl    $3, %eax
    jne     label_choice_4
    pushl   $msg_main_print_multiplication
    call    printf
    addl    $4, %esp
    jmp     label_exit

label_choice_4:
    cmpl    $4, %eax
    jne    label_invalid
    pushl   $msg_main_print_divison
    call    printf
    addl    $4, %esp
    jmp     label_exit

label_invalid:
    pushl   $msg_main_print_invalid
    call    printf
    addl    $4, %esp

label_exit:
    pushl   $0
    call    exit
