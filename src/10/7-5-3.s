    .text
    .globl main
main:
    LDR     r0, =0x3ff5000
    LDR     r1, =0x3ff5008
    ADR     r2, dado_memoria
    LDR     r3, [r2]
    MOV     r4, #16
    CMP     r3, r4
    BLCC    write_to_display
termina:
    B       main
write_to_display:
    LDR     r2, =0x1fc00
    STR     r2, [r0]
    ADR     r5, display_numbers
    MOV     r3, r3, LSL #2
    ADD     r5, r5, r3
    LDR     r3, [r5]
    MOV     r3, r3, LSL #10
    STR     r3, [r1]
    mov     pc, lr
display_numbers:
    .word 0x5F, 0x06, 0x3B, 0x2F, 0x66, 0x6D, 0x7D, 0x87, 0x7F, 0x6F, 0x77, 0x7C, 0x59, 0x3E, 0x79, 0x71
dado_memoria:
    .word 0x05
