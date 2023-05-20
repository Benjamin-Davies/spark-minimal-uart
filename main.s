.section .text.init
.globl _start

_start:
  # Store the UART address in a0 so we can use it later
  li a0, 0x10000000 # UART

  # Enable FIFO
  li a1, 0x01 # FIFO enable
  sb a1, 0x2(a0) # FIFO Control Register (UART)
  
loop:
  # Check if there is data available
  lb a1, 0x5(a0) # Line Status Register (UART)
  andi a1, a1, 0x01 # Data Ready
  beqz a1, loop

  # Read the data
  lb a1, 0x0(a0)

  # Write the data
  li a2, '\''; sb a2, 0x0(a0)
  sb a1, 0x0(a0) # The character that was read
  li a2, '\''; sb a2, 0x0(a0)
  li a2, '\n'; sb a2, 0x0(a0)

  j loop
