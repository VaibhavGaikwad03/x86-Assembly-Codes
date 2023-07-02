.section .rodata
    msg_main_print_enter_obj1_values:
    .string "Enter obj1 values,\n"

    msg_main_print_enter_obj2_values:
    .string "Enter obj2 values,\n"

    msg_main_print_obj1_is:
    .string "Obj1 is\n"

    msg_main_print_obj2_is:
    .string "Obj2 is\n"

    msg_main_print_obj1_values:
    .string "chChar = %c, iNo = %d, shiNo = %hd\n\n"

    msg_main_print_obj2_values:
    .string "chChar = %c, iNo = %d, shiNo = %hd\n"

    msg_main_print_enter_character:
    .string "Enter chChar\t:"

    msg_main_print_enter_integer:
    .string "Enter iNo\t:"

    msg_main_print_enter_short_int:
    .string "Enter shiNo\t:"

    msg_main_scan_character_obj1:
    .string "%c"

    msg_main_scan_integer_obj1:
    .string "%d"

    msg_main_scan_short_int_obj1:
    .string "%hd"

    msg_main_scan_character_obj2:
    .string "%c%c"

    msg_main_scan_integer_obj2:
    .string "%c%d"

    msg_main_scan_short_int_obj2:
    .string "%c%hd"

.section .bss
    .comm   obj1, 12, 4

.section .text
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $13, %esp

    pushl   $msg_main_print_enter_obj1_values
    call    printf
    addl    $4, %esp

    pushl   $msg_main_print_enter_character
    call    printf
    addl    $4, %esp

    movl    $obj1, %ebx
    pushl   %ebx
    pushl   $msg_main_scan_character_obj1
    call    scanf
    addl    $8, %esp

    pushl   $msg_main_print_enter_integer
    call    printf
    addl    $4, %esp

    movl    $obj1, %ebx
    leal    4(%ebx), %ebx
    pushl   %ebx
    pushl   $msg_main_scan_integer_obj1
    call    scanf
    addl    $8, %esp

    pushl   $msg_main_print_enter_short_int
    call    printf
    addl    $4, %esp

    movl    $obj1, %ebx
    leal    8(%ebx), %ebx
    pushl   %ebx
    pushl   $msg_main_scan_short_int_obj1
    call    scanf
    addl    $8, %esp


    
    pushl   $msg_main_print_enter_obj2_values
    call    printf
    addl    $4, %esp

    pushl   $msg_main_print_enter_character
    call    printf
    addl    $4, %esp

    leal    -12(%ebp), %ebx
    leal    -13(%ebp), %edx
    pushl   %ebx
    pushl   %edx
    pushl   $msg_main_scan_character_obj2
    call    scanf
    addl    $12, %esp

    pushl   $msg_main_print_enter_integer
    call    printf
    addl    $4, %esp

    leal    -12(%ebp), %ebx
    leal    -13(%ebp), %edx
    leal    4(%ebx), %eax
    pushl   %eax
    pushl   %edx
    pushl   $msg_main_scan_integer_obj2
    call    scanf
    addl    $12, %esp

    pushl   $msg_main_print_enter_short_int
    call    printf
    addl    $4, %esp

    leal    -12(%ebp), %ebx
    leal    -13(%ebp), %edx
    leal    8(%ebx), %eax
    pushl   %eax
    pushl   %edx
    pushl   $msg_main_scan_short_int_obj2
    call    scanf
    addl    $12, %esp

    pushl   $msg_main_print_obj1_is
    call    printf
    addl    $4, %esp

    movl    $obj1, %ebx
    xorl    %eax, %eax
    movb    (%ebx), %al
    movl    4(%ebx), %edx
    xorl    %ecx, %ecx
    movw    8(%ebx), %cx

    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_obj1_values
    call    printf
    addl    $16, %esp

    pushl   $msg_main_print_obj2_is
    call    printf
    addl    $4, %esp

    leal    -12(%ebp), %ebx
    xorl    %eax, %eax
    movb    (%ebx), %al
    movl    4(%ebx), %edx
    xorl    %ecx, %ecx
    movw    8(%ebx), %cx

    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_obj2_values
    call    printf
    addl    $16, %esp

    pushl   $0
    call    exit

