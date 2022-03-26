## 我的bash脚本

简洁干净,速度快,只提供日常用的基础功能,根据需求增加,没有多余功能

加入自定义样式(包含git分支,时间,错误码,shell)
![](https://cdn.jsdelivr.net/gh/ayuayue/cdn/wolai/202201231631522.png)

### 自定义别名脚本放在 alias 目录下

### 插件或函数放在 plugins 目录下

### 使用时,将 alias plugins 目录下的所有文件链接到 enabled 目录下
### env 目录下的 my.env.bash 为自己添加的环境变量，会把改文件添加进 bashrc 中
#### 开启功能

|名称|说明|
|-|-|
|jump|目录跳转|
|hstr|代替系统原历史命令|
|alias|自定义别名,docker,docker-compose等|
|theme|自定义profile主题 地址 https://ezprompt.net/|
|env|自定义环境变量 |

由于开启插件导致启动变慢或者刷新配置文件变慢,所以将plugin目录下的插件不在自动加载,可以进入改目录手动安装,直接执行脚本即可

由于主题导致与ssh工具的颜色或某些功能冲突,默认不加载到 bashrc中,并去除bash_prompt的默认颜色