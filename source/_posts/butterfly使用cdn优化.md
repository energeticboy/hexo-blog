---
title: butterfly使用cdn优化
date: 2025-06-19 12:43:30
tags: butterfly, hexo, 优化
cover: false
description: 使用CDN加速Hexo Butterfly主题的资源加载，提高网站访问速度。
---

## hexo+butterfly主题配置cdn加速

> 版本

```
hexo@7.3.0
hexo-theme-butterfly@5.2.2
```



### 首先设置_config.butterfly.yml文件中cdn选项

配置`third_part_provider:`为`flase`，然后必须设置`custom_format`

> 配置cdn注意

```
格式为：网址+${cdnjs_name}/${version}/${min_cdnjs_file}
可以先访问下官网看下那个快选哪个
https://cdn.staticfile.org/${cdnjs_name}/${version}/${min_cdnjs_file}
https://cdn.bootcdn.net/ajax/libs/${cdnjs_name}/${version}/${min_cdnjs_file}
```

具体可查看官网[Butterfly 文檔(三) 主題配置 | Butterfly](https://butterfly.js.org/posts/4aa8abbe/)

![image-20250619123008800](https://s2.loli.net/2025/06/19/jJC2qTeOpZAW1bg.png)

配置好后执行`npx hexo g&&npx hexo s`重新加载界面即可应用。

### 配置Option选项（可选）

打开网页F12看是否有爆红资源未加载。有的话可以单独配置该资源

比如我这里使用了字节的cdn加速但是https://cdn.bytedance.com/font-awesome/6.6.0/css/all.min.css依然加载失败。

此时可以配置option单独设置

![image-20250619123909088](https://s2.loli.net/2025/06/19/jDRWFO5th9y8bSo.png)



一下是我使用的一些配置项

```yaml
fontawesome: https://npm.elemecdn.com/@fortawesome/fontawesome-free@6.2.1/css/all.min.css
main: https://cdn.staticfile.org/hexo-theme-butterfly/4.9.0/js/main.min.js
```

更多配置项可参考：[Butterfly CDN链接更改指南，替换jsdelivr提升访问速度 | 张洪Heo](https://blog.zhheo.com/p/790087d9.html)

