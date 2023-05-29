.section .rodata
	msg_print:
	.string "g_iNo is : %d\n"

.section .bss
	.comm g_iNo, 4, 4	#uninitialized global variable 

.section .text
.globl main
.type main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
		
	movl 	g_iNo, %eax
	pushl	%eax
	pushl	$msg_print
	call 	printf
	addl	$8, %esp

	pushl 	$0
	call	exit
