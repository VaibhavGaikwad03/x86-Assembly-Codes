.section .rodata
	msg_main_print:
	.string "In main, number is %d\n"

.section .data
	.comm	g_iNo, 4, 4	#linker ignoring our global varible because there are same name variables in two files
				#that's why there is no linking error in code
.section .text
.globl	main
.type 	main, @function
main:
	pushl 	%ebp
	movl	%esp, %ebp

	movl	g_iNo, %eax	#accessing 'g_iNo' from fun.s
	pushl	%eax
	pushl	$msg_main_print
	call 	printf
	addl	$8, %esp

	call	fun
	
	pushl	$0
	call 	exit
