.section .rodata
    msg_main_print_obj1:
    .string "Obj1 is\n"

    msg_main_print_obj2:
    .string "Obj2 is\n"

    msg_main_print_obj1_values:
    .string "chChar = %c, iNo = %d, shiNo = %hd\n\n"

    msg_main_print_obj2_values:
    .string "chChar = %c, iNo = %d, shiNo = %hd\n"
.section .data
    .globl  obj1
    .type   obj1, @object
    .size   obj1, 12
    .align  4
obj1:
    .ascii  "A"
    .zero   3
    .int    10
    .value  20

.section .text
.globl  main 
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $12, %esp

    movb    $'B', -12(%ebp) # chChar
    movl    $30, -8(%ebp)   # iNo
    movw    $40, -4(%ebp)   # shiNo   

    pushl   $msg_main_print_obj1
    call    printf
    addl    $4, %esp

    movl    $obj1, %ebx
    xorl    %eax, %eax
    movb    (%ebx), %al     # chChar
    movl    4(%ebx), %edx   # iNo
    xorl    %ecx, %ecx
    movw    8(%ebx), %cx    # shiNo
    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_obj1_values
    call    printf
    addl    $16, %esp

    pushl   $msg_main_print_obj2
    call    printf
    addl    $4, %esp

    leal    -12(%ebp), %ebx
    xorl    %eax, %eax
    movb    (%ebx), %al     # chChar
    movl    4(%ebx), %edx   # iNo
    xorl    %ecx, %ecx
    movw    8(%ebx), %cx    # shiNo
    
    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_obj2_values
    call    printf
    addl    $16, %esp

    pushl   $0
    call    exit

