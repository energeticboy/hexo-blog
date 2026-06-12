---
title: 解决hexo图片不显示问题
date: 2025-06-18 14:23:25
tags:
cover: false
description: 通过配置hexo的post_asset_folder选项和Markdown嵌入图片功能，解决Hexo博客中图片不显示的问题。
---

## 注意
gitee图床已经停止服务，建议使用其他图床服务。
推荐smms.app图床免费5g空间

## 第一步设置hexo配置文件
将 _config.yml 文件中的 post_asset_folder 选项设为 true
该操作的目的就是在使用hexo new xxx指令新建md文档博文时，在相同路径下同步创建一个xxx文件夹，而xxx文件夹就是用来存放新建md文档里的图片的



![image-20250618145758056](解决hexo图片不显示问题/image-20250618145758056.png)

## 第二步设置配置 Markdown 嵌入图片

```
_config.yml
post_asset_folder: true
marked:
  prependRoot: true
  postAsset: true
```

![image-20250618150919698](解决hexo图片不显示问题/image-20250618150919698.png)





## 第三步设置typroa使用路径

![image-20250618150950772](解决hexo图片不显示问题/image-20250618150950772.png)



## 第四步设置vscode中markdown复制路径（可选）

![image-20250618150625453](解决hexo图片不显示问题/image-20250618150625453.png)


## 免费图床推荐
参考
https://sspai.com/post/98911



官方文档：[资源文件夹 | Hexo](https://hexo.io/zh-cn/docs/asset-folders#使用-Markdown-嵌入图片)
