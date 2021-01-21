---
layout: post
title: "Tech：微信公众号格式化编辑器"
description: "wxformat WeChat-Format lyricat"
image: ../static/chenqi.jpg
author: ChenQi
category: Technology
---

众所周知，微信公众号平台自带的文章编辑器体验不佳，排版诡异。除了图片和外链的限制规则之外，始终无法优雅的处理好 markdown 格式渲染。

之前为此针对性调整了两项：[《GitHub Pages + Jekyll + Mermaid》](../github-pages-jekyll-mermaid-async/)，[《Markdown表格自适应布局》](../scrollable-markdown-table/)。但是每次写完文章，复制粘贴至微信公众号平台发表时，依然需要执行一些样式微调和预览确认的琐碎往复操作。

直到发现了这个排版神器。（根据 Code Commit 记录，是2019.03实现并开源的，所以是我孤陋寡闻了。）

### [WeChat Format](https://lab.lyric.im/wxformat)

直接引用[少数派](https://sspai.com/)的文章：[《做表格、排版公众号……这7个工具让 Markdown 写作更容易》](https://sspai.com/post/54103)。

> WeChat Format 是一个开源的、专为微信公众号排版准备的在线 Markdown 编辑器。相信大家如果有微信公众号排版使用的经验，就一定体验过糟糕的微信公众号后台「所见即所得」编辑器。在秀米、135 等专门为微信公众号排版而生的样式编辑器霸道横行的时代，如果我们能利用 Markdown 直接排版微信公众号，那岂不是又方便又舒服。

WeChat Format 真是这个混乱微信排版市场里的一股清流！

完整使用说明，详见作者公众号文章[《花三小时写这个工具，只为一分钟拯救公众号排版》](https://mp.weixin.qq.com/s/pn0LzyfgUj6rGUfVHUksjg)。

从 2020.10.18 [《国际电信联盟的历史》](../ITU's-History-1/)这一篇开始，我都是直接复制粘贴 markdown 内容到 wxformat 在线编辑器，再一键复制粘贴至微信公众号平台，基本无需更改什么，最终排版渲染效果良好。

### [Lyric Wai](https://lyric.im/)

该工具的作者似乎是一个很有趣的人。个人博客网站内容丰富，GitHub 绿墙生机盎然。个人微信公众号介绍：

> iamlyricw 是一名产品经理、Full Cycle 程序技师、独立开发者。 曾在 WeChat Team 坑过上亿人，也曾经创业从〇到壹。
