---
title: 修改butterfly透明度
date: 2025-06-15 14:49:35
tags: butterfly, hexo, 美化
cover: false
description: 通过修改CSS文件和配置文件来调整Hexo Butterfly主题的透明度(暗黑模式下可正常显示。
---
# 修改butterfly透明度
## 新建transparent.css
在`source/css/`目录下新建一个名为`transparent.css`的文件，并添加以下内容：

```css

/* 文章页背景 */
.layout_post>#post {
    /* 以下代表透明度为0.5 可以自行修改*/
    background: rgba(255, 255, 255, .5);
}

/* 所有页面背景 */
#aside_content .card-widget,
#recent-posts>.recent-post-item,
.layout_page>div:first-child:not(.recent-posts),
.layout_post>#page,
.layout_post>#post,
.read-mode .layout_post>#post {
    /* 以下代表透明度为0.7 */
    background: rgba(255, 255, 255, .7);
}

/*侧边卡片的透明度 */
:root {
    --card-bg: rgba(255, 255, 255, 0.7) !important;
}

/* 暗色模式下的卡片透明度 */
[data-theme='dark'] {
    --card-bg: rgba(18, 18, 18, 0.7) !important;
}

/* 页脚透明 */
#footer {
    /* 以下代表透明度为0.1*/
    background: rgba(255, 255, 255, .1);
}

```
## 修改_config.butterfly.yml
在inject部分添加以下内容：

```yaml
inject:
  head:
    - '<link rel="stylesheet" href="/css/transparent.css">'
```
## 清除缓存
在终端中运行以下命令以清除缓存并重新生成站点：

```bash
hexo clean
hexo generate
```
## 启动服务
```bash
hexo server
```
现在，访问你的博客，你应该可以看到butterfly主题的透明度已经被修改了。