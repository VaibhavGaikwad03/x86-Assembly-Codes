.section .rodata
	msg_fun_print:
	.string "In fun, Number is %d\n"

.section .bss
	.lcomm	g_iNo, 4	#.lcomm means internal linkage ('l' means local)

.section .text
.globl	fun
.type	fun, @function
fun:
	pushl	%ebp
	movl	%esp, %ebp
	
	movl	g_iNo, %eax
	pushl 	%eax
	pushl	$msg_fun_print
	call	printf
	addl	$8, %esp

	movl	%ebp, %esp
	popl	%ebp
	ret
