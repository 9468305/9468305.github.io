---
layout: post
title: "Tech：Markdown表格自适应布局"
description: "Jekyll Kramdown Markdown Table Scrollable CSS Layout"
image: https://kramdown.gettalong.org/overview.png
author: ChenQi
category: Technology
---

周末在家继续修复个人博客网站的小问题。

Markdown 表格语法的最终转译产物是 HTML `<table>` 标签。当内容元素众多时，表格宽高随之变化，为了避免破坏页面整体的美观，需要使用水平或垂直滚动布局。

### Table

```html
<div style="overflow-x:auto;">
  <table>
    ...
  </table>
</div>
```

### Jekyll

Jekyll Markdown 解释器：

+ Kramdown （默认）
+ CommonMark
+ Redcarpet
+ 自定义其他解释器。

每种解释器对 Markdown 标准的处理存在差异，同时均额外扩充一些自己的特性。

### Kramdown

使用 `<div>` 标签包裹 Markdown 表格内容，并且必须在上下间隔两个空行。

```html
<div class="scrollable-table-wrapper" markdown="block">

| Header 1 | header 2 |
|----------|----------|
| Data 1-1 | Data 1-2 |
| Data 2-1 | Data 2-2 |

{:.table-scrollable}
</div>
```

### SCSS

实现相关 `CSS` 定义。  
感谢 `Daniel Weibel` 和他的 `weibeld.net` 个人网站。

```scss
// https://github.com/weibeld/weibeld-notes/blob/master/_sass/_layout.scss

// Shadows
$shadow-large: 3px 3px 3px rgba(0, 0, 0, 0.2);
$shadow-small: 2px 2px 2px rgba(0, 0, 0, 0.2);

// Table with alternating row colours, and no scrolling support. If wider than
// the content, the table takes 100% width, and the content inside <td> wraps.
.table-normal {
  margin: 0 auto;
  border-collapse: collapse;
  box-shadow: $shadow-large;
  td, th {
    padding: 0.2rem 0.75rem;
    &:first-child { padding-left: 0.5rem; }
    &:last-child { padding-right: 0.5rem; }
  }
  th {
    padding-top: 0.3rem;
    padding-bottom: 0.3rem;
  }
}

.table-telegram-cli {
  table-layout: fixed;
  td:nth-child(1) {
    width: 50%;
  }
  td:nth-child(2) {
    width: 50%;
  }
}

// Table with horizontal scrolling support. Table is horizontally centered if
// less wide than content, and taked 100% width and has scrollbars otherwise.
// Caveats: no shadow can be applied, no line will break inside a <td>
.scrollable-table-wrapper {
  overflow-x: auto;
}
.table-scrollable {
  @extend .table-normal;
  white-space: nowrap;
  box-shadow: none;
}
```

### Example

2020.06.23 [《投资：2020H1 OTA 大盘回顾》](../ota-stock-2020-h1/)，其中的表格布局优化。

<div class="scrollable-table-wrapper" markdown="block">

| 公司 | 当前市值(亿美元) | 最低价格 | 最低日期 | 最高价格  | 最高日期 | 06.23价格 | 最大价差   | 最低至今价差 |
|:---|---:|---:|:----|---:|:---|---:|---:|---:|
| HK.3690.美团点评 | 1335.32 | 70.100 | 2020-03-19 | 176.800 | 2020-06-23 | 176.800 | 152.21% | 152.21% |
| US.BKNG.Booking | 668.61 | 1107.285 | 2020-03-23 | 2094.000 | 2020-01-10 | 1633.520 | -47.12% | 47.52% |
| US.TCOM.携程网 | 155.92 | 20.100 | 2020-03-18 | 38.950 | 2020-01-17 | 26.290 | -48.40% | 30.80% |
| US.EXPE.Expedia | 117.18 | 40.760 | 2020-03-18 | 124.400 | 2020-02-14 | 83.120 | -67.23% | 103.93% |
| US.HTHT.华住 | 107.42 | 25.010 | 2020-03-19 | 41.169 | 2020-01-02 | 36.600 | -39.25% | 46.34% |
| HK.00780.同程艺龙 | 38.51 | 8.740 | 2020-03-19 | 14.980 | 2020-06-08 | 13.960 | 71.40% | 59.73% |
| US.MMYT.MakeMyTrip | 17.53 | 10.000 | 2020-03-19 | 30.130 | 2020-02-12 | 17.020 | -66.81% | 70.20% |

{:.table-scrollable}
</div>

### Reference

+ [Jekyll Markdown Options](https://jekyllrb.com/docs/configuration/markdown/)
+ [Kramdown Options](https://kramdown.gettalong.org/options.html)
+ [Daniel Weibel](https://github.com/weibeld)
+ [weibeld.net Source](https://github.com/weibeld/weibeld-notes)
