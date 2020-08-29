---
layout: post
title: "Tech：为什么要开源？"
image: ../static/chenqi.jpg
description: "从意识形态对抗到社会化编程"
author: ChenQi
category: Technology
---

知乎上看到一个好问题：[为什么要开源？](https://www.zhihu.com/question/33573424)

开源运动按时间顺序经历了三个时期：

+ 意识形态对抗
+ 黑客精神，社区运动
+ 成熟商业模式

### 意识形态对抗

Copyleft vs Copyright

+ Unix, FreeBSD, Linux
+ GNU (GNU's Not Unix)
+ GPL (General Public License)
+ 自由软件基金会（Free Software Foundation）

### 黑客精神，社区运动

Python, Ruby, Git ...

### 成熟商业模式

Android, Apache Foundation, Chrome, Docker, Elastic, Kubernetes, MySQL, MongoDB, Redis, Node.js ...  
这是一门生意，因此巨头涌动，例如微软转型积极拥抱开源。甚至可以利用开源模式进行技术倾销，消灭竞争对手。

> MongoDB 将开源 License 从 GNU AGPLv3 切换到 Server Side Public License（SSPL），以此回应 AWS 等云厂商将 MongoDB 以服务的形式提供给用户而没有回馈社区的行为。
>
> MongoDB CEO Dev Ittycheria 说：
>
> 我们的开源并不是为了获得帮助，使产品更好，而是作为免费增值策略，以推动采用。  
License 切换之后，我们的业务增长更快。没有任何影响，它只影响那些可能在考虑使用我们的免费版本，并将其作为托管服务提供给第三方的人。  
与其它开源公司不同，我们可以在一定程度上控制 License 是因为大多数其它开源公司都建立在已有技术上。  
其它开源公司只是将其非真正业务核心的东西开源出来，继而进入公共领域，他们的开源本质是想让社区进行众包研发，使项目完善得更好。  
然而 MongoDB 不是这样，而是由自己构建，没有其它技术经验支持。一方面，这说明了 MongoDB 团队的技术敏锐性；另一方面，我们的开源并不是为了获得帮助，使产品更好，而是作为免费增值策略，以推动采用。  
