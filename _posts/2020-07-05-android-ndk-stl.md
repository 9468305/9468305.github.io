---
layout: post
title: "Android：STL为何无内置？"
description: "Android STL gnustl stlport GCC Clang LLVM"
author: ChenQi
category: Technology
---

### 问题

Android系统为什么没有自带STL？

>Android系统的所有模块都没有使用C++ STL吗？还是说Android系统模块或者虚拟机如果要使用STL，只能使用NDK STL。  
Android上的java虚拟机实现有使用STL吗？  
这样的好处是NDK应用运行时保证一个进程内存中只有一个STL库？  
我理解NDK的STL不属于系统的一部分，没有被系统模块调用，只是应用代码使用。

### 回答

Android系统内部C++代码有使用STL，而且历史上不止一套，除了 `gnustl` 和 `stlport`，记得曾经有段时间 `uSTL` 这个库也出现在AOSP源码中。自 `Android 5.0 Lollipop` 开始，系统内部使用 `LLVM libc++`。

没有自带（内置）STL，以 `NDK API` 的形式提供给开发者，最大的原因（障碍）是 `C++ ABI` 兼容性一直无法保证。`Android NDK` 目前只能保证 `C API` 向前向后兼容。`C++ API` 的兼容性在官方roadmap中，但尚未排期。那么STL的兼容性保证就要更晚了。相比 `C API`，`C++ API` 保持好ABI兼容性的难度很大。

参考官方 [Roadmap](https://android.googlesource.com/platform/ndk/+/master/docs/Roadmap.md)

> NDK API header-only C++ wrappers  
NDK APIs are C-only for ABI stability reasons. We should offer header-only C++ wrappers for NDK APIs, even if only to offer the benefits of RAII. Examples include Bitmap, ATrace, and ASharedMemory.  
NDK C++ header-only JNI helpers  
Complaints about basic JNI handling are common. We should make libnativehelper or something similar available to developers.  

编译器Clang替代GCC，libc++替代 gnustl/stlport，花了很长时间。  
NDK r16推荐使用libc++。r17 变成默认。r18删除GCC 和 gnustl/stlport。r19 C++14变成默认编译选项。  

C++本身，编译器，STL，三方的各种升级都可能导致ABI不兼容。后果就是应用运行直接崩溃，所以Android 7，8，9 持续增加对私有API调用的限制。  

参考官方[安全限制说明](https://android-developers.googleblog.com/2016/06/improving-stability-with-private-cc.html)

> 您可能会惊讶于NDK库中没有STL。NDK包含的三个STL实现-LLVM libc ++，GNU STL和libstlport-旨在通过静态链接到您的库或包含为单独的共享库与应用程序捆绑在一起。过去，一些开发人员以为他们不需要打包该库，因为操作系统本身具有副本。这种假设是不正确的：特定的STL实现可能消失（如在6.0 棉花糖中删除stlport的情况），可能永远不可用（如彻底删除GNU STL的情况），或者它可能以ABI不兼容的方式改变（与LLVM libc ++一样）。
