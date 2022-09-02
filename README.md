# TraceRecorder

This project is based on Clang+LLVM 12.0, and has integrated the trace collecting tool TraceRecorder. TraceRecorder is implemented as a sanitizer pass. It instruments the program source code at compiling time, and will automatically collect the execution trace and the LLVM IR dynamic slice during the program running.

## Usage: 
```
mkdir ../build
cd ../build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DLLVM_BUILD_TESTS=OFF -DLLVM_INCLUDE_TESTS=OFF -DLLVM_BUILD_EXAMPLES=OFF -DLLVM_INCLUDE_EXAMPLES=OFF -DLLVM_ENABLE_ASSERTIONS=OFF ../TraceRecorder
make -j10
./bin/clang -g -fsanitize=trace </path/to/your/source/code> -o </path/to/output>
TREC_TRACE_DIR=</path/to/your/directory> </path/to/output>
```
The trace files will be placed under the folder specified by TREC_TRACE_DIR.
Please remember to use the absolute path.
