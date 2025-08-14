| Instruction       | Description                     | Example                      | Effect / Notes                                              |
|-------------------|---------------------------------|------------------------------|-------------------------------------------------------------|
| MOV Rd, Rn        | Move register → register        | MOV R0, R1                   | Copies value of R1 into R0                                  |
| MOV Rd, #imm      | Move immediate value            | MOV R0, #0x12                 | Loads constant into Rd                                      |
| MOVW Rd, #imm     | Move lower 16 bits              | MOVW R0, #0x1234              | Only lower 16 bits changed                                  |
| MOVT Rd, #imm     | Move upper 16 bits              | MOVT R0, #0x1234              | Only upper 16 bits changed                                  |
| MVN Rd, Rn        | Move bitwise NOT                | MVN R0, R1                    | R0 = NOT R1                                                  |
| LDR Rd, [Rn]      | Load word                       | LDR R0, [R1]                  | R0 = 32-bit value from mem at R1                            |
| STR Rd, [Rn]      | Store word                      | STR R0, [R1]                  | Store R0 into mem at R1                                     |
| LDRB Rd, [Rn]     | Load byte                       | LDRB R0, [R1]                 | Zero-extends 8-bit mem into Rd                              |
| STRB Rd, [Rn]     | Store byte                      | STRB R0, [R1]                 | Stores only low byte of R0                                  |
| LDRH Rd, [Rn]     | Load halfword                   | LDRH R0, [R1]                 | Zero-extends 16-bit mem into Rd                             |
| STRH Rd, [Rn]     | Store halfword                  | STRH R0, [R1]                 | Stores only low halfword of R0                              |
| LDRSB Rd, [Rn]    | Load signed byte                | LDRSB R0, [R1]                | Sign-extends 8-bit mem into Rd                              |
| LDRSH Rd, [Rn]    | Load signed halfword            | LDRSH R0, [R1]                | Sign-extends 16-bit mem into Rd                             |
| ADD Rd, Rn, Op2   | Add                             | ADD R0, R1, R2                | R0 = R1 + Op2                                                |
| ADC Rd, Rn, Op2   | Add with carry                  | ADC R0, R1, R2                | Adds carry flag C                                            |
| ADDS Rd, Rn, Op2  | Add & set flags                 | ADDS R0, R1, R2               | Updates N, Z, C, V flags                                    |
| ADCS Rd, Rn, Op2  | Add w/ carry & flags            | ADCS R0, R1, R2               | Adds C & updates flags                                      |
| SUB Rd, Rn, Op2   | Subtract                        | SUB R0, R1, R2                | R0 = R1 - Op2                                                |
| SBC Rd, Rn, Op2   | Subtract with carry             | SBC R0, R1, R2                | R0 = R1 - Op2 - (1 - C)                                     |
| RSB Rd, Rn, Op2   | Reverse subtract                | RSB R0, R1, R2                | R0 = Op2 - R1                                                |
| RSC Rd, Rn, Op2   | Reverse sub w/ carry            | RSC R0, R1, R2                | R0 = Op2 - R1 - (1 - C)                                     |
| MUL Rd, Rn, Rm    | Multiply                        | MUL R0, R1, R2                | R0 = R1 × R2                                                 |
| MLA Rd, Rs1, Rs2, Rs3 | Multiply & accumulate       | MLA R0, R1, R2, R3            | R0 = (Rs1 × Rs2) + Rs3                                       |
| MLS Rd, Rm, Rs, Rn| Multiply & subtract             | MLS R0, R1, R2, R3            | R0 = Rn - (Rs × Rm)                                          |
| UMULL RdLo, RdHi, Rn, Rm | Unsigned multiply long  | UMULL R0, R1, R2, R3          | 64-bit result split across RdHi:RdLo                         |
| SMULL RdLo, RdHi, Rn, Rm | Signed multiply long    | SMULL R0, R1, R2, R3          | Signed 64-bit result                                         |
| AND Rd, Rn, Op2   | Bitwise AND                     | AND R0, R1, R2                | R0 = R1 AND Op2                                              |
| ORR Rd, Rn, Op2   | Bitwise OR                      | ORR R0, R1, R2                | R0 = R1 OR Op2                                               |
| ORN Rd, Rn, Op2   | Bitwise OR NOT                  | ORN R0, R1, R2                | R0 = R1 OR (NOT Op2)                                         |
| EOR Rd, Rn, Op2   | Bitwise XOR                     | EOR R0, R1, R2                | R0 = R1 XOR Op2                                              |
| TST Rn, Op2       | Test bits (AND)                 | TST R0, #0x08                 | Flags from Rn AND Op2                                        |
| TEQ Rn, Op2       | Test equivalence (XOR)          | TEQ R0, R1                    | Flags from Rn XOR Op2                                        |
| LSL Rd, Rn, Op2   | Logical shift left              | LSL R0, R1, #2                | Shift left, fill with 0                                      |
| LSR Rd, Rn, Op2   | Logical shift right             | LSR R0, R1, #2                | Shift right, fill with 0                                     |
| ASR Rd, Rn, Op2   | Arithmetic shift right          | ASR R0, R1, #2                | Shift right, fill with sign bit                              |
| ROR Rd, Rn, Op2   | Rotate right                    | ROR R0, R1, #1                | Bits wrap around right                                       |
| RRX Rd, Rm        | Rotate right w/ extend          | RRX R0, R1                    | Rotate through carry                                         |
| CMP Rn, Op2       | Compare (subtract)              | CMP R0, #10                   | Flags from Rn - Op2                                          |
| CMN Rn, Op2       | Compare negative                | CMN R0, #5                    | Flags from Rn + Op2                                          |
| B label           | Branch                          | B loop                        | Unconditional jump                                           |
| BL label          | Branch w/ link                  | BL func                       | Calls function, LR = return addr                            |
| BX Rm             | Branch indirect                 | BX LR                         | Jump to address in Rm                                        |
| BEQ label         | Branch if equal                 | BEQ done                      | Z = 1                                                        |
| BNE label         | Branch if not equal             | BNE loop                      | Z = 0                                                        |
| BCS label         | Branch if carry set             | BCS carry_case                | C = 1                                                        |
| BCC label         | Branch if carry clear           | BCC no_carry                  | C = 0                                                        |
| BMI label         | Branch if negative              | BMI neg_case                  | N = 1                                                        |
| BPL label         | Branch if positive              | BPL pos_case                  | N = 0                                                        |
| BVS label         | Branch if overflow set          | BVS ovf_case                  | V = 1                                                        |
| BVC label         | Branch if overflow clear        | BVC no_ovf                    | V = 0                                                        |
| BLO label         | Branch if lower (unsigned)      | BLO lower_case                | C = 0 & Z = 0                                                 |
| BHS label         | Branch if higher/same (unsigned)| BHS ok_case                   | C = 1 or Z = 1                                                |
| BGE label         | Branch if ≥ (signed)            | BGE greater_eq                | V = N or Z = 1                                                |
| BLT label         | Branch if < (signed)            | BLT less_case                 | V ≠ N & Z = 0                                                 |
| BGT label         | Branch if > (signed)            | BGT greater_case              | V = N & Z = 0                                                 |
| BLE label         | Branch if ≤ (signed)            | BLE less_eq                   | V ≠ N or Z = 1                                                |
