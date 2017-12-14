.section .data
.section .text
.global main
main:
movl $1, %eax
movl $0, %ebx

int $0x80
