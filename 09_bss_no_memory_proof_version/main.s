.section .rodata
	msg_main_print:
	.string "In main, number is %d\n"

.section .bss
	.comm	g_iNo, 4, 4	#there is no reserved memory for uninitialized global variable. that's why linker ignores same name global variables
				#we can check out with 'size obj_file_name' command on linux
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
