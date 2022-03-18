; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --function-signature --scrub-attributes
; RUN: opt < %s -argpromotion -S | FileCheck %s
; RUN: opt < %s -passes=argpromotion -S | FileCheck %s

%T = type { i32, i32, i32, i32 }
@G = constant %T { i32 0, i32 0, i32 17, i32 25 }

define internal i32 @test(%T* %p) {
; CHECK-LABEL: define {{[^@]+}}@test
; CHECK-SAME: (i32 [[P_0_3_VAL:%.*]]) {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[V:%.*]] = add i32 [[P_0_3_VAL]], 10
; CHECK-NEXT:    ret i32 [[V]]
;
entry:
  %a.gep = getelementptr %T, %T* %p, i64 0, i32 3
  %b.gep = getelementptr %T, %T* %p, i64 0, i32 2
  %a = load i32, i32* %a.gep
  %v = add i32 %a, 10
  ret i32 %v
}

define i32 @caller() {
; CHECK-LABEL: define {{[^@]+}}@caller() {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[G_IDX:%.*]] = getelementptr [[T:%.*]], %T* @G, i64 0, i32 3
; CHECK-NEXT:    [[G_IDX_VAL:%.*]] = load i32, i32* [[G_IDX]], align 4
; CHECK-NEXT:    [[V:%.*]] = call i32 @test(i32 [[G_IDX_VAL]])
; CHECK-NEXT:    ret i32 [[V]]
;
entry:
  %v = call i32 @test(%T* @G)
  ret i32 %v
}
