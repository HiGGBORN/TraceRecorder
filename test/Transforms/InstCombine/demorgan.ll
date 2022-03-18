; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instcombine -S | FileCheck %s

; (~A | ~B) == ~(A & B)

define i43 @demorgan_or_apint1(i43 %A, i43 %B) {
; CHECK-LABEL: @demorgan_or_apint1(
; CHECK-NEXT:    [[C_DEMORGAN:%.*]] = and i43 [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    [[C:%.*]] = xor i43 [[C_DEMORGAN]], -1
; CHECK-NEXT:    ret i43 [[C]]
;
  %NotA = xor i43 %A, -1
  %NotB = xor i43 %B, -1
  %C = or i43 %NotA, %NotB
  ret i43 %C
}

; (~A | ~B) == ~(A & B)

define i129 @demorgan_or_apint2(i129 %A, i129 %B) {
; CHECK-LABEL: @demorgan_or_apint2(
; CHECK-NEXT:    [[C_DEMORGAN:%.*]] = and i129 [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    [[C:%.*]] = xor i129 [[C_DEMORGAN]], -1
; CHECK-NEXT:    ret i129 [[C]]
;
  %NotA = xor i129 %A, -1
  %NotB = xor i129 %B, -1
  %C = or i129 %NotA, %NotB
  ret i129 %C
}

; (~A & ~B) == ~(A | B)

define i477 @demorgan_and_apint1(i477 %A, i477 %B) {
; CHECK-LABEL: @demorgan_and_apint1(
; CHECK-NEXT:    [[C_DEMORGAN:%.*]] = or i477 [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    [[C:%.*]] = xor i477 [[C_DEMORGAN]], -1
; CHECK-NEXT:    ret i477 [[C]]
;
  %NotA = xor i477 %A, -1
  %NotB = xor i477 %B, -1
  %C = and i477 %NotA, %NotB
  ret i477 %C
}

; (~A & ~B) == ~(A | B)

define i129 @demorgan_and_apint2(i129 %A, i129 %B) {
; CHECK-LABEL: @demorgan_and_apint2(
; CHECK-NEXT:    [[C_DEMORGAN:%.*]] = or i129 [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    [[C:%.*]] = xor i129 [[C_DEMORGAN]], -1
; CHECK-NEXT:    ret i129 [[C]]
;
  %NotA = xor i129 %A, -1
  %NotB = xor i129 %B, -1
  %C = and i129 %NotA, %NotB
  ret i129 %C
}

; (~A & ~B) == ~(A | B)

define i65 @demorgan_and_apint3(i65 %A, i65 %B) {
; CHECK-LABEL: @demorgan_and_apint3(
; CHECK-NEXT:    [[C_DEMORGAN:%.*]] = or i65 [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    [[C:%.*]] = xor i65 [[C_DEMORGAN]], -1
; CHECK-NEXT:    ret i65 [[C]]
;
  %NotA = xor i65 %A, -1
  %NotB = xor i65 -1, %B
  %C = and i65 %NotA, %NotB
  ret i65 %C
}

; (~A & ~B) == ~(A | B)

define i66 @demorgan_and_apint4(i66 %A, i66 %B) {
; CHECK-LABEL: @demorgan_and_apint4(
; CHECK-NEXT:    [[C_DEMORGAN:%.*]] = or i66 [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    [[C:%.*]] = xor i66 [[C_DEMORGAN]], -1
; CHECK-NEXT:    ret i66 [[C]]
;
  %NotA = xor i66 %A, -1
  %NotB = xor i66 %B, -1
  %C = and i66 %NotA, %NotB
  ret i66 %C
}

; (~A & ~B) == ~(A | B)

define i47 @demorgan_and_apint5(i47 %A, i47 %B) {
; CHECK-LABEL: @demorgan_and_apint5(
; CHECK-NEXT:    [[C_DEMORGAN:%.*]] = or i47 [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    [[C:%.*]] = xor i47 [[C_DEMORGAN]], -1
; CHECK-NEXT:    ret i47 [[C]]
;
  %NotA = xor i47 %A, -1
  %NotB = xor i47 %B, -1
  %C = and i47 %NotA, %NotB
  ret i47 %C
}

; This is confirming that 2 transforms work together:
; ~(~A & ~B) --> A | B

define i32 @test3(i32 %A, i32 %B) {
; CHECK-LABEL: @test3(
; CHECK-NEXT:    [[C_DEMORGAN:%.*]] = or i32 [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    ret i32 [[C_DEMORGAN]]
;
  %nota = xor i32 %A, -1
  %notb = xor i32 %B, -1
  %c = and i32 %nota, %notb
  %notc = xor i32 %c, -1
  ret i32 %notc
}

; Invert a constant if needed:
; ~(~A & 5) --> A | ~5

define i32 @test4(i32 %A) {
; CHECK-LABEL: @test4(
; CHECK-NEXT:    [[NOTC1:%.*]] = or i32 [[A:%.*]], -6
; CHECK-NEXT:    ret i32 [[NOTC1]]
;
  %nota = xor i32 %A, -1
  %c = and i32 %nota, 5
  %notc = xor i32 %c, -1
  ret i32 %notc
}

; Test the mirror of DeMorgan's law with an extra 'not'.
; ~(~A | ~B) --> A & B

define i32 @test5(i32 %A, i32 %B) {
; CHECK-LABEL: @test5(
; CHECK-NEXT:    [[C_DEMORGAN:%.*]] = and i32 [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    ret i32 [[C_DEMORGAN]]
;
  %nota = xor i32 %A, -1
  %notb = xor i32 %B, -1
  %c = or i32 %nota, %notb
  %notc = xor i32 %c, -1
  ret i32 %notc
}

; Repeat with weird types for extra coverage.
; ~(~A & ~B) --> A | B

define i47 @test3_apint(i47 %A, i47 %B) {
; CHECK-LABEL: @test3_apint(
; CHECK-NEXT:    [[C_DEMORGAN:%.*]] = or i47 [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    ret i47 [[C_DEMORGAN]]
;
  %nota = xor i47 %A, -1
  %notb = xor i47 %B, -1
  %c = and i47 %nota, %notb
  %notc = xor i47 %c, -1
  ret i47 %notc
}

; ~(~A & 5) --> A | ~5

define i61 @test4_apint(i61 %A) {
; CHECK-LABEL: @test4_apint(
; CHECK-NEXT:    [[NOTA:%.*]] = and i61 [[A:%.*]], 5
; CHECK-NEXT:    [[C:%.*]] = xor i61 [[NOTA]], 5
; CHECK-NEXT:    ret i61 [[C]]
;
  %nota = xor i61 %A, -1
  %c = and i61 %nota, 5    ; 5 = ~c2
  %notc = xor i61 %c, -1
  ret i61 %c
}

; ~(~A | ~B) --> A & B

define i71 @test5_apint(i71 %A, i71 %B) {
; CHECK-LABEL: @test5_apint(
; CHECK-NEXT:    [[C_DEMORGAN:%.*]] = and i71 [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    ret i71 [[C_DEMORGAN]]
;
  %nota = xor i71 %A, -1
  %notb = xor i71 %B, -1
  %c = or i71 %nota, %notb
  %notc = xor i71 %c, -1
  ret i71 %notc
}

; ~(~A & B) --> (A | ~B)

define i8 @demorgan_nand(i8 %A, i8 %B) {
; CHECK-LABEL: @demorgan_nand(
; CHECK-NEXT:    [[B_NOT:%.*]] = xor i8 [[B:%.*]], -1
; CHECK-NEXT:    [[NOTC:%.*]] = or i8 [[B_NOT]], [[A:%.*]]
; CHECK-NEXT:    ret i8 [[NOTC]]
;
  %notx = xor i8 %A, -1
  %c = and i8 %notx, %B
  %notc = xor i8 %c, -1
  ret i8 %notc
}

; ~(~A & B) --> (A | ~B)

define i7 @demorgan_nand_apint1(i7 %A, i7 %B) {
; CHECK-LABEL: @demorgan_nand_apint1(
; CHECK-NEXT:    [[B_NOT:%.*]] = xor i7 [[B:%.*]], -1
; CHECK-NEXT:    [[NOTC:%.*]] = or i7 [[B_NOT]], [[A:%.*]]
; CHECK-NEXT:    ret i7 [[NOTC]]
;
  %nota = xor i7 %A, -1
  %c = and i7 %nota, %B
  %notc = xor i7 %c, -1
  ret i7 %notc
}

; ~(~A & B) --> (A | ~B)

define i117 @demorgan_nand_apint2(i117 %A, i117 %B) {
; CHECK-LABEL: @demorgan_nand_apint2(
; CHECK-NEXT:    [[B_NOT:%.*]] = xor i117 [[B:%.*]], -1
; CHECK-NEXT:    [[NOTC:%.*]] = or i117 [[B_NOT]], [[A:%.*]]
; CHECK-NEXT:    ret i117 [[NOTC]]
;
  %nota = xor i117 %A, -1
  %c = and i117 %nota, %B
  %notc = xor i117 %c, -1
  ret i117 %notc
}

; ~(~A | B) --> (A & ~B)

define i8 @demorgan_nor(i8 %A, i8 %B) {
; CHECK-LABEL: @demorgan_nor(
; CHECK-NEXT:    [[B_NOT:%.*]] = xor i8 [[B:%.*]], -1
; CHECK-NEXT:    [[NOTC:%.*]] = and i8 [[B_NOT]], [[A:%.*]]
; CHECK-NEXT:    ret i8 [[NOTC]]
;
  %notx = xor i8 %A, -1
  %c = or i8 %notx, %B
  %notc = xor i8 %c, -1
  ret i8 %notc
}

; ~(~A | B) --> (A & ~B) - what if we use one of the intermediate results?

define i8 @demorgan_nor_use2a(i8 %A, i8 %B) {
; CHECK-LABEL: @demorgan_nor_use2a(
; CHECK-NEXT:    [[NOTA:%.*]] = xor i8 [[A:%.*]], -1
; CHECK-NEXT:    [[USE2A:%.*]] = mul i8 [[NOTA]], 23
; CHECK-NEXT:    [[B_NOT:%.*]] = xor i8 [[B:%.*]], -1
; CHECK-NEXT:    [[NOTC:%.*]] = and i8 [[B_NOT]], [[A]]
; CHECK-NEXT:    [[R:%.*]] = sdiv i8 [[NOTC]], [[USE2A]]
; CHECK-NEXT:    ret i8 [[R]]
;
  %nota = xor i8 %A, -1
  %use2a = mul i8 %nota, 23
  %c = or i8 %nota, %B
  %notc = xor i8 %c, -1
  %r = sdiv i8 %notc, %use2a
  ret i8 %r
}

; ~(~A | B) --> (A & ~B) - what if we use one of the intermediate results?

define i8 @demorgan_nor_use2b(i8 %A, i8 %B) {
; CHECK-LABEL: @demorgan_nor_use2b(
; CHECK-NEXT:    [[USE2B:%.*]] = mul i8 [[B:%.*]], 23
; CHECK-NEXT:    [[B_NOT:%.*]] = xor i8 [[B]], -1
; CHECK-NEXT:    [[NOTC:%.*]] = and i8 [[B_NOT]], [[A:%.*]]
; CHECK-NEXT:    [[R:%.*]] = sdiv i8 [[NOTC]], [[USE2B]]
; CHECK-NEXT:    ret i8 [[R]]
;
  %use2b = mul i8 %B, 23
  %nota = xor i8 %A, -1
  %c = or i8 %nota, %B
  %notc = xor i8 %c, -1
  %r = sdiv i8 %notc, %use2b
  ret i8 %r
}

; ~(~A | B) --> (A & ~B) - what if we use one of the intermediate results?

define i8 @demorgan_nor_use2c(i8 %A, i8 %B) {
; CHECK-LABEL: @demorgan_nor_use2c(
; CHECK-NEXT:    [[NOTA:%.*]] = xor i8 [[A:%.*]], -1
; CHECK-NEXT:    [[C:%.*]] = or i8 [[NOTA]], [[B:%.*]]
; CHECK-NEXT:    [[USE2C:%.*]] = mul i8 [[C]], 23
; CHECK-NEXT:    [[NOTC:%.*]] = xor i8 [[C]], -1
; CHECK-NEXT:    [[R:%.*]] = sdiv i8 [[NOTC]], [[USE2C]]
; CHECK-NEXT:    ret i8 [[R]]
;
  %nota = xor i8 %A, -1
  %c = or i8 %nota, %B
  %use2c = mul i8 %c, 23
  %notc = xor i8 %c, -1
  %r = sdiv i8 %notc, %use2c
  ret i8 %r
}

; ~(~A | B) --> (A & ~B) - what if we use two of the intermediate results?

define i8 @demorgan_nor_use2ab(i8 %A, i8 %B) {
; CHECK-LABEL: @demorgan_nor_use2ab(
; CHECK-NEXT:    [[USE2B:%.*]] = mul i8 [[B:%.*]], 23
; CHECK-NEXT:    [[NOTA:%.*]] = xor i8 [[A:%.*]], -1
; CHECK-NEXT:    [[USE2A:%.*]] = mul i8 [[NOTA]], 17
; CHECK-NEXT:    [[B_NOT:%.*]] = xor i8 [[B]], -1
; CHECK-NEXT:    [[NOTC:%.*]] = and i8 [[B_NOT]], [[A]]
; CHECK-NEXT:    [[R1:%.*]] = sdiv i8 [[NOTC]], [[USE2B]]
; CHECK-NEXT:    [[R2:%.*]] = sdiv i8 [[R1]], [[USE2A]]
; CHECK-NEXT:    ret i8 [[R2]]
;
  %use2b = mul i8 %B, 23
  %nota = xor i8 %A, -1
  %use2a = mul i8 %nota, 17
  %c = or i8 %nota, %B
  %notc = xor i8 %c, -1
  %r1 = sdiv i8 %notc, %use2b
  %r2 = sdiv i8 %r1, %use2a
  ret i8 %r2
}

; ~(~A | B) --> (A & ~B) - what if we use two of the intermediate results?

define i8 @demorgan_nor_use2ac(i8 %A, i8 %B) {
; CHECK-LABEL: @demorgan_nor_use2ac(
; CHECK-NEXT:    [[NOTA:%.*]] = xor i8 [[A:%.*]], -1
; CHECK-NEXT:    [[USE2A:%.*]] = mul i8 [[NOTA]], 17
; CHECK-NEXT:    [[C:%.*]] = or i8 [[NOTA]], [[B:%.*]]
; CHECK-NEXT:    [[USE2C:%.*]] = mul i8 [[C]], 23
; CHECK-NEXT:    [[NOTC:%.*]] = xor i8 [[C]], -1
; CHECK-NEXT:    [[R1:%.*]] = sdiv i8 [[NOTC]], [[USE2C]]
; CHECK-NEXT:    [[R2:%.*]] = sdiv i8 [[R1]], [[USE2A]]
; CHECK-NEXT:    ret i8 [[R2]]
;
  %nota = xor i8 %A, -1
  %use2a = mul i8 %nota, 17
  %c = or i8 %nota, %B
  %use2c = mul i8 %c, 23
  %notc = xor i8 %c, -1
  %r1 = sdiv i8 %notc, %use2c
  %r2 = sdiv i8 %r1, %use2a
  ret i8 %r2
}

; ~(~A | B) --> (A & ~B) - what if we use two of the intermediate results?

define i8 @demorgan_nor_use2bc(i8 %A, i8 %B) {
; CHECK-LABEL: @demorgan_nor_use2bc(
; CHECK-NEXT:    [[USE2B:%.*]] = mul i8 [[B:%.*]], 23
; CHECK-NEXT:    [[NOTA:%.*]] = xor i8 [[A:%.*]], -1
; CHECK-NEXT:    [[C:%.*]] = or i8 [[NOTA]], [[B]]
; CHECK-NEXT:    [[USE2C:%.*]] = mul i8 [[C]], 23
; CHECK-NEXT:    [[NOTC:%.*]] = xor i8 [[C]], -1
; CHECK-NEXT:    [[R1:%.*]] = sdiv i8 [[NOTC]], [[USE2C]]
; CHECK-NEXT:    [[R2:%.*]] = sdiv i8 [[R1]], [[USE2B]]
; CHECK-NEXT:    ret i8 [[R2]]
;
  %use2b = mul i8 %B, 23
  %nota = xor i8 %A, -1
  %c = or i8 %nota, %B
  %use2c = mul i8 %c, 23
  %notc = xor i8 %c, -1
  %r1 = sdiv i8 %notc, %use2c
  %r2 = sdiv i8 %r1, %use2b
  ret i8 %r2
}

; Do not apply DeMorgan's Law to constants. We prefer 'not' ops.

define i32 @demorganize_constant1(i32 %a) {
; CHECK-LABEL: @demorganize_constant1(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[A:%.*]], 15
; CHECK-NEXT:    [[AND1:%.*]] = xor i32 [[AND]], -1
; CHECK-NEXT:    ret i32 [[AND1]]
;
  %and = and i32 %a, 15
  %and1 = xor i32 %and, -1
  ret i32 %and1
}

; Do not apply DeMorgan's Law to constants. We prefer 'not' ops.

define i32 @demorganize_constant2(i32 %a) {
; CHECK-LABEL: @demorganize_constant2(
; CHECK-NEXT:    [[AND:%.*]] = or i32 [[A:%.*]], 15
; CHECK-NEXT:    [[AND1:%.*]] = xor i32 [[AND]], -1
; CHECK-NEXT:    ret i32 [[AND1]]
;
  %and = or i32 %a, 15
  %and1 = xor i32 %and, -1
  ret i32 %and1
}

; PR22723: Recognize DeMorgan's Laws when obfuscated by zexts.

define i32 @demorgan_or_zext(i1 %X, i1 %Y) {
; CHECK-LABEL: @demorgan_or_zext(
; CHECK-NEXT:    [[OR1_DEMORGAN:%.*]] = and i1 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[OR1:%.*]] = xor i1 [[OR1_DEMORGAN]], true
; CHECK-NEXT:    [[OR:%.*]] = zext i1 [[OR1]] to i32
; CHECK-NEXT:    ret i32 [[OR]]
;
  %zextX = zext i1 %X to i32
  %zextY = zext i1 %Y to i32
  %notX  = xor i32 %zextX, 1
  %notY  = xor i32 %zextY, 1
  %or    = or i32 %notX, %notY
  ret i32 %or
}

define i32 @demorgan_and_zext(i1 %X, i1 %Y) {
; CHECK-LABEL: @demorgan_and_zext(
; CHECK-NEXT:    [[AND1_DEMORGAN:%.*]] = or i1 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[AND1:%.*]] = xor i1 [[AND1_DEMORGAN]], true
; CHECK-NEXT:    [[AND:%.*]] = zext i1 [[AND1]] to i32
; CHECK-NEXT:    ret i32 [[AND]]
;
  %zextX = zext i1 %X to i32
  %zextY = zext i1 %Y to i32
  %notX  = xor i32 %zextX, 1
  %notY  = xor i32 %zextY, 1
  %and   = and i32 %notX, %notY
  ret i32 %and
}

define <2 x i32> @demorgan_or_zext_vec(<2 x i1> %X, <2 x i1> %Y) {
; CHECK-LABEL: @demorgan_or_zext_vec(
; CHECK-NEXT:    [[OR1_DEMORGAN:%.*]] = and <2 x i1> [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[OR1:%.*]] = xor <2 x i1> [[OR1_DEMORGAN]], <i1 true, i1 true>
; CHECK-NEXT:    [[OR:%.*]] = zext <2 x i1> [[OR1]] to <2 x i32>
; CHECK-NEXT:    ret <2 x i32> [[OR]]
;
  %zextX = zext <2 x i1> %X to <2 x i32>
  %zextY = zext <2 x i1> %Y to <2 x i32>
  %notX  = xor <2 x i32> %zextX, <i32 1, i32 1>
  %notY  = xor <2 x i32> %zextY, <i32 1, i32 1>
  %or    = or <2 x i32> %notX, %notY
  ret <2 x i32> %or
}

define <2 x i32> @demorgan_and_zext_vec(<2 x i1> %X, <2 x i1> %Y) {
; CHECK-LABEL: @demorgan_and_zext_vec(
; CHECK-NEXT:    [[AND1_DEMORGAN:%.*]] = or <2 x i1> [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[AND1:%.*]] = xor <2 x i1> [[AND1_DEMORGAN]], <i1 true, i1 true>
; CHECK-NEXT:    [[AND:%.*]] = zext <2 x i1> [[AND1]] to <2 x i32>
; CHECK-NEXT:    ret <2 x i32> [[AND]]
;
  %zextX = zext <2 x i1> %X to <2 x i32>
  %zextY = zext <2 x i1> %Y to <2 x i32>
  %notX  = xor <2 x i32> %zextX, <i32 1, i32 1>
  %notY  = xor <2 x i32> %zextY, <i32 1, i32 1>
  %and   = and <2 x i32> %notX, %notY
  ret <2 x i32> %and
}

define i32 @PR28476(i32 %x, i32 %y) {
; CHECK-LABEL: @PR28476(
; CHECK-NEXT:    [[CMP0:%.*]] = icmp eq i32 [[X:%.*]], 0
; CHECK-NEXT:    [[CMP1:%.*]] = icmp eq i32 [[Y:%.*]], 0
; CHECK-NEXT:    [[TMP1:%.*]] = or i1 [[CMP0]], [[CMP1]]
; CHECK-NEXT:    [[COND:%.*]] = zext i1 [[TMP1]] to i32
; CHECK-NEXT:    ret i32 [[COND]]
;
  %cmp0 = icmp ne i32 %x, 0
  %cmp1 = icmp ne i32 %y, 0
  %and = and i1 %cmp0, %cmp1
  %zext = zext i1 %and to i32
  %cond = xor i32 %zext, 1
  ret i32 %cond
}

define i32 @PR28476_logical(i32 %x, i32 %y) {
; CHECK-LABEL: @PR28476_logical(
; CHECK-NEXT:    [[CMP0:%.*]] = icmp eq i32 [[X:%.*]], 0
; CHECK-NEXT:    [[CMP1:%.*]] = icmp eq i32 [[Y:%.*]], 0
; CHECK-NEXT:    [[TMP1:%.*]] = or i1 [[CMP0]], [[CMP1]]
; CHECK-NEXT:    [[COND:%.*]] = zext i1 [[TMP1]] to i32
; CHECK-NEXT:    ret i32 [[COND]]
;
  %cmp0 = icmp ne i32 %x, 0
  %cmp1 = icmp ne i32 %y, 0
  %and = select i1 %cmp0, i1 %cmp1, i1 false
  %zext = zext i1 %and to i32
  %cond = xor i32 %zext, 1
  ret i32 %cond
}

; ~(~(a | b) | (a & b)) --> (a | b) & ~(a & b) -> a ^ b

define i32 @demorgan_plus_and_to_xor(i32 %a, i32 %b) {
; CHECK-LABEL: @demorgan_plus_and_to_xor(
; CHECK-NEXT:    [[TMP1:%.*]] = xor i32 [[B:%.*]], [[A:%.*]]
; CHECK-NEXT:    ret i32 [[TMP1]]
;
  %or = or i32 %b, %a
  %notor = xor i32 %or, -1
  %and = and i32 %b, %a
  %or2 = or i32 %and, %notor
  %not = xor i32 %or2, -1
  ret i32 %not
}

define <4 x i32> @demorgan_plus_and_to_xor_vec(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: @demorgan_plus_and_to_xor_vec(
; CHECK-NEXT:    [[TMP1:%.*]] = xor <4 x i32> [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    ret <4 x i32> [[TMP1]]
;
  %or = or <4 x i32> %a, %b
  %notor = xor <4 x i32> %or, < i32 -1, i32 -1, i32 -1, i32 -1 >
  %and = and <4 x i32> %a, %b
  %or2 = or <4 x i32> %and, %notor
  %not = xor <4 x i32> %or2, < i32 -1, i32 -1, i32 -1, i32 -1 >
  ret <4 x i32> %not
}

