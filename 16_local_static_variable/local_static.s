.section .data
.type   iNo, @object
.size   iNo, 4
.align  4
iNo:
    .int    10

.section .rodata
    msg_main_print1:
    .string "Calling fun1\n"

    msg_main_print2:
    .string "Calling fun2\n"

    msg_fun1_print:
    .string "In fun1, iNo = %d\n"

    msg_fun2_print:
    .string "In fun2, iNo = %d\n"

.section .text
# main fucntion
.globl  main
.type   main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $4, %esp

    pushl   $msg_main_print1
    call    printf
    addl    $4, %esp

# first loop starts
    movl    $0, -4(%ebp)
    jmp     label_for1_condition

label_for1_body:
    call    fun1

    addl    $1, -4(%ebp)

label_for1_condition:
    movl    -4(%ebp), %eax
    movl    $3, %edx

    cmpl    %edx, %eax
    jl      label_for1_body
# first loop ends

    pushl   $msg_main_print2
    call    printf
    addl    $4, %esp

# second loop starts
    movl    $0, -4(%ebp)
    jmp     label_for2_condition

label_for2_body:
    call    fun2
    
    addl    $1, -4(%ebp)

label_for2_condition:
    movl    -4(%ebp), %eax
    movl    $3, %edx

    cmpl    %edx, %eax
    jl      label_for2_body
# second loop ends

    pushl   $0
    call    exit

# fun1 function
.globl  fun1
.type   fun1, @function
fun1:
    pushl   %ebp
    movl    %esp, %ebp

    subl    $4, %esp
    movl    $10, -4(%ebp)

    addl    $1, -4(%ebp)
    movl    -4(%ebp), %eax

    pushl   %eax
    pushl   $msg_fun1_print
    call    printf
    addl    $8, %esp

    movl    %ebp, %esp
    popl    %ebp
    ret

# fun2 function
.globl  fun2
.type   fun2, @function
fun2:
    pushl   %ebp
    movl    %esp, %ebp

    addl    $1, iNo

    movl    iNo, %eax
    pushl   %eax
    pushl   $msg_fun2_print
    call    printf
    addl    $8, %esp

    movl    %ebp, %esp
    popl    %ebp
    ret

