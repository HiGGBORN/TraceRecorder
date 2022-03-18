# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=skylake-avx512 -instruction-tables < %s | FileCheck %s

addps       %xmm0, %xmm2
addps       (%rax), %xmm2

addss       %xmm0, %xmm2
addss       (%rax), %xmm2

andnps      %xmm0, %xmm2
andnps      (%rax), %xmm2

andps       %xmm0, %xmm2
andps       (%rax), %xmm2

cmpps       $0, %xmm0, %xmm2
cmpps       $0, (%rax), %xmm2

cmpss       $0, %xmm0, %xmm2
cmpss       $0, (%rax), %xmm2

comiss      %xmm0, %xmm1
comiss      (%rax), %xmm1

cvtpi2ps    %mm0, %xmm2
cvtpi2ps    (%rax), %xmm2

cvtps2pi    %xmm0, %mm2
cvtps2pi    (%rax), %mm2

cvtsi2ss    %ecx, %xmm2
cvtsi2ss    %rcx, %xmm2
cvtsi2ss    (%rax), %xmm2
cvtsi2ss    (%rax), %xmm2

cvtss2si    %xmm0, %ecx
cvtss2si    %xmm0, %rcx
cvtss2si    (%rax), %ecx
cvtss2si    (%rax), %rcx

cvttps2pi   %xmm0, %mm2
cvttps2pi   (%rax), %mm2

cvttss2si   %xmm0, %ecx
cvttss2si   %xmm0, %rcx
cvttss2si   (%rax), %ecx
cvttss2si   (%rax), %rcx

divps       %xmm0, %xmm2
divps       (%rax), %xmm2

divss       %xmm0, %xmm2
divss       (%rax), %xmm2

ldmxcsr     (%rax)

maskmovq    %mm0, %mm1

maxps       %xmm0, %xmm2
maxps       (%rax), %xmm2

maxss       %xmm0, %xmm2
maxss       (%rax), %xmm2

minps       %xmm0, %xmm2
minps       (%rax), %xmm2

minss       %xmm0, %xmm2
minss       (%rax), %xmm2

movaps      %xmm0, %xmm2
movaps      %xmm0, (%rax)
movaps      (%rax), %xmm2

movhlps     %xmm0, %xmm2
movlhps     %xmm0, %xmm2

movhps      %xmm0, (%rax)
movhps      (%rax), %xmm2

movlps      %xmm0, (%rax)
movlps      (%rax), %xmm2

movmskps    %xmm0, %rcx

movntps     %xmm0, (%rax)
movntq      %mm0, (%rax)

movss       %xmm0, %xmm2
movss       %xmm0, (%rax)
movss       (%rax), %xmm2

movups      %xmm0, %xmm2
movups      %xmm0, (%rax)
movups      (%rax), %xmm2

mulps       %xmm0, %xmm2
mulps       (%rax), %xmm2

mulss       %xmm0, %xmm2
mulss       (%rax), %xmm2

orps        %xmm0, %xmm2
orps        (%rax), %xmm2

pavgb       %mm0, %mm2
pavgb       (%rax), %mm2

pavgw       %mm0, %mm2
pavgw       (%rax), %mm2

pextrw      $1, %mm0, %rcx

pinsrw      $1, %rax, %mm2
pinsrw      $1, (%rax), %mm2

pmaxsw      %mm0, %mm2
pmaxsw      (%rax), %mm2

pmaxub      %mm0, %mm2
pmaxub      (%rax), %mm2

pminsw      %mm0, %mm2
pminsw      (%rax), %mm2

pminub      %mm0, %mm2
pminub      (%rax), %mm2

pmovmskb    %mm0, %rcx

pmulhuw     %mm0, %mm2
pmulhuw     (%rax), %mm2

prefetcht0  (%rax)
prefetcht1  (%rax)
prefetcht2  (%rax)
prefetchnta (%rax)

psadbw      %mm0, %mm2
psadbw      (%rax), %mm2

pshufw      $1, %mm0, %mm2
pshufw      $1, (%rax), %mm2

rcpps       %xmm0, %xmm2
rcpps       (%rax), %xmm2

rcpss       %xmm0, %xmm2
rcpss       (%rax), %xmm2

rsqrtps     %xmm0, %xmm2
rsqrtps     (%rax), %xmm2

rsqrtss     %xmm0, %xmm2
rsqrtss     (%rax), %xmm2

sfence

shufps      $1, %xmm0, %xmm2
shufps      $1, (%rax), %xmm2

sqrtps      %xmm0, %xmm2
sqrtps      (%rax), %xmm2

sqrtss      %xmm0, %xmm2
sqrtss      (%rax), %xmm2

stmxcsr     (%rax)

subps       %xmm0, %xmm2
subps       (%rax), %xmm2

subss       %xmm0, %xmm2
subss       (%rax), %xmm2

ucomiss     %xmm0, %xmm1
ucomiss     (%rax), %xmm1

unpckhps    %xmm0, %xmm2
unpckhps    (%rax), %xmm2

unpcklps    %xmm0, %xmm2
unpcklps    (%rax), %xmm2

xorps       %xmm0, %xmm2
xorps       (%rax), %xmm2

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      4     0.50                        addps	%xmm0, %xmm2
# CHECK-NEXT:  2      10    0.50    *                   addps	(%rax), %xmm2
# CHECK-NEXT:  1      4     0.50                        addss	%xmm0, %xmm2
# CHECK-NEXT:  2      9     0.50    *                   addss	(%rax), %xmm2
# CHECK-NEXT:  1      1     0.33                        andnps	%xmm0, %xmm2
# CHECK-NEXT:  2      7     0.50    *                   andnps	(%rax), %xmm2
# CHECK-NEXT:  1      1     0.33                        andps	%xmm0, %xmm2
# CHECK-NEXT:  2      7     0.50    *                   andps	(%rax), %xmm2
# CHECK-NEXT:  1      4     0.50                        cmpeqps	%xmm0, %xmm2
# CHECK-NEXT:  2      10    0.50    *                   cmpeqps	(%rax), %xmm2
# CHECK-NEXT:  1      4     0.50                        cmpeqss	%xmm0, %xmm2
# CHECK-NEXT:  2      9     0.50    *                   cmpeqss	(%rax), %xmm2
# CHECK-NEXT:  1      2     1.00                        comiss	%xmm0, %xmm1
# CHECK-NEXT:  2      7     1.00    *                   comiss	(%rax), %xmm1
# CHECK-NEXT:  2      6     2.00                        cvtpi2ps	%mm0, %xmm2
# CHECK-NEXT:  2      9     1.00    *                   cvtpi2ps	(%rax), %xmm2
# CHECK-NEXT:  2      5     1.00                        cvtps2pi	%xmm0, %mm2
# CHECK-NEXT:  2      9     0.50    *                   cvtps2pi	(%rax), %mm2
# CHECK-NEXT:  2      5     1.00                        cvtsi2ss	%ecx, %xmm2
# CHECK-NEXT:  3      6     2.00                        cvtsi2ss	%rcx, %xmm2
# CHECK-NEXT:  2      9     1.00    *                   cvtsi2ssl	(%rax), %xmm2
# CHECK-NEXT:  2      9     1.00    *                   cvtsi2ssl	(%rax), %xmm2
# CHECK-NEXT:  2      6     1.00                        cvtss2si	%xmm0, %ecx
# CHECK-NEXT:  3      7     1.00                        cvtss2si	%xmm0, %rcx
# CHECK-NEXT:  3      11    1.00    *                   cvtss2si	(%rax), %ecx
# CHECK-NEXT:  3      11    1.00    *                   cvtss2si	(%rax), %rcx
# CHECK-NEXT:  2      5     1.00                        cvttps2pi	%xmm0, %mm2
# CHECK-NEXT:  2      9     0.50    *                   cvttps2pi	(%rax), %mm2
# CHECK-NEXT:  2      6     1.00                        cvttss2si	%xmm0, %ecx
# CHECK-NEXT:  3      7     1.00                        cvttss2si	%xmm0, %rcx
# CHECK-NEXT:  3      11    1.00    *                   cvttss2si	(%rax), %ecx
# CHECK-NEXT:  4      12    1.00    *                   cvttss2si	(%rax), %rcx
# CHECK-NEXT:  1      11    3.00                        divps	%xmm0, %xmm2
# CHECK-NEXT:  2      17    5.00    *                   divps	(%rax), %xmm2
# CHECK-NEXT:  1      11    3.00                        divss	%xmm0, %xmm2
# CHECK-NEXT:  2      16    3.00    *                   divss	(%rax), %xmm2
# CHECK-NEXT:  3      7     1.00    *      *      U     ldmxcsr	(%rax)
# CHECK-NEXT:  1      1     1.00    *      *      U     maskmovq	%mm0, %mm1
# CHECK-NEXT:  1      4     0.50                        maxps	%xmm0, %xmm2
# CHECK-NEXT:  2      10    0.50    *                   maxps	(%rax), %xmm2
# CHECK-NEXT:  1      4     0.50                        maxss	%xmm0, %xmm2
# CHECK-NEXT:  2      9     0.50    *                   maxss	(%rax), %xmm2
# CHECK-NEXT:  1      4     0.50                        minps	%xmm0, %xmm2
# CHECK-NEXT:  2      10    0.50    *                   minps	(%rax), %xmm2
# CHECK-NEXT:  1      4     0.50                        minss	%xmm0, %xmm2
# CHECK-NEXT:  2      9     0.50    *                   minss	(%rax), %xmm2
# CHECK-NEXT:  1      1     0.33                        movaps	%xmm0, %xmm2
# CHECK-NEXT:  2      1     1.00           *            movaps	%xmm0, (%rax)
# CHECK-NEXT:  1      6     0.50    *                   movaps	(%rax), %xmm2
# CHECK-NEXT:  1      1     1.00                        movhlps	%xmm0, %xmm2
# CHECK-NEXT:  1      1     1.00                        movlhps	%xmm0, %xmm2
# CHECK-NEXT:  2      1     1.00           *            movhps	%xmm0, (%rax)
# CHECK-NEXT:  2      6     1.00    *                   movhps	(%rax), %xmm2
# CHECK-NEXT:  2      1     1.00           *            movlps	%xmm0, (%rax)
# CHECK-NEXT:  2      6     1.00    *                   movlps	(%rax), %xmm2
# CHECK-NEXT:  1      2     1.00                        movmskps	%xmm0, %ecx
# CHECK-NEXT:  2      1     1.00           *            movntps	%xmm0, (%rax)
# CHECK-NEXT:  2      1     1.00    *      *      U     movntq	%mm0, (%rax)
# CHECK-NEXT:  1      1     1.00                        movss	%xmm0, %xmm2
# CHECK-NEXT:  2      1     1.00           *            movss	%xmm0, (%rax)
# CHECK-NEXT:  1      5     0.50    *                   movss	(%rax), %xmm2
# CHECK-NEXT:  1      1     0.33                        movups	%xmm0, %xmm2
# CHECK-NEXT:  2      1     1.00           *            movups	%xmm0, (%rax)
# CHECK-NEXT:  1      6     0.50    *                   movups	(%rax), %xmm2
# CHECK-NEXT:  1      4     0.50                        mulps	%xmm0, %xmm2
# CHECK-NEXT:  2      10    0.50    *                   mulps	(%rax), %xmm2
# CHECK-NEXT:  1      4     0.50                        mulss	%xmm0, %xmm2
# CHECK-NEXT:  2      9     0.50    *                   mulss	(%rax), %xmm2
# CHECK-NEXT:  1      1     0.33                        orps	%xmm0, %xmm2
# CHECK-NEXT:  2      7     0.50    *                   orps	(%rax), %xmm2
# CHECK-NEXT:  1      1     1.00                        pavgb	%mm0, %mm2
# CHECK-NEXT:  2      6     1.00    *                   pavgb	(%rax), %mm2
# CHECK-NEXT:  1      1     1.00                        pavgw	%mm0, %mm2
# CHECK-NEXT:  2      6     1.00    *                   pavgw	(%rax), %mm2
# CHECK-NEXT:  2      3     1.00                        pextrw	$1, %mm0, %ecx
# CHECK-NEXT:  2      2     2.00                        pinsrw	$1, %eax, %mm2
# CHECK-NEXT:  2      6     1.00    *                   pinsrw	$1, (%rax), %mm2
# CHECK-NEXT:  1      1     1.00                        pmaxsw	%mm0, %mm2
# CHECK-NEXT:  2      6     1.00    *                   pmaxsw	(%rax), %mm2
# CHECK-NEXT:  1      1     1.00                        pmaxub	%mm0, %mm2
# CHECK-NEXT:  2      6     1.00    *                   pmaxub	(%rax), %mm2
# CHECK-NEXT:  1      1     1.00                        pminsw	%mm0, %mm2
# CHECK-NEXT:  2      6     1.00    *                   pminsw	(%rax), %mm2
# CHECK-NEXT:  1      1     1.00                        pminub	%mm0, %mm2
# CHECK-NEXT:  2      6     1.00    *                   pminub	(%rax), %mm2
# CHECK-NEXT:  1      2     1.00                        pmovmskb	%mm0, %ecx
# CHECK-NEXT:  1      5     1.00                        pmulhuw	%mm0, %mm2
# CHECK-NEXT:  2      10    1.00    *                   pmulhuw	(%rax), %mm2
# CHECK-NEXT:  1      5     0.50    *      *            prefetcht0	(%rax)
# CHECK-NEXT:  1      5     0.50    *      *            prefetcht1	(%rax)
# CHECK-NEXT:  1      5     0.50    *      *            prefetcht2	(%rax)
# CHECK-NEXT:  1      5     0.50    *      *            prefetchnta	(%rax)
# CHECK-NEXT:  1      3     1.00                        psadbw	%mm0, %mm2
# CHECK-NEXT:  2      8     1.00    *                   psadbw	(%rax), %mm2
# CHECK-NEXT:  1      1     1.00                        pshufw	$1, %mm0, %mm2
# CHECK-NEXT:  2      6     1.00    *                   pshufw	$1, (%rax), %mm2
# CHECK-NEXT:  1      4     1.00                        rcpps	%xmm0, %xmm2
# CHECK-NEXT:  2      10    1.00    *                   rcpps	(%rax), %xmm2
# CHECK-NEXT:  1      4     1.00                        rcpss	%xmm0, %xmm2
# CHECK-NEXT:  2      9     1.00    *                   rcpss	(%rax), %xmm2
# CHECK-NEXT:  1      4     1.00                        rsqrtps	%xmm0, %xmm2
# CHECK-NEXT:  2      10    1.00    *                   rsqrtps	(%rax), %xmm2
# CHECK-NEXT:  1      4     1.00                        rsqrtss	%xmm0, %xmm2
# CHECK-NEXT:  2      9     1.00    *                   rsqrtss	(%rax), %xmm2
# CHECK-NEXT:  2      2     0.33    *      *      U     sfence
# CHECK-NEXT:  1      1     1.00                        shufps	$1, %xmm0, %xmm2
# CHECK-NEXT:  2      7     1.00    *                   shufps	$1, (%rax), %xmm2
# CHECK-NEXT:  1      12    3.00                        sqrtps	%xmm0, %xmm2
# CHECK-NEXT:  2      18    3.00    *                   sqrtps	(%rax), %xmm2
# CHECK-NEXT:  1      12    3.00                        sqrtss	%xmm0, %xmm2
# CHECK-NEXT:  2      17    3.00    *                   sqrtss	(%rax), %xmm2
# CHECK-NEXT:  3      2     1.00           *      U     stmxcsr	(%rax)
# CHECK-NEXT:  1      4     0.50                        subps	%xmm0, %xmm2
# CHECK-NEXT:  2      10    0.50    *                   subps	(%rax), %xmm2
# CHECK-NEXT:  1      4     0.50                        subss	%xmm0, %xmm2
# CHECK-NEXT:  2      9     0.50    *                   subss	(%rax), %xmm2
# CHECK-NEXT:  1      2     1.00                        ucomiss	%xmm0, %xmm1
# CHECK-NEXT:  2      7     1.00    *                   ucomiss	(%rax), %xmm1
# CHECK-NEXT:  1      1     1.00                        unpckhps	%xmm0, %xmm2
# CHECK-NEXT:  2      7     1.00    *                   unpckhps	(%rax), %xmm2
# CHECK-NEXT:  1      1     1.00                        unpcklps	%xmm0, %xmm2
# CHECK-NEXT:  2      7     1.00    *                   unpcklps	(%rax), %xmm2
# CHECK-NEXT:  1      1     0.33                        xorps	%xmm0, %xmm2
# CHECK-NEXT:  2      7     0.50    *                   xorps	(%rax), %xmm2

# CHECK:      Resources:
# CHECK-NEXT: [0]   - SKXDivider
# CHECK-NEXT: [1]   - SKXFPDivider
# CHECK-NEXT: [2]   - SKXPort0
# CHECK-NEXT: [3]   - SKXPort1
# CHECK-NEXT: [4]   - SKXPort2
# CHECK-NEXT: [5]   - SKXPort3
# CHECK-NEXT: [6]   - SKXPort4
# CHECK-NEXT: [7]   - SKXPort5
# CHECK-NEXT: [8]   - SKXPort6
# CHECK-NEXT: [9]   - SKXPort7

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]
# CHECK-NEXT:  -     26.00  65.83  25.83  32.00  32.00  8.00   37.83  0.50   3.00

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    Instructions:
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -     addps	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -     addps	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -     addss	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -     addss	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.33   0.33    -      -      -     0.33    -      -     andnps	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.33   0.33   0.50   0.50    -     0.33    -      -     andnps	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.33   0.33    -      -      -     0.33    -      -     andps	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.33   0.33   0.50   0.50    -     0.33    -      -     andps	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -     cmpeqps	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -     cmpeqps	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -     cmpeqss	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -     cmpeqss	(%rax), %xmm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -     comiss	%xmm0, %xmm1
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -     comiss	(%rax), %xmm1
# CHECK-NEXT:  -      -      -      -      -      -      -     2.00    -      -     cvtpi2ps	%mm0, %xmm2
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -     cvtpi2ps	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.33   0.33    -      -      -     1.33    -      -     cvtps2pi	%xmm0, %mm2
# CHECK-NEXT:  -      -     0.33   0.33   0.50   0.50    -     0.33    -      -     cvtps2pi	(%rax), %mm2
# CHECK-NEXT:  -      -     0.33   0.33    -      -      -     1.33    -      -     cvtsi2ss	%ecx, %xmm2
# CHECK-NEXT:  -      -     0.33   0.33    -      -      -     2.33    -      -     cvtsi2ss	%rcx, %xmm2
# CHECK-NEXT:  -      -      -     1.00   0.50   0.50    -      -      -      -     cvtsi2ssl	(%rax), %xmm2
# CHECK-NEXT:  -      -      -     1.00   0.50   0.50    -      -      -      -     cvtsi2ssl	(%rax), %xmm2
# CHECK-NEXT:  -      -     1.00   1.00    -      -      -      -      -      -     cvtss2si	%xmm0, %ecx
# CHECK-NEXT:  -      -     1.33   0.33    -      -      -     1.33    -      -     cvtss2si	%xmm0, %rcx
# CHECK-NEXT:  -      -     1.00   1.00   0.50   0.50    -      -      -      -     cvtss2si	(%rax), %ecx
# CHECK-NEXT:  -      -     1.00   1.00   0.50   0.50    -      -      -      -     cvtss2si	(%rax), %rcx
# CHECK-NEXT:  -      -     0.33   0.33    -      -      -     1.33    -      -     cvttps2pi	%xmm0, %mm2
# CHECK-NEXT:  -      -     0.33   0.33   0.50   0.50    -     0.33    -      -     cvttps2pi	(%rax), %mm2
# CHECK-NEXT:  -      -     1.00   1.00    -      -      -      -      -      -     cvttss2si	%xmm0, %ecx
# CHECK-NEXT:  -      -     1.33   0.33    -      -      -     1.33    -      -     cvttss2si	%xmm0, %rcx
# CHECK-NEXT:  -      -     1.00   1.00   0.50   0.50    -      -      -      -     cvttss2si	(%rax), %ecx
# CHECK-NEXT:  -      -     1.33   0.33   0.50   0.50    -     1.33    -      -     cvttss2si	(%rax), %rcx
# CHECK-NEXT:  -     3.00   1.00    -      -      -      -      -      -      -     divps	%xmm0, %xmm2
# CHECK-NEXT:  -     5.00   1.00    -     0.50   0.50    -      -      -      -     divps	(%rax), %xmm2
# CHECK-NEXT:  -     3.00   1.00    -      -      -      -      -      -      -     divss	%xmm0, %xmm2
# CHECK-NEXT:  -     3.00   1.00    -     0.50   0.50    -      -      -      -     divss	(%rax), %xmm2
# CHECK-NEXT:  -      -     1.25   0.25   0.50   0.50    -     0.25   0.25    -     ldmxcsr	(%rax)
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -     maskmovq	%mm0, %mm1
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -     maxps	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -     maxps	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -     maxss	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -     maxss	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -     minps	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -     minps	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -     minss	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -     minss	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.33   0.33    -      -      -     0.33    -      -     movaps	%xmm0, %xmm2
# CHECK-NEXT:  -      -      -      -     0.33   0.33   1.00    -      -     0.33   movaps	%xmm0, (%rax)
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -      -      -      -     movaps	(%rax), %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -     movhlps	%xmm0, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -     movlhps	%xmm0, %xmm2
# CHECK-NEXT:  -      -      -      -     0.33   0.33   1.00    -      -     0.33   movhps	%xmm0, (%rax)
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -     movhps	(%rax), %xmm2
# CHECK-NEXT:  -      -      -      -     0.33   0.33   1.00    -      -     0.33   movlps	%xmm0, (%rax)
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -     movlps	(%rax), %xmm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -     movmskps	%xmm0, %ecx
# CHECK-NEXT:  -      -      -      -     0.33   0.33   1.00    -      -     0.33   movntps	%xmm0, (%rax)
# CHECK-NEXT:  -      -      -      -     0.33   0.33   1.00    -      -     0.33   movntq	%mm0, (%rax)
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -     movss	%xmm0, %xmm2
# CHECK-NEXT:  -      -      -      -     0.33   0.33   1.00    -      -     0.33   movss	%xmm0, (%rax)
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -      -      -      -     movss	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.33   0.33    -      -      -     0.33    -      -     movups	%xmm0, %xmm2
# CHECK-NEXT:  -      -      -      -     0.33   0.33   1.00    -      -     0.33   movups	%xmm0, (%rax)
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -      -      -      -     movups	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -     mulps	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -     mulps	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -     mulss	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -     mulss	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.33   0.33    -      -      -     0.33    -      -     orps	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.33   0.33   0.50   0.50    -     0.33    -      -     orps	(%rax), %xmm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -     pavgb	%mm0, %mm2
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -     pavgb	(%rax), %mm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -     pavgw	%mm0, %mm2
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -     pavgw	(%rax), %mm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -     1.00    -      -     pextrw	$1, %mm0, %ecx
# CHECK-NEXT:  -      -      -      -      -      -      -     2.00    -      -     pinsrw	$1, %eax, %mm2
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -     pinsrw	$1, (%rax), %mm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -     pmaxsw	%mm0, %mm2
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -     pmaxsw	(%rax), %mm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -     pmaxub	%mm0, %mm2
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -     pmaxub	(%rax), %mm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -     pminsw	%mm0, %mm2
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -     pminsw	(%rax), %mm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -     pminub	%mm0, %mm2
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -     pminub	(%rax), %mm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -     pmovmskb	%mm0, %ecx
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -     pmulhuw	%mm0, %mm2
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -     pmulhuw	(%rax), %mm2
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -      -      -      -     prefetcht0	(%rax)
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -      -      -      -     prefetcht1	(%rax)
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -      -      -      -     prefetcht2	(%rax)
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -      -      -      -     prefetchnta	(%rax)
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -     psadbw	%mm0, %mm2
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -     psadbw	(%rax), %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -     pshufw	$1, %mm0, %mm2
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -     pshufw	$1, (%rax), %mm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -     rcpps	%xmm0, %xmm2
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -     rcpps	(%rax), %xmm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -     rcpss	%xmm0, %xmm2
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -     rcpss	(%rax), %xmm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -     rsqrtps	%xmm0, %xmm2
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -     rsqrtps	(%rax), %xmm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -     rsqrtss	%xmm0, %xmm2
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -     rsqrtss	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.25   0.25   0.33   0.33    -     0.25   0.25   0.33   sfence
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -     shufps	$1, %xmm0, %xmm2
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -     shufps	$1, (%rax), %xmm2
# CHECK-NEXT:  -     3.00   1.00    -      -      -      -      -      -      -     sqrtps	%xmm0, %xmm2
# CHECK-NEXT:  -     3.00   1.00    -     0.50   0.50    -      -      -      -     sqrtps	(%rax), %xmm2
# CHECK-NEXT:  -     3.00   1.00    -      -      -      -      -      -      -     sqrtss	%xmm0, %xmm2
# CHECK-NEXT:  -     3.00   1.00    -     0.50   0.50    -      -      -      -     sqrtss	(%rax), %xmm2
# CHECK-NEXT:  -      -      -      -     0.33   0.33   1.00   1.00    -     0.33   stmxcsr	(%rax)
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -     subps	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -     subps	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.50   0.50    -      -      -      -      -      -     subss	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.50   0.50   0.50   0.50    -      -      -      -     subss	(%rax), %xmm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -     ucomiss	%xmm0, %xmm1
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -     ucomiss	(%rax), %xmm1
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -     unpckhps	%xmm0, %xmm2
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -     unpckhps	(%rax), %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -     unpcklps	%xmm0, %xmm2
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -     unpcklps	(%rax), %xmm2
# CHECK-NEXT:  -      -     0.33   0.33    -      -      -     0.33    -      -     xorps	%xmm0, %xmm2
# CHECK-NEXT:  -      -     0.33   0.33   0.50   0.50    -     0.33    -      -     xorps	(%rax), %xmm2
