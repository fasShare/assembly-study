.section .data
a: .int 30
b: .int 100
.section .text
.global main
main:
	leal a, %eax
	pushl %eax
	leal b, %eax
	pushl %eax
	# 交换a, b
	call swap_two_long
	# 跳过push的a, b
	addl $8, %esp
	#设置返回值
	movl b, %ebx
	#退出程序
	jmp exit

swap_two_long:
	pushl %ebp
	movl %esp, %ebp
	# 为局部变量分配空间
	subl $4, %esp
	# 取出参数
	movl 8(%ebp), %edx
	movl 12(%ebp), %ecx
	# 交换值,movl后面不能跟两个间接寻址
	movl (%edx), %ebx
	movl %ebx, -4(%ebp)

	movl (%ecx), %ebx
	movl %ebx, (%edx)

	movl -4(%ebp), %ebx
	movl %ebx, %ecx

	movl %ebp, %esp
	popl %ebp
	ret

exit:
	movl $1, %eax
	int $0x80
