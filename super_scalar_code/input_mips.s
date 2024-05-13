.LC0:
        .ascii  "Sum of all elements: %d\012\000"
.LC1:
        .ascii  "Sum of all modified elements: %d\012\000"
.LC2:
        .ascii  "Factorial of %d: %d\012\000"
.LFB0 = .
main:
        daddiu  $sp,$sp,-448
        sd      $31,440($sp)
        sd      $fp,432($sp)
        sd      $28,424($sp)
        move    $fp,$sp
        lui     $28,%hi(%neg(%gp_rel(main)))
        daddu   $28,$28,$25
        daddiu  $28,$28,%lo(%neg(%gp_rel(main)))
        sw      $0,0($fp)
        b       .L2
        nop

.L3:
        lw      $2,0($fp)
        addiu   $2,$2,1
        move    $3,$2
        lw      $2,0($fp)
        dsll    $2,$2,2
        daddu   $2,$fp,$2
        sw      $3,16($2)
        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
.L2:
        lw      $2,0($fp)
        slt     $2,$2,100
        bne     $2,$0,.L3
        nop

        sw      $0,8($fp)
        sw      $0,0($fp)
        b       .L4
        nop

.L5:
        lw      $2,0($fp)
        dsll    $2,$2,2
        daddu   $2,$fp,$2
        lw      $2,16($2)
        lw      $3,8($fp)
        addu    $2,$3,$2
        sw      $2,8($fp)
        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
.L4:
        lw      $2,0($fp)
        slt     $2,$2,100
        bne     $2,$0,.L5
        nop

        lw      $2,8($fp)
        move    $5,$2
        ld      $2,%got_page(.LC0)($28)
        daddiu  $4,$2,%got_ofst(.LC0)
        ld      $2,%call16(printf)($28)
        mtlo    $2
        mflo    $25
        jalr    $25
        nop

.LVL0 = .
        sw      $0,0($fp)
        b       .L6
        nop

.L7:
        lw      $2,0($fp)
        dsll    $2,$2,2
        daddu   $2,$fp,$2
        lw      $2,16($2)
        sll     $2,$2,1
        move    $3,$2
        lw      $2,0($fp)
        dsll    $2,$2,2
        daddu   $2,$fp,$2
        sw      $3,16($2)
        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
.L6:
        lw      $2,0($fp)
        slt     $2,$2,100
        bne     $2,$0,.L7
        nop

        sw      $0,8($fp)
        sw      $0,0($fp)
        b       .L8
        nop

.L9:
        lw      $2,0($fp)
        dsll    $2,$2,2
        daddu   $2,$fp,$2
        lw      $2,16($2)
        lw      $3,8($fp)
        addu    $2,$3,$2
        sw      $2,8($fp)
        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
.L8:
        lw      $2,0($fp)
        slt     $2,$2,100
        bne     $2,$0,.L9
        nop

        lw      $2,8($fp)
        move    $5,$2
        ld      $2,%got_page(.LC1)($28)
        daddiu  $4,$2,%got_ofst(.LC1)
        ld      $2,%call16(printf)($28)
        mtlo    $2
        mflo    $25
        jalr    $25
        nop

.LVL1 = .
.LBB2 = .
        sw      $0,0($fp)
        b       .L10
        nop

.L13:
.LBB3 = .
        li      $2,1                        # 0x1
        sw      $2,12($fp)
        li      $2,1                        # 0x1
        sw      $2,4($fp)
        b       .L11
        nop

.L12:
        lw      $3,12($fp)
        lw      $2,4($fp)
        mult    $3,$2
        mflo    $2
        sw      $2,12($fp)
        lw      $2,4($fp)
        addiu   $2,$2,1
        sw      $2,4($fp)
.L11:
        lw      $2,0($fp)
        dsll    $2,$2,2
        daddu   $2,$fp,$2
        lw      $2,16($2)
        lw      $3,4($fp)
        slt     $2,$2,$3
        beq     $2,$0,.L12
        nop

        lw      $2,0($fp)
        dsll    $2,$2,2
        daddu   $2,$fp,$2
        lw      $2,16($2)
        lw      $3,12($fp)
        move    $6,$3
        move    $5,$2
        ld      $2,%got_page(.LC2)($28)
        daddiu  $4,$2,%got_ofst(.LC2)
        ld      $2,%call16(printf)($28)
        mtlo    $2
        mflo    $25
        jalr    $25
        nop

.LVL2 = .
.LBE3 = .
        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
.L10:
        lw      $2,0($fp)
        slt     $2,$2,100
        bne     $2,$0,.L13
        nop

.LBE2 = .
        move    $2,$0
        move    $sp,$fp
        ld      $31,440($sp)
        ld      $fp,432($sp)
        ld      $28,424($sp)
        daddiu  $sp,$sp,448
        jr      $31
        nop