---
layout: post
title: "Kotlin：Native Memory Management Origin"
description: "Kotlin Multiplatform KMP KMM Garbage Collector Freeze"
image: ../static/chenqi.jpg
author: ChenQi
category: [Technology, Kotlin]
---

## Andrey Breslav

第一任 Kotlin 项目负责人（2010 - 2020）。

### 2017.04.04 v0.1

Andrey Breslav 宣布了 Kotlin/Native 首个技术预览版发布：[《Kotlin without a VM》](https://blog.jetbrains.com/kotlin/2017/04/kotlinnative-tech-preview-kotlin-without-a-vm/)。Kotlin/Native 编译器将 Kotlin 代码通过 LLVM 编译器直接编译为机器代码，生成独立的可执行文件，无需任何虚拟机即可运行。

它并不是让任意 Kotlin/JVM 程序可在 Kotlin/Native 或 Kotlin/JS 上运行。（这等于实现另一个 JVM，既工作量大，又对运行时有很多限制。）而是另一种方式：为所有平台提供一种通用语言，同时通过与平台代码的无缝互操作性来创建通用库。

它旨在为不同的目标平台启用不同的内存管理方案。例如，将来为服务器/桌面平台提供跟踪 GC 可能更有意义，而 `ARC` 在 iOS 上更有意义。某些平台可能只需要手动管理，好处是拥有更小的 Kotlin/Native 运行时。

此技术预览版自带自动引用计数功能，顶部有一个循环收集器，但当时尚未确定最终的内存管理方案会是什么样子。

## Nikolay Igotti

Kotlin/Native Tech Lead

> 随之而来的痛点就是内存管理方案对线程安全，并发编程的限制与挑战。

### 2017.11.16 v0.4

当前版本中处理线程安全的方式已经相当不错了，因为我们不在线程之间共享对象堆，并且显式地转移对象子图的所有权，因此不可能发生并发突变。

### 2017.12.19 v0.5

当前版本中全局变量是基于 `Thread-Local` 的，因此不会发生崩溃，但不会看到其他线程初始化。但是，此模型可能并且很可能会在未来版本中发生变化。

### 2018.02.07

不鼓励您使用线程，也不提供在线程之间共享 Kotlin 对象的方法。但是，我们相信在 Kotlin/Native 中进行并发、软实时编程应该很容易。

并发计算是围绕 `Worker` 构建的。`Worker` 是比线程更高级别的并发概念，它允许对象传输，而不是对象共享和同步，因此每时每刻都只有单个 `Worker` 可以访问特定对象。这意味着，访问对象数据不需要同步，因为访问永远不会是并发的。`Worker` 可以接收执行请求，它可以根据需要接受对象并执行作业，然后将结果传回给需要计算结果的任何人。这种模型确保避免了许多典型的并发编程错误（例如对共享数据的非同步访问，或由于无序获取锁而导致的死锁）。

协程本质上是一种通过自愿抢占/恢复机制从回调地狱中拯救出来的机制。它提供并发式的 API，但它本身并不是并发编程概念，只是一种以更连续的方式表示流控制的方式。

`Worker` 通过在多个内核/CPU上并行执行工作，提供利用实际硬件并发性的机制。

不幸的是，线程给人们带来了通过使用单一构造混合这两个场景的糟糕教训，这导致了相当大的代码复杂性和软件维护成本的增加。因此，我们在这里尝试实现的是让人们能够在 `Worker` 机制中使用良好的编码实践。我们认为使用共享对象堆的经典线程是一种低劣的编程技术，因此我们试图提供一种新选择。

### 2018.04.27 v0.7 内存模型改进：冻结对象

传统上，Kotlin/Native 试图尽可能避免共享数据。但是在某些情况下，需要一些共享的不可变数据。典型的例子是配置数据，在启动时从文件中读取，然后在任何地方可用。为了实现这样的目标，实现了对象冻结的概念。对象要么处于可变状态并且由单个线程或工作者拥有，要么是不可变的，并且可以在多个线程或工作者之间共享，并且可以在所有消费者不再需要它时被释放。

冻结对象具有基于并发循环安全引用计数器的内存管理的良好特性，因为在冻结过程中对象图被压缩为 `DAG`，因此可以仅基于引用计数器进行收集。如果试图改变冻结的对象，则会引发运行时异常。因此，冻结允许跨多个线程或工作线程更安全地共享对象。

### 2018.07.11 v0.8 并发改进

在 v0.8 之前，Kotlin/Native 应用程序将单例对象状态保持在特定执行线程的`Thread-Local`，因此不同线程上的单例对象状态可能是不同步的。

现在，扩展冻结单例对象的概念，我们允许共享不可变状态。共享对象将在每次（进程）执行时初始化读取一次，可供任何线程或 `Worker` 使用。初始化后，该对象将被冻结，并且无法再次被修改（尝试修改将抛出`InvalidMutabilityException`）。

同时配合使用 `AtomicReference` 存储冻结对象，并确保数据更新是原子性操作。

## Roman Elizarov

+ Kotlin Coroutines 项目负责人。  
+ 第二任 Kotlin 项目负责人（2020.11接手）。  

他之前很少在 Kotlin 官方博客撰文，而是活跃在自己的[Medium博客](https://elizarov.medium.com/)，围绕并发编程，协程，流的话题撰写了大量的文章，句句珠玑！

+ [Kotlin Coroutines, a deeper look](https://elizarov.medium.com/kotlin-coroutines-a-deeper-look-180536305c3f)
+ [What is “concurrent” access to mutable state?](https://proandroiddev.com/what-is-concurrent-access-to-mutable-state-f386e5cb8292)
+ [Such concurrency! Many threads! Wow!](https://elizarov.medium.com/such-concurrency-many-threads-wow-7c81ba9e9ebe)
+ [Structured concurrency](https://elizarov.medium.com/structured-concurrency-722d765aa952)
+ [Futures, cancellation and coroutines](https://elizarov.medium.com/futures-cancellation-and-coroutines-b5ce9c3ede3a)
+ [Blocking threads, suspending coroutines](https://elizarov.medium.com/blocking-threads-suspending-coroutines-d33e11bf4761)
+ [Explicit concurrency](https://elizarov.medium.com/explicit-concurrency-67a8e8fd9b25)
+ [AOP vs functions](https://elizarov.medium.com/aop-vs-functions-2dc66ae3c260)
+ [Deadlocks in non-hierarchical CSP](https://elizarov.medium.com/deadlocks-in-non-hierarchical-csp-e5910d137cc)
+ [The reason to avoid GlobalScope](https://elizarov.medium.com/the-reason-to-avoid-globalscope-835337445abc)
+ [Coroutine Context and Scope](https://elizarov.medium.com/coroutine-context-and-scope-c8b255d59055)
+ [Cold flows, hot channels](https://elizarov.medium.com/cold-flows-hot-channels-d74769805f9)
+ [Simple design of Kotlin Flow](https://elizarov.medium.com/simple-design-of-kotlin-flow-4725e7398c4c)
+ [Kotlin Flows and Coroutines](https://elizarov.medium.com/kotlin-flows-and-coroutines-256260fb3bdb)
+ [Execution context of Kotlin Flows](https://elizarov.medium.com/execution-context-of-kotlin-flows-b8c151c9309b)
+ [Reactive Streams and Kotlin Flows](https://elizarov.medium.com/reactive-streams-and-kotlin-flows-bfd12772cda4)
+ [Exceptions in Kotlin Flows](https://elizarov.medium.com/exceptions-in-kotlin-flows-b59643c940fb)
+ [Callbacks and Kotlin Flows](https://elizarov.medium.com/callbacks-and-kotlin-flows-2b53aa2525cf)
+ [Structured Concurrency Anniversary](https://elizarov.medium.com/structured-concurrency-anniversary-f2cc748b2401)
+ [Deep recursion with coroutines](https://elizarov.medium.com/deep-recursion-with-coroutines-7c53e15993e3)
+ [Phantom of the Coroutine](https://elizarov.medium.com/phantom-of-the-coroutine-afc63b03a131)
+ [Immutability we can afford](https://elizarov.medium.com/immutability-we-can-afford-10c0dcb8351d)
+ [Shared flows, broadcast channels](https://elizarov.medium.com/shared-flows-broadcast-channels-899b675e805c)
+ [Programming Language Evolution](https://elizarov.medium.com/programming-language-evolution-ab7d7d2b0d0b)

### 2020.07.20 [内存管理方案路线图](https://blog.jetbrains.com/kotlin/2020/07/kotlin-native-memory-management-roadmap/)

目前 Kotlin/Native 中的自动内存管理实现在并发方面存在局限性，我们正在研究替代方案。现有代码将继续可用并得到支持。

自动引用计数内存管理器很容易编写，配合上一个基于 `trial-deletion` 算法的循环垃圾收集器，方便启动孵化 Kotlin/Native 这个项目，为 Kotlin 程序员提供符合预期的基础开发体验。

随着 Kotlin/Native 项目的成熟和更广泛的采用，这种基于引用计数的自动内存管理方案的局限性开始变得更加明显。一方面，内存分配密集型应用程序很难获得高吞吐量。（虽然性能很重要，但它并不是 Kotlin 设计的唯一因素。）

但是，将多线程和并发性混合使用时，限制会恶化。在成功使用全自动引用计数内存管理的所有生态系统中（最显著的是 Python），并发性受到诸如“全局解释器锁”机制之类的严重限制。这种方法不适用于 Kotlin。移动应用程序必须能够将 CPU 密集型操作转移到与主线程并行运行的后台线程中。

为了解决这个问题，现状是开发了一组独特的限制，以使其高效地运行单线程代码，并使在线程之间共享数据成为可能。增加的要求是必须首先冻结对象图以防止其被修改。只有这样它才能与其他线程共享。或者，如果原始线程中没有保留对它的引用，则它可以作为分离的对象图完全转移到另一个线程。仅共享不可变数据，好处是在很大程度上避免了“共享可变状态”的可怕问题。这个方案扛了一段时间。

虽然在概念上很有吸引力，但当前方案有许多缺陷，阻碍了发展。移动开发人员习惯于能够在线程之间自由共享他们的对象，并且他们已经开发了许多方法和架构模式来避免这样做时的数据竞争。正如许多早期采用者所展示的那样，使用 Kotlin/Native 编写不阻塞主线程的高效应用程序是可能的，但是这样实现的能力伴随着陡峭的学习曲线。

另一个问题，跨平台共享代码。一些并发代码，即使一开始是安全且无竞争的，实际上也不可能在 Kotlin/JVM 和 Kotlin/Native 之间共享。特别是，各种并发数据结构和同步原语，既可以是通用的，也可以是特定于领域的，结果证明很难在两者之间共享。

当我们尝试为 Kotlin/Native 实现多线程 kotlinx.coroutines 时，遇到了特殊的挑战。同步原语必须在内部共享一个可变状态，Kotlin/Native 通过特殊的原子引用支持这种状态。然而，现有的内存管理算法不会通过这些引用来跟踪周期。即使花费了大量精力时间，在一些并发执行场景中仍然存在内存泄漏的问题，我们对此也没有明确的解决方案。

#### 新内存管理器

写个新的吧，目标是：

+ 解除 Kotlin/Native 中对象共享的限制
+ 自动跟踪和回收所有未使用的 Kotlin 内存
+ 提高性能
+ 内存安全无泄漏
+ 安全的并发编程原语
+ 不需要开发人员的任何特殊管理或注释

考虑到兼容性过渡，我们计划继续支持对象冻结作为无竞争数据共享的安全机制，并且我们将寻找方法来改进 Kotlin 在整个 Kotlin 语言中处理不可变数据的方法，不仅仅是在 Kotlin/Native 中。与内存管理相关的现有注释将在新内存管理器中具有适当的行为，以确保旧代码仍然有效。同时，我们将继续支持现有的内存管理器，我们将发布适用于 Kotlin/Native 的多线程库，以便您可以在它们之上开发您的应用程序。

> 我们已经决定需要开发一个新的内存管理器，但我们还没有决定它具体长什么样。它将需要大量的原型设计、基准测试和实验。这篇博文旨在向我们的社区提供有关未来变化的最新信息。我们将在弄清楚后分享更多细节。
>
> 我们跟Rust不一样。Rust 模型非常特定于 Rust，需要开发人员以正确注释生命周期和正确使用引用类型和各种 Box/Rc 包装器的形式获得大量知识和远见卓识。这一切都给代码增加了太多的仪式感，并且与 Kotlin 的目标背道而驰，即让开发人员专注于其代码的业务逻辑的实质内容。

### 2021.05.20 [内存管理新方案进展](https://blog.jetbrains.com/kotlin/2021/05/kotlin-native-memory-management-update/)

+ 自动内存管理基础
+ 引用计数和跟踪垃圾收集
+ Kotlin/Native 垃圾收集器
+ 新的垃圾收集器基础设施
+ 下一步

第一步实现不支持多线程应用程序，仅用于测试。下一步是编写一个支持多线程的垃圾回收实现，将kotlinx.coroutines 库移植到它，并对其进行测试。目标是让您能够在 Darwin 上使用多线程后台调度队列自由启动协同程序，而不必冻结在后台线程中工作的对象。这将成为我们计划在 2021 年夏末之前作为开发预览呈现的第一个公开里程碑。它不会投入生产，因为它将专注于正确性，而不是性能。之后再专注于性能并在更具确定性的释放、内存使用和吞吐量之间进行各种权衡。

我们计划先实现一个生产可用的垃圾收集实现，它支持线程之间无阻碍地共享对象并满足所有其他设计目标。未来我们可能会有许多受支持的垃圾收集算法，它们针对不同的场景进行优化。

眼下，我们将继续支持原有的 Kotlin/Native 内存管理方案，以简化现有 Kotlin/Native 应用程序的迁移。在构建 Kotlin/Native 应用程序时，您将能够选择垃圾收集实现。您的应用程序的源代码不会更改，因为将通过编译器标志进行选择。

## [新内存管理技术预览版发布]((https://blog.jetbrains.com/kotlin/2021/08/try-the-new-kotlin-native-memory-manager-development-preview/))

2021.08.31, **Today we are taking a huge step.**

新方案解除了线程间对象共享的限制，并提供完全无泄漏的并发编程原语，这些原语是安全的，不需要开发人员进行任何特殊管理或注释。

新版本的 `kotlinx.coroutines` 和 `Ktor` 库已经从中受益，因此您可以使用多线程后台调度程序自由启动协程，而无需冻结在后台线程中工作的对象。

+ [生产示例](https://github.com/Kotlin/kmm-production-sample/tree/new-mm-demo)
+ [KNConcurrencyHandson](https://github.com/kotlin-hands-on/KNConcurrencyHandson/tree/new-mm-demo)

新版本使用经典的 `stop-the-world` 标记清除垃圾收集器。它很简单但不是最优的，但它确实让我们获得了第一个正确的实现，并为未来的垃圾收集器发展做好了基础设施的准备。

您将能够在 Kotlin 1.6 的项目中使用新的内存管理器开发预览版。我们继续支持原始的 Kotlin/Native 内存管理方案，以简化现有 Kotlin/Native 应用程序的迁移。在通过编译器标志或 Gradle 项目属性构建 Kotlin/Native 应用程序时，您将能够选择内存管理器实现。

现在我们正在研究高性能的生产就绪方法，并正在研究更复杂和更高效的垃圾收集器算法，例如并发标记清除。

Youtrack: [Prototype a new garbage collector](https://youtrack.jetbrains.com/issue/KT-42296)

Coroutines GitHub: [Support multi-threaded coroutines on Kotlin/Native #462](https://github.com/Kotlin/kotlinx.coroutines/issues/462)

[Vsevolod Tolstopyatov](https://github.com/qwwdfsad) 已将 Coroutines 新版代码合并。

> I suggest all users of native-mt builds to read the announcement.
>
>We aim to merge the support of the new MM into coroutines 1.6.0 (#2914) and then, depending on the stability of the new MM, promote it as the default way to write concurrent code on Native platforms.
>
>native-mt won't be supported as soon as the new MM is stable.

但是同时也留了一个随时回滚禁用的坑。

> My proposal is to leverage isExperimentalMM stdlib API (available only in 1.6.0+) and merge the support of the new MM in the mainline, enabling new "sharing" behaviour (and also implementations of Dispatchers.Main, Dispatchers.Default and new*Context()) conditionally. If the new MM is disabled, we can fallback to our single-threaded mode.

根据过往踩坑经验，衷心祝福新方案能在1.6.20版本稳定可用。  
Roman Elizarov 加油！
