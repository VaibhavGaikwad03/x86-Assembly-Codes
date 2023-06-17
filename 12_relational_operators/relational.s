.section .rodata
    msg_main_print1:
    .string "Enter three numbers : \t"

    msg_main_scan:
    .string "%d %d %d"

    msg_main_print2:
    .string "Answer is : %d\n"

.section .text
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    pushl   $msg_main_print1
    call    printf
    addl    $4, %esp

    leal    -4(%ebp), %eax
    leal    -8(%ebp), %edx
    leal    -12(%ebp), %ecx

    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_scan
    call    scanf
    addl    $16, %esp

    movl    -4(%ebp), %eax
    movl    -8(%ebp), %edx
    cmpl    %edx, %eax
    jl      label_less_true
    movl    $0, %eax
    jmp     label_not_equal_check

label_less_true:
    movl    $1, %eax

label_not_equal_check:
    movl    -12(%ebp), %edx
    cmpl    %edx, %eax
    jne     label_not_equal_true
    movl    $0, %eax
    jmp     label_result

label_not_equal_true:
    movl    $1, %eax

label_result:
    movl    %eax, -16(%ebp)

    pushl   %eax
    pushl   $msg_main_print2
    call    printf
    addl    $8, %esp

    pushl   $0
    call    exit

