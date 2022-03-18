//===-- trec_report.h -------------------------------------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file is a part of TraceRecorder (TRec), a race detector.
//
//===----------------------------------------------------------------------===//
#ifndef TREC_REPORT_H
#define TREC_REPORT_H

#include "sanitizer_common/sanitizer_symbolizer.h"
#include "sanitizer_common/sanitizer_thread_registry.h"
#include "sanitizer_common/sanitizer_vector.h"
#include "trec_defs.h"

namespace __trec {

enum ReportType {
  ReportTypeRace,
  ReportTypeVptrRace,
  ReportTypeUseAfterFree,
  ReportTypeVptrUseAfterFree,
  ReportTypeExternalRace,
  ReportTypeThreadLeak,
  ReportTypeMutexDestroyLocked,
  ReportTypeMutexDoubleLock,
  ReportTypeMutexInvalidAccess,
  ReportTypeMutexBadUnlock,
  ReportTypeMutexBadReadLock,
  ReportTypeMutexBadReadUnlock,
  ReportTypeSignalUnsafe,
  ReportTypeErrnoInSignal,
  ReportTypeDeadlock
};

struct ReportStack {
  SymbolizedStack *frames;
  bool suppressable;
  static ReportStack *New();

 private:
  ReportStack();
};

struct ReportMopMutex {
  u64 id;
  bool write;
};

struct ReportMop {
  int tid;
  uptr addr;
  int size;
  bool write;
  bool atomic;
  uptr external_tag;
  Vector<ReportMopMutex> mset;
  ReportStack *stack;

  ReportMop();
};

enum ReportLocationType {
  ReportLocationGlobal,
  ReportLocationHeap,
  ReportLocationStack,
  ReportLocationTLS,
  ReportLocationFD
};

struct ReportLocation {
  ReportLocationType type;
  DataInfo global;
  uptr heap_chunk_start;
  uptr heap_chunk_size;
  uptr external_tag;
  int tid;
  int fd;
  bool suppressable;
  ReportStack *stack;

  static ReportLocation *New(ReportLocationType type);
 private:
  explicit ReportLocation(ReportLocationType type);
};

struct ReportThread {
  int id;
  tid_t os_id;
  bool running;
  ThreadType thread_type;
  char *name;
  u32 parent_tid;
  ReportStack *stack;
};

struct ReportMutex {
  u64 id;
  uptr addr;
  bool destroyed;
  ReportStack *stack;
};

class ReportDesc {
 public:
  ReportType typ;
  uptr tag;
  Vector<ReportStack*> stacks;
  Vector<ReportMop*> mops;
  Vector<ReportLocation*> locs;
  Vector<ReportMutex*> mutexes;
  Vector<ReportThread*> threads;
  Vector<int> unique_tids;
  ReportStack *sleep;
  int count;

  ReportDesc();
  ~ReportDesc();

 private:
  ReportDesc(const ReportDesc&);
  void operator = (const ReportDesc&);
};

// Format and output the report to the console/log. No additional logic.
void PrintReport(const ReportDesc *rep);
void PrintStack(const ReportStack *stack);

}  // namespace __trec

#endif  // TREC_REPORT_H
