# my git-bash config

使用 git-bash 代替windows中的环境变量,别名等.
1. alias 别名 配置在 aliases.sh
2. env 环境变量配置在 env.sh
3. 提示符信息配置在 git-prompt.sh

加入 fish  https://github.com/hongwenjun/tmux_for_windows

注意： 在 git-bash 中盘符是 / 开始的,c 盘路径是 /c/ ,如果目录中有空格或特殊字符,需要使用双引号包裹,必要情况下还要使用转义.

features:
       1. 别名：
              1. 加入 refreshhosts 别名,可以将 git/etc/hosts 内容覆盖到 windows 的 hosts 中
              2. 加入 proxy unproxy 快速设置终端代理
              3. 加入 vimenv 快速修改 env 文件
              4. 加入 vimhosts 快速编辑 hosts 
              5. 加入 refreshenv 快速刷新 env 
       2. 环境变量
              1. 加入Program Files,Program Files (x86) 目录的变量前缀





如果想把 git-bash 中的环境变量加入到 windows中,可以使用 echo $PATH , 复制所有输出

使用 sysdm.cpl 命令打开系统属性,将复制内容拷贝到环境变量的编辑文本中并保存 **注意提前把原来的复制拷贝一份,避免复制出错导致环境变量错误还要重新配置的情况**

​			
