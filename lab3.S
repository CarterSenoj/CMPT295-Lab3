    .section .note.GNU-stack, ""
    .global abs_value
    .global power2
    .global hailstone_length
    .text

abs_value:
cmp $0, %rdi
jl negate

do_nothing:
mov %rdi, %rax
ret

negate:
neg %rdi
mov %rdi, %rax
ret


power2:
push %rbx
push %r12
push %r13

mov %rdi, %rbx # remember %rdi
mov $0, %r12 # loop tracker
mov $1, %r13 # accumulator

# if the entry is 0 just print the base case (1)

print_power:
mov %r13, %rdi
call print_uint64
add %r13, %r13
add $1, %r12
cmp %rbx, %r12
jbe print_power

pop %rbx
pop %r12
pop %r13
ret

hailstone_length:
ret