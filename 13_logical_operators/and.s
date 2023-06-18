.section .rodata
    msg_main_print1:
    .string "Enter three numbers : \t"

    msg_main_scan:
    .string "%d %d %d"

    msg_main_print2:
    .string "iNo1 is %d\niNo2 is %d\niNo3 is %d\niAns is %d\n"

.section .text
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $16, %esp

    pushl   $msg_main_print1
    call    puts
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

    movl    -4(%ebp), %eax      #iNo1
    cmpl    $0, %eax            #false
    je      label_second_and
    movl    -8(%ebp), %eax      #iNo2
    addl    $1, -8(%ebp)
    cmpl    $0, %eax            #false
    je      label_second_and
    movl    $1, %eax            #true

label_second_and:
    cmpl    $0, %eax            #first && result
    je      label_result
    movl    -12(%ebp), %eax     #iNo3
    addl    $1, -12(%ebp)
    cmpl    $0, %eax
    je      label_result
    movl    $1, %eax

label_result:
    movl    %eax, -16(%ebp)     #iAns

    movl    -4(%ebp), %edx      #iNo1
    movl    -8(%ebp), %ecx      #iNo2
    movl    -12(%ebp), %ebx     #iNo3
    pushl   %eax
    pushl   %ebx
    pushl   %ecx
    pushl   %edx
    pushl   $msg_main_print2
    call    printf
    addl    $20, %esp

    pushl   $0
    call    exit

