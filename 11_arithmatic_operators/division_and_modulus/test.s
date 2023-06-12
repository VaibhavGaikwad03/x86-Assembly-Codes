.section .rodata
msg_main_print_numerator:
.string "Enter numerator : \t"

msg_main_print_denominator:
.string "Enter denominator : \t"

msg_main_print_quotient:
.string "Quotient is : %d\n"

msg_main_print_remainder:
.string "Remainder is : %d\n"

msg_main_scan:
.string "%d"
.section .text
.globl main
.type main, @function
main:
pushl %ebp
movl %esp, %ebp

subl    $12, %esp

pushl   $msg_main_print_numerator
call    printf
addl    $4, %esp

leal    -4(%ebp), %eax
pushl   %eax
pushl   $msg_main_scan
call    scanf
addl    $8, %esp

pushl   $msg_main_print_denominator
call    printf
addl    $4, %esp

leal    -8(%ebp), %eax
pushl   %eax
pushl   $msg_main_scan
call    scanf
addl    $8, %esp

movl    -4(%ebp), %ecx  # Store numerator in %ecx
movl    -8(%ebp), %eax  # Store denominator in %eax
xorl    %edx, %edx
idiv    %ecx            # Divide %ecx by %eax, quotient in %eax, remainder in %edx

movl    %eax, -12(%ebp) # Store quotient in -12(%ebp)
movl    %edx, -16(%ebp) # Store remainder in -16(%ebp)

pushl   -12(%ebp)
pushl   $msg_main_print_quotient
call    printf
addl    $8, %esp

pushl   -16(%ebp)
pushl   $msg_main_print_remainder
call    printf
addl    $8, %esp

movl    $0, %eax
leave
ret