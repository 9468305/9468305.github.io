---
layout: post
title: "Kotlin：Native Unchecked casts"
image: ../static/Kotlin.png
description: "Kotlin Multiplatform Native Unchecked casts ClassCastException"
author: ChenQi
category: [Technology, Kotlin]
---

小乔写的[《Kotlin/Native 的坑爹 Bug》](https://mp.weixin.qq.com/s/0lLf-r7Dr1cJ5L-3fO_tmg)还是太含蓄委婉了，只用副标题呐喊他这个布道师要反水了，以及文末结语理智冷静的劝告读者，现阶段千万别在生产环境的商业产品中使用 Kotlin Native 。

所谓“希望越大失望越大”，我还是想骂几句，补充一些小乔没写的上下文。

### [KT-7972][KT-7972]

《Type safety breach when is-check ignores variance incompatibility》

2015.06.08 Ilya Gorbunov：  
发帖提问报Bug：以下这段代码，往整型动态数组插入字符串元素，能够正常编译通过。加一个判断好不好？

```kotlin
private fun <E> List<E>.addAnything(element: E) {
    if (this is MutableList<E>) {
        this.add(element)
    }
}

arrayListOf(1, 2).addAnything("string")
```

2015.06.09 Pavel Talanov：  
Andrey Breslav，你看一下。（这哥们没鸟他）

2015.06.09 Vladimir Reshetnikov：  
如果 `x` 的类型是 `VariantSuperInterface<T>` ，我们应该禁用 `(x is NonVariantInterface<T>)` 和 `(x is NonVariantInterface)` 。  
因为类型擦除了，所以我们无法检查 `<T>` 的部分。而且由于动态性，我们也无法静态检查出来。

**一年后。。。。。。**

2016.04.13 Jan Kanis：  
或者像其他类型擦除行为一样，加个 Warning 吧？

**四年后。。。。。。**

2020.07.21 Jason5Lee：  
这个Bug还可能导致 Kotlin Native 内存不安全。下面这段代码编译运行在 linux x64 上，打印输出“12”。

```kotlin
open class Base<out T>
class Derive<T>(var value: T) : Base<T>()

fun main() {
    val d = Derive(0)
    val b: Base<Any> = d
    if (b is Derive) {
        b.value = "0123456789"
    }
    println(d.value + 2)
}
```

2020.07.27 Ilya Gorbunov：  
@Jason5Lee，我在 Kotlin Native 分类问题下面开个新帖子吧，KT-40613。

**5年陈的语言设计缺陷，这是打娘胎里出来就不打算改的基因啊！**  

<div class="scrollable-table-wrapper" markdown="block">

| Project | Kotlin |
|:---|:---|
| Priority | Not specified |
| Type | Bug |
| State | Open |
| Assignee | Unassigned |
| Subsystems | Language design |

{:.table-scrollable}
</div>

### [KT-40613][KT-40613]

《No ClassCastException in Kotlin/Native after an unchecked cast leading to heap pollution》

2020.07.27 Ilya Gorbunov（又是他）：  
开新贴。

> Kotlin 范型的类型检测和转换，支持非受检类型转换。例如把入参当做返回值使用，数据类型可以改变。  
但是 Kotlin Native 干这事容易导致内存堆污染，破坏内存安全性。而且还无法检测到。

```kotlin
class Box<T>(var value: T)

fun main() {
        val d = Box(1)
        if( d as? Box<String> != null) {
            d.value = "0123456789"
        }
        println(d.value + 2)
}

//上面这段代码输出“12”，不抛 ClassCastException 。

fun main() {
        val d = Box(listOf(1))
        if( d as? Box<String> != null) {
            d.value = "0123456789"
        }
        println(d.value.first())
}

/*
上面这段代码编译正常，运行时直接崩，输出：
runtime\src\main\cpp\TypeInfo.cpp:41: runtime assert: Unknown open method
*/
```

**然而。。。并没有人鸟他。**

### [KT-42903][KT-42903]

《In Some Case Kotlin/Native Doesn't throw the ClassCastException》

2020.10.23 小乔很激动的（估计现在很不开心）跟我说，他发现了 Kotlin Native 编译器的一个大 Bug，对象的类型能够随意强转，还不报错，运行结果看缘分。  
我激动并理智的说，你写个简单的 Demo 来看看？  
结果真TMD是这样。  
我继续激动并理智的说，你去官方论坛发个帖子问问？是不是新版本不慎带出来的缺陷？  
结果真TMD是个陈年老坑。

2020.10.28 Svyatoslav Scherbina：  
已知问题，设计如此。认真学习一下官方文档吧：[unchecked-casts][unchecked-casts]  

**什么破玩意儿，怪不得JB要重写编译器，还要设计自己的 IR 中间指令集，自作孽啊！**

### [Duck typing][duck]

吃完晚餐一个人发呆的时候突然想到，这玩意需要换个思路理解，不能再从 Java 静态语言的角度来看。

这种运行时随缘的代码语法，有点像 Ruby，Python，Javascript 动态语言常见的**鸭子类型**啊。iOS Objective-C 语言也有这玩意啊。

这样强行解释其合理性，似乎心情能好一点点，就这样吧。

[KT-7972]: https://youtrack.jetbrains.com/issue/KT-7972
[KT-40613]: https://youtrack.jetbrains.com/issue/KT-40613
[KT-42903]: https://youtrack.jetbrains.com/issue/KT-42903
[unchecked-casts]: https://kotlinlang.org/docs/reference/typecasts.html#unchecked-casts
[duck]: https://en.wikipedia.org/wiki/Duck_typing
