---
layout: post
title: "Tech：linkinator"
description: "A super simple site crawler and broken link checker. Scurry around your site and find all those broken links."
image: ../static/chenqi.jpg
author: ChenQi
category: Technology
---

### 🐿 [linkinator](https://github.com/JustinBeckwith/linkinator)

A super simple site crawler and broken link checker.  
一键查死链的 API 库和 CLI 工具。

+ 快速扫描本地文件夹或远端站点。
+ 扫描所有包含链接的元素，不仅是 `<a href>` 。
+ 支持重定向，绝对路径，相对路径，等等全部。
+ 通过配置正则表达式，忽略指定链接。

### 安装

```sh
npm install linkinator
```

### 参数

+ --config 加载JSON配置文件
+ --concurrency 连接并发数，默认100。
+ --recurse, -r 相同根域名下的循环嵌套检测。
+ --skip, -s 正则表达式配置忽略URL。
+ --include, -i 正则表达式配置目标URL，`--skip` 的相反作用.
+ --format, -f 指定结果输出为 CSV 或 JSON 格式.
+ --silent 仅输出损坏的链接。
+ --timeout 超时（毫秒），默认为0（无超时）。
+ --help 帮助。

### 运行

```sh
$ npx linkinator https://www.ctrip.com --silent

https://www.ctrip.com/

  [500] http://ct.ctrip.com/crptravel/default/landing
  [503] http://www.beian.miit.gov.cn/
  [404] http://trains.ctrip.com/daishoudian/
  [404] http://trains.ctrip.com/yupiao/
  [404] http://trains.ctrip.com/huochezhan/
  [404] http://trains.ctrip.com/piaojia/
  [404] http://scjgj.sh.gov.cn/lz/licenseLink.do?method=licenceView&entyId=20110428175405415
  [404] http://trains.ctrip.com/TrainSchedule/
  [404] http://trains.ctrip.com/yushouqi/
  [500] https://liulanqi.baidu.com/
  [404] http://trains.ctrip.com/sitemap.html
  [0] https://fw.scjgj.sh.gov.cn/platform/survey/step1_phone
  [503] http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31010502002731
  [503] https://tuan.ctrip.com/group/city_xiamen/

ERROR: Detected 14 broken links. Scanned 378 links in 136.417 seconds.
```
