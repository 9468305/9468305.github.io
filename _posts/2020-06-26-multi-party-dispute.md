---
layout: post
title: "TLDP 009：领导们意见不一致？"
description: "Technical Leadership Development Program"
image: ../static/chenqi.jpg
author: ChenQi
category: Management
---

> 看到 TLDP 大群中讨论到，如果直接上级和间接上级意见经常不一致，该怎么应对。讲三个小故事，单纯从一个技术宅的视角谈点简单的想法。

设定三个角色，主人公A，直接上级B，间接上级C。B和C经常意见不一致，使得A很苦恼，不知所措。  
作为一线执行层人员，自然处于A的角色。作为 Team Leader，可能常常在ABC三种角色间切换。所以快速切换不同视角思考，可能答案自然水落石出，所谓“换位思考”。  
作为B，你跟C经常意见不一致，让A很难做。这很明显是你的问题。如果还指望A能左右逢源，当和事佬，化解你和C的矛盾，那你不如跟A交换一下岗位算了。  
作为B，你可以跟C经常意见不一致，但是每次争论一定要有结论。要么共同决策一件事到底怎么做，要么共同决策这件事当前搁置不做。总不能让A自己猜着做。  
作为C，如果B反对你，A支持你，很简单，尽快跟B解决分歧。  
作为C，如果B支持你，A反对你。那这通常不是问题，B自然会解决。  
原问题场景中，A大概是处于不发表意见的中立懵逼状态，观望B和C的争论，所以根因还在于B和C的管理觉悟和技能是否成熟。  

**创作声明：以下故事基于真实事件改编，内容情节存在虚拟加工，仅供参考。**

### A的故事

我是A，曾经有段时间，我原先直接汇报给C，调整为实线汇报给B，且虚线汇报给C。同时B实线汇报给C。  
原先有每周一次跟C当面沟通的会议，在此基础上增加了每周一次跟B当面沟通的会议。  
问题来了，这两个会议怎么开？是周一先跟C开会，汇报进展，请示决策，然后周二再跟B开会，汇报进展，请示决策。如果意见不一致，我周三再去找C开会，请示决策？还是先跟B开会，再跟C开会？  
解决方案很简单，我直接去问C，这会怎么开？C直接说，那就一起开，有事情三人当面讨论，节省时间。我同步信息给B，B也欣然接受。  

**B和C都是好领导，他们敢于开诚布公的就事论事，哪怕讨论过程激烈，决策总是清晰明了，不让A为难。**  

### B的故事

我是B，带领一个技术开发小组，直接上级C是一位刚空降入职不久的行业技术大牛。团队中有一个资深开发人员A。  
当时公司有一项审查制度 “Gate Review”，由公司各团队的资深专家组成评审团，内容分为产品和技术两方面，一共有4关，产品方面分别是：立项，MVP原型，产品内测阶段，产品公测阶段。技术方面对应是：技术选型概要，技术方案设计，关键技术指标数据，线上运维多维度数据。任何一关没通过，被驳回，都要返工优化2-3个月，再次提交审核。  
大概是在Gate 1～2期间，ABC 3人开会讨论某一功能的技术方案选型，关键分歧在于方案X和Y无法达成一致。AB提出的是X方案，C希望是Y方案。A是急性子，当场跟C吵起来，C是行业技术大牛兼大领导，既权威且有理有据。双方争执不休。  
作为B，我提出这次会议先搁置这一个争议点，把其他议题讨论完，下一次再议。  
事后我思考这件事，方案X和Y均能实现该功能，但分歧点在于：

+ X方案是我司已有的针对该功能的公共框架方案，稳定成熟，有专门团队维护，可直接接入，节省研发成本和时间，只是并非行业通用方案，也未开源，知名度低。C刚刚空降入职不久，不了解该方案。
+ Y方案是行业通用方案，C是这方面权威人士，他选择Y方案合情合理，但实现Y方案需要成本，稳定性打磨也需要时间，同时很可能无法通过 “Gate Review”，大概率会被挑战，为什么不使用我司已有的X方案？为什么要自造轮子？有没有优劣势和相关数据分析证明？

所以我做出了以下决策：

+ 我跟A说，我们就按X方案执行，有问题我背锅。
+ 我跟C说，我们按Y方案执行了，同时微调改写了部分局部实现，balabala。

同时我给团队成员以下解释：

+ 说清楚分歧点根因。
+ 为产品负责是最重要的。产品能够早日发布上线，是最重要的。稳定快速实现该功能是最重要的。方案X稳定可靠快速，可以让我们的产品和技术审查顺利通过，保障后续进度顺畅。
+ 如果选择方案Y，耗时多，万一审查被驳回，返工X方案，产品发布延期，辛苦的还是我们自己。
+ C很忙，只要该功能的实现没问题，后续没人会去翻代码看细节实现究竟是X还是Y。
+ C目前不熟悉不信赖方案X，我们无法短时间内说服他。但是他同时也是审查委员会成员，会经常参与其他项目的审查，必定频繁看到其他团队产品项目的技术选型，过段时间自然就理解了。
+ 如果有任何问题，要追究责任，我来扛。

后来这件事就过去了，该功能实现正常，方案X运行良好，C也再没关注过这一块。

### C的故事

我是C，我希望A和B能够按我的意见执行，即使有分歧，大家可以快速讨论解决，最终上下一心，其利断金。  
在《TLDP 006：一对一沟通》中讲过一种，大团队多层级的变通邮件周报沟通方式，目的就是发现潜在分歧，目标和方法不一致的问题，从而快速解决。  
遇到过多次A或B对某些事情有不同看法，这时就要快速当面沟通，解决分歧，不要让大家难做。  

### 关键前提

三个故事三个角度，但是有两个关键因素，或者叫做前提条件，如果不满足条件，那么可能会适得其反。  

**建设群体的信任感**  
**建设个体的人设一致性**  

群体信任感，很容易理解，无论你处于哪种角色，人与人之间如果没有信任感，那任何争议，分歧和决策，都会变质，演变成办公室政治。  
关于如何建设信任感，明天继续讲故事。  

人设一致性，来自《奇葩说》某一集片尾，马东给职场新人的一个建议：
> 人设要一致，你可以是勤快的，也可以是懒惰的，但是你不能差异化对待。例如你习惯上班迟到，这没关系，大家慢慢会习惯接受你，或者压根不接受你，会直接提出来让你改。  
但是你不能人设不一致，比如你跟我开会总是迟到，你跟他开会就准时，那你这人就有问题了。

所以在加入一个新团队，或者跟一位新同事或上级合作时，一开始就尽量保持简单沟通方式，有话直说，有事说事。这样以后相处都会简单下去。  
如果你之前习惯了委婉曲折，某一天突然不想再藏着掖着，针砭时弊，就事论事。这时候恐怕大家的第一反应不会是你期望的。  

世界已经很复杂了，还是活得简单一点比较开心吧。
