.globl factorial

.data
n: .word 8

.text
# Don't worry about understanding the code in main
# You'll learn more about function calls in lecture soon
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

# factorial takes one argument:
# a0 contains the number which we want to compute the factorial of
# The return value should be stored in a0
factorial:
    # YOUR CODE HERE

    mv t0, a0 # i
    li t1, 1  # result
    li t2, 1  # 1
    j loop

loop: 
    bge t2, t0, finish # if 1 >= i then exit the loop = (i <= 1)
    mul t1, t1, t0    # result *= i
    addi t0, t0, -1   # i--
    j loop	      # loop

finish: 
    mv a0, t1
    # This is how you return from a function. You'll learn more about this later.
    # This should be the last line in your program.
    jr ra
# public int factorial(int n){
#    int result = 1;
#    for(int i = n; i > 1; i--){
#	result *= i;
#    }
#    return result;
# }
