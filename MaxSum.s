.section .data
long_array:
.long 1, 40, 87, 23, 67, 21, 49, 90, 11, 22, 67, 0
.section .text
.global main
main:
	movl $0, %edi								# %edi用来保存下标
	movl long_array(, %edi, 4), %eax			# %eax用来保存当前值
		#内存地址引用格式：地址或偏移量(%基址寄存器, %索引寄存器, 比例因子)
		# 最终地址 = long_array + %基址寄存器（0） + %索引寄存器 * 比例因子
	movl %eax, %ebx								# %ebx用来保存最大值（返回值）

loop:
	cmpl $0, %eax
		je exit
	incl %edi
	movl long_array(, %edi, 4), %eax
	cmpl %eax, %ebx
		jg loop

	movl %eax, %ebx
	jmp loop									# 无条件跳转到loop，防止程序退出

exit:
	movl $1, %eax
	int $0x80
