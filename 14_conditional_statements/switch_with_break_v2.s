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

    #case 1
    cmpl    $1, %eax
    je      label_case_1

    #case 2
    cmpl    $2, %eax
    je      label_case_2

    #case 3
    cmpl    $3, %eax
    je      label_case_3

    #case 4
    cmpl    $4, %eax
    je      label_case_4

    #default case
    jmp     default_case

label_case_1:
    pushl   $msg_main_print_addition
    call    printf
    addl    $4, %esp
    jmp     label_exit

label_case_2:
    pushl   $msg_main_print_subtraction
    call    printf
    addl    $4, %esp
    jmp     label_exit

label_case_3:
    pushl   $msg_main_print_multiplication
    call    printf
    addl    $4, %esp
    jmp     label_exit

label_case_4:
    pushl   $msg_main_print_divison
    call    printf
    addl    $4, %eax
    jmp     label_exit

default_case:
    pushl   $msg_main_print_invalid
    call    printf
    addl    $4, %esp

label_exit:
    pushl   $0
    call    exit
    