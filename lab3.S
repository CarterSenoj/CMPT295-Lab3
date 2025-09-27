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
push %rbx 
push %r12

mov $0, %rbx # %rbx is length
mov %rdi, %r12 # accumulator

while:
cmp $1, %r12
je end

add $1, %rbx

mov %r12, %r8
and $1, %r8
jz is_even

is_odd:
imul $3, %r12
add $1, %r12
jmp while

is_even:
shr $1, %r12
jmp while

end:
mov %rbx, %rax
pop %rbx
pop %r12
ret