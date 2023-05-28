.section .rodata
	msg_main_print:
	.string "In main, number is %d\n"

.section .data
	.globl	g_iNo		#linker error because both file (main.s and fun.s having same name global variable with the external linkage)
	.type 	g_iNo, @object
	.size	g_iNo, 4
	.align 	4
	g_iNo:
	.int 10

.section .text
.globl	main
.type 	main, @function
main:
	pushl 	%ebp
	movl	%esp, %ebp

	movl	g_iNo, %eax
	pushl	%eax
	pushl	$msg_main_print
	call 	printf
	addl	$8, %esp

	call	fun
	
	pushl	$0
	call 	exit
