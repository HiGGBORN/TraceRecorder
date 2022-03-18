; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-apple-darwin -mattr=-sse2 -show-mc-encoding | FileCheck %s --check-prefix=SSE
; RUN: llc < %s -mtriple=x86_64-apple-darwin -mattr=+avx -show-mc-encoding | FileCheck %s --check-prefix=AVX1
; RUN: llc < %s -mtriple=x86_64-apple-darwin -mattr=+avx512f,+avx512bw,+avx512dq,+avx512vl -show-mc-encoding | FileCheck %s --check-prefix=AVX512

define i64 @test_x86_sse_cvtss2si64(<4 x float> %a0) {
; SSE-LABEL: test_x86_sse_cvtss2si64:
; SSE:       ## %bb.0:
; SSE-NEXT:    cvtss2si %xmm0, %rax ## encoding: [0xf3,0x48,0x0f,0x2d,0xc0]
; SSE-NEXT:    retq ## encoding: [0xc3]
;
; AVX1-LABEL: test_x86_sse_cvtss2si64:
; AVX1:       ## %bb.0:
; AVX1-NEXT:    vcvtss2si %xmm0, %rax ## encoding: [0xc4,0xe1,0xfa,0x2d,0xc0]
; AVX1-NEXT:    retq ## encoding: [0xc3]
;
; AVX512-LABEL: test_x86_sse_cvtss2si64:
; AVX512:       ## %bb.0:
; AVX512-NEXT:    vcvtss2si %xmm0, %rax ## EVEX TO VEX Compression encoding: [0xc4,0xe1,0xfa,0x2d,0xc0]
; AVX512-NEXT:    retq ## encoding: [0xc3]
  %res = call i64 @llvm.x86.sse.cvtss2si64(<4 x float> %a0) ; <i64> [#uses=1]
  ret i64 %res
}
declare i64 @llvm.x86.sse.cvtss2si64(<4 x float>) nounwind readnone


define i64 @test_x86_sse_cvttss2si64(<4 x float> %a0) {
; SSE-LABEL: test_x86_sse_cvttss2si64:
; SSE:       ## %bb.0:
; SSE-NEXT:    cvttss2si %xmm0, %rax ## encoding: [0xf3,0x48,0x0f,0x2c,0xc0]
; SSE-NEXT:    retq ## encoding: [0xc3]
;
; AVX1-LABEL: test_x86_sse_cvttss2si64:
; AVX1:       ## %bb.0:
; AVX1-NEXT:    vcvttss2si %xmm0, %rax ## encoding: [0xc4,0xe1,0xfa,0x2c,0xc0]
; AVX1-NEXT:    retq ## encoding: [0xc3]
;
; AVX512-LABEL: test_x86_sse_cvttss2si64:
; AVX512:       ## %bb.0:
; AVX512-NEXT:    vcvttss2si %xmm0, %rax ## EVEX TO VEX Compression encoding: [0xc4,0xe1,0xfa,0x2c,0xc0]
; AVX512-NEXT:    retq ## encoding: [0xc3]
  %res = call i64 @llvm.x86.sse.cvttss2si64(<4 x float> %a0) ; <i64> [#uses=1]
  ret i64 %res
}
declare i64 @llvm.x86.sse.cvttss2si64(<4 x float>) nounwind readnone
