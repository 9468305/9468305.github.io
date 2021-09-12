---
layout: post
title: "Tech：AdoptOpenJDK Adoptium Temurin"
description: "AdoptOpenJDK Adoptium Temurin Java JDK JRE HomeBrew"
image: ../static/chenqi.jpg
author: ChenQi
category: Technology
---

最近升级工作电脑，从iMac 2017款换成MacBook Pro 2020款，macOS从Catalina 10.15换成Big Sur 11.5。新版macOS默认不再内置JRE/JDK，需要用户自装，刚巧OpenJDK社区又发生了一些重大变化。

2019年4月16日，Oracle发布了JDK 8u211和8u212版本更新。与以往不同的是，新版License区分了免费私用与付费商用两种授权方式。如果继续在商业生产环境使用8u211/8u212及后续版本，就必须给Oracle付费。

## [AdoptOpenJDK](https://adoptopenjdk.net/)

macOS卸载Oracle JDK之后，安装AdoptOpenJDK非常简单。

```shell
brew install --cask adoptopenjdk
```

### 2020.06.19

The AdoptOpenJDK Technical Steering Committee (TSC) 宣布将加入（迁移至）Eclipse 基金会。新项目名为 Eclipse Adoptium，意思是 “AdoptOpenJDK” 和拉丁后缀 “-ium” 的复合词。

### 2020.12.21

经过半年的筹备，TSC宣布第一批迁移Adoptium项目提案已准备好接受社区审查。AdoptOpenJDK 项目拆分为 Eclipse Adoptium Top Level Project下的多个子项目：

+ [Eclipse AQAvit](https://blog.adoptopenjdk.net/2019/07/the-first-drop-introducing-adoptopenjdk-quality-assurance-aqa-v1-0/)  
AQA (AdoptOpenJDK Quality Assurance)，围绕企业级质量保障的测试套件。
+ Eclipse Temurin  
即狭义的新版JDK，命名有两层含义，一是`runtime`的变位词，二是茶氨酸？一种类似于咖啡因的无成瘾性的安全的化合物。
+ [Eclipse Temurin Compliance](https://projects.eclipse.org/proposals/eclipse-temurin-compliance)  
Oracle Java SE TCK 兼容性合规审查。

![Caffeine vs Theacrine](https://commons.wikimedia.org/wiki/File:Caffeine_vs_Theacrine.png)

### 2021.03.06

成立工作组运作，成员有阿里云、Azul、华为、Karakun、微软、红帽、IBM、iJUG、ManageCat、New Relic。技术资产迁移，知识产权审查，关键资产迁移，新品牌建设。

### 2021.08.02

[《Good-bye AdoptOpenJDK. Hello Adoptium!》](https://blog.adoptopenjdk.net/2021/08/goodbye-adoptopenjdk-hello-adoptium/)  
[《Adoptium Celebrates First Release》](https://blog.adoptium.net/2021/08/adoptium-celebrates-first-release/)  
迁移完成！Adoptium.net 正式启用。  
过渡期间，AdoptOpenJDK 网站，API，版本存档下载，等等将保留运营一段时间。  
以后其将被称为“由 Adoptium 社区生产的 Eclipse Temurin 运行时”。

```text
When speaking of our Java SE delivery, we prefer to say the Eclipse Temurin runtime produced by the Adoptium community.
```

Eclipse基金会也已获得Oracle Java SE TCK许可，该许可用于确定与Java规范的兼容性。Temurin 二进制文件现在不仅将通过 AQAvit 测试，还将通过 Java SE TCK审核。

Adoptium 仅提供 Hotspot builds，而 OpenJ9 builds 改由 [IBM Semeru Runtimes](https://ibm.com/semeru-runtimes) 提供。

Swagger UI API 检索，新 `https://api.adoptium.net/` 替代旧 `https://api.adoptopenjdk.net/`。

Temurin 8、Temurin 11、Temurin 16 的首个版本现在可以从官网下载或通过[HomeBrew](https://formulae.brew.sh/cask/temurin)安装。

```shell
brew install --cask temurin
```

### 各种内嵌版本

其实日常使用不安装JDK也可以，由于Oracle的频繁折腾，很多开发工具安装包都使用内置固定版本JDK的方式。  
例如，Android Studio Arctic Fox 2020.3 和 IntelliJ IDEA 2021.2 均内置 JDK 11的某个发行版。  
配置 `JAVA_HOME` 环境变量指向某一内嵌版JDK安装路径，日常本地运行也基本够用了。
