---
layout: post
title: "技术：单元测试的成本和收益"
author: ChenQi
category: Technology
---

兄弟团队的问题：

> 由于各种原因，我们目前还没真正写过单元测试，想了解要不要写，如何写，成本和收益。总感觉浪费时间，但是看网络舆论，以及各种开发工具脚手架构建的项目都自带了单元测试的功能，所以想从这方面入手。

嗯，仔细想想，这确实是个问题。  
一般研发流程成熟的团队，代码审查，单元测试，自动化测试，都是天经地义习以为常的事情，或者说是一件政治正确的事情。即使有人内心不认同，也羞于表达，不敢大声说反对。流程的推动，只需自上而下一声号令，再配上一位手持长鞭的叶老师，自然水到渠成。  

但是实际效果呢？  
确实有很多好的案例和数据，但是也有不少形似神异的现象。  
依然有很多项目先开发上线，再补充测试覆盖率数据。  
生产线上出问题了，追查根因代码，恰恰处于单元测试未覆盖范围。  
测试覆盖率数据很好看，但是打开仓库看细节，可能不是你想的那回事。  

究其原因大概是因为，写单元测试这件事，总归不是一件直观感受上立即反馈令人愉悦的点心。内心认同，但执行枯燥。  
代码质量和单元测试的关系，大概等同健康和运动的关系。年轻的时候，多折腾几次没关系。等年纪大了，踩了坑摔了跤扭了腰，才愈发重视运动。而运动呢，贵在坚持，不能指望锻炼两三天就立竿见影的身强力壮。  

就像题图的美女，身材好不好，脱了才知道。一身赘肉的家伙只能努力裹紧衣服。  

网上水文太多（其实这篇也是），不过还是翻到几篇佳作，记录一下。

[《Unit Testing – Why not?》](https://scratchpad101.com/2014/08/13/unit-testing-why-not/)  
By Kapil Viren Ahuja

[《(Unit Testing) – Cost vs. Benefit》](https://scratchpad101.com/2014/08/14/unit-testing-cost-vs-benefit/)  
By Kapil Viren Ahuja

[《Why Most Unit Testing is Waste》](https://rbcs-us.com/documents/Why-Most-Unit-Testing-is-Waste.pdf)  
By James O Coplien

[《TDD is dead. Long live testing.》](https://dhh.dk/2014/tdd-is-dead-long-live-testing.html)  
By David Heinemeier Hansson  
