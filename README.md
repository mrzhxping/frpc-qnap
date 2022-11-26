# 威联通 Frp 客户端

### 介绍

Package frpc into qnap application.

为威联通Nas打包了一下 frp的客户端，方便大家安装

默认安装路径：`/share/CACHEDEV1_DATA/.qpkg/frpc/`  
默认配置文件路径：`/share/CACHEDEV1_DATA/.qpkg/frpc/frpc.ini`


安装后需要修改 配置文件 才能正常使用。
具体配置方法见 [frp官方文档](https://github.com/fatedier/frp)

### 安装使用

1、下载安装包：直接在Releases页面下载安装包   
2、安装：在威联通App Center 选择手动安装 即可   
3、安装完成后，先停止应用，然后手动修改配置文件内容为自己配置   
4、重新启动 尝试链接成功即可  

### 其他说明

1、基于威联通[QDK 2.13](https://github.com/qnap-dev/QDK)，[QDK官方文档](https://cheng-yuan-hong.gitbook.io/qdk-quick-start-guide/)  
2、仅封装打包Frp客户端,未对Frpc做任何改动，[frp官网](https://github.com/fatedier/frp)  

### 开发 

1、安装QDK，使其可以正常使用qbuild打包    
2、拉取本项目放置在nas的任意目录下  
3、进入本项目根目录下使用`qbuild`命令打包  
4、打包成功后的文件放置在本项目根路径下的`build`目录下



