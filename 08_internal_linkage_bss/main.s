.section .rodata
	msg_main_print:
	.string "In main, number is %d\n"

.section .data
	.lcomm	g_iNo, 4	#.lcomm means internal linkage ('l' means local)

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
