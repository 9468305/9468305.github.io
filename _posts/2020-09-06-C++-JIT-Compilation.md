---
layout: post
title: "Tech：C++ JIT Compilation"
description: "ClangJIT, C++, Clang, LLVM, Just-in-Time, Specialization"
image: ../static/chenqi.jpg
author: ChenQi
category: Technology
---

### [ClangJIT: Enhancing C++ with Just-in-Time Compilation](https://arxiv.org/pdf/1904.08555.pdf)

### Author

[Hal Finkel](https://www.alcf.anl.gov/about/people/hal-finkel), 美国阿贡国家实验室，编译器技术和编程语言负责人，C++ 标准委员会副主席。

### YouTube

[《Faster Compile Times and Better Performance: Bringing Just-in-Time Compilation to C++》](https://www.youtube.com/watch?v=6dv9vdGIaWs)

### ABSTRACT

> The C++ programming language is not only a keystone of the
high-performance-computing ecosystem but has proven to be a
successful base for portable parallel-programming frameworks. As
is well known, C++ programmers use templates to specialize algorithms, thus allowing the compiler to generate highly-efficient
code for specific parameters, data structures, and so on. This capability has been limited to those specializations that can be identified when the application is compiled, and in many critical cases,
compiling all potentially-relevant specializations is not practical.
>
> ClangJIT provides a well-integrated C++ language extension allowing template-based specialization to occur during program execution. This capability has been implemented for use in large-scale
applications, and we demonstrate that just-in-time-compilationbased dynamic specialization can be integrated into applications,
often requiring minimal changes (or no changes) to the applications themselves, providing significant performance improvements,
programmer-productivity improvements, and decreased compilation time.

### CONCLUSIONS

> In this paper, we’ve demonstrated that JIT-compilation technology
can be integrated into the C++ programming language, that this
can be done in a way which makes using JIT compilation easy, that
this can reduce compile time, making application developers more
productive, and that this can be used to realize high performance in
HPC applications. We investigated whether JIT compilation could
be integrated into applications making use of the RAJA abstraction
library without any changes to the application source code at all
and found that we could. We then investigated how JIT compilation could be integrated into existing HPC applications. Kripke
and Laghos were presented here, and we demonstrated that the
existing dispatch schemes could be replaced with the proposed
JIT-compilation mechanism. This replacement produced significant
speedups to the AoT compilation process, which increases programmer productivity, and moreover, the resulting code is simpler and
easier to maintain, which also increases programmer productivity.
>
> In the future, we expect to see uses of JIT compilation replacing
generic algorithm implementations in HPC applications which represent so many potential specializations that instantiating them
during AoT compilation is not practical. We already see this in
machine-learning frameworks (e.g., in TensorFlow/XLA) and other
domain-specific libraries, and now ClangJIT makes this capability
available in the general-purpose C++ programming language. The
way that HPC developers think about the construction of optimized
kernels, unlike in the past, will increasingly include the availability
of JIT compilation capabilities.

### [C++ Should Support Just-in-Time Compilation](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p1609r3.html)

+ P1609R3  
Published Proposal, 2020-01-13
+ This version:  
[http://wg21.link/p1609](http://wg21.link/p1609)
+ Issue Tracking:  
Inline In Spec
+ Author:  
Hal Finkel (Argonne National Laboratory)
+ Audience:  
SG7, SG17
+ Project:  
ISO/IEC JTC1/SC22/WG21 14882: Programming Language — C++

### [Easy::jit: Just-In-Time compilation for C++](https://blog.quarkslab.com/easyjit-just-in-time-compilation-for-c.html)

> Easy::jit is a library that brings just-in-time compilation to C++ codes. It allows developers to jit-compile some functions and specializing (part of) their parameters. Just-in-time compilation is done on-demand and controlled by the developer. The project is available on github .
>
> The performance of some codes is tied to the values taken by certain parameters whose value is only known at runtime: loop trip counts, values read from configuration files, user-input, etc. If these values are known, the code can be specialized and extra optimizations become possible, leading to better performance.
>
> It hides complicated concepts and is presented as a simple abstraction; no specific compilation knowledge is required to use it.

[Easy::Jit Just-In-Time compilation for C++ codes](http://llvm.org/devmtg/2018-04/slides/Caamano-Easy_Jit.pdf)  
From Quarkslab  

### [libgccjit.so](https://gcc.gnu.org/wiki/JIT)

> GCC can be built as a shared library "libgccjit.so", for generating machine code from API calls, using GCC as the backend.
>
> This shared library can then be dynamically-linked into bytecode interpreters and other such programs that want to generate machine code "on the fly" at run-time.
>
> It can also be used for ahead-of-time code generation, for building standalone compilers (so the "jit" part of the name is now something of a misnomer).
>
> The library provides a C API, along with a C++ wrapper API, with bindings for languages available from 3rd parties (see below).
>
> The API is very high-level, and is designed in terms of C semantics (since you're probably going to want to interface with C code).

### Status

> libgccjit.so has been available in gcc since GCC 5, and we believe it has been API and ABI-compatible since then. See the [API and ABI compatibility notes](https://gcc.gnu.org/onlinedocs/jit/topics/compatibility.html) in the documentation.
>
> The C API is mature at this point, though I'm open to adding new entrypoints to support functionality that I may have missed.
>
> Although the C++ API ships within GCC, it should be regarded as more experimental that the C API.
>
> The maintainer is [David Malcolm](dmalcolm@redhat.com)
>
> There are language bindings available from third parties for C#, D, OCaml, Perl, Python (2/3), and Rust.
