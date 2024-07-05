# Linux环境操作

## 一、Linux常用快捷键介绍 

* 1、按Tab键 		【补齐命令】
* 2、按Ctrl+A键     【光标移动到最前面】
* 3、按Ctrl+E键      【光标移动到最后】
* 4、按Ctrl+U键     【清空档期那输入的内容】
* 5、上/下键           【切换之前输入的命令】

## 二、Linux文件操作

>  Linux系统中所见即文件（哪怕驱动也是文件本质） , bin 目录一些执行文件，home 目录用户， lib 目录常用的 so ，opt 和 proc 是与进程相关的。 

* cd DerryAll 【进入到DerryAll目录】
* cd..               【返回到上一个目录】
* cd.                【啥也没有做，就在当前目录 .代表当前目录】
* ls                  【当前文件夹下面所有文件/文件夹等】
* ls -all            【当前文件夹下面的所有文件/文件夹等 的详细显示】
* ls -lh             【当前文件夹羡慕的所有问键/文件夹等 的大小详细显示】
* pwd              【当前所在的目录路径】
* cd /               【回到根目录】
* ./date           【执行date可执行文件】注意是在/bin目录下
* mkdir New1 【创建New1名称的文件夹】
* touch file1.txt 【创建file1名称的文件】
* -rw-r--r--    1                  root        root      0  Mar   27 14:12   fiel1.txt

​       文件权限  硬件连接数    所有者  所属组  大小  时间                 名称

* rm -rf file1.txt 【删除file1文件】
* ls -R                【递归当前夹到文件，优点像树形结构输出的效果】
* rw-rw-r--：- 文件类型，rw- 所有者可读可写可执行，rw- 同一组用户可读可写可执行，r-- 其他人可读 可写可执行 
*  Linux文件类型： 
  * “-” 【普通文件】 
  * d 【文件夹】
  *  l 【软链接，硬链接软件接：相当于 windows 的快捷图标】 
  * c 【字符设备文件】 
  * b 【块设备文件】 
  * p 【管道文件】 
  * s 【套接字】 
*  rmdir 文件夹 【只能清空空目录文件夹，如果文件夹里面有内容，就无法删除】 
*  rm -r 文件夹 【递归清空目录文件夹】 
*  rm hello.c 【删除文件】 
*  cp hello.c 文件夹 【拷贝文件 到 文件夹里面去】 



## 三 、Linux文件读取操作 

* cat file01.txt 【快速查看文件内容】 

*  vim file01.txt 【使用vim编辑器查看文件内容】 
*  tac file01.txt 【倒着快速查看文件内容】 
*  more file01.txt 【每次只查看一页，回车查看下一页】 
*  less file01.txt 【与 more 不同地方是, 回车是下一行，空格翻一页，没有百分百，退出 ctrl + c 不行， ESC之后 :q 】 
*  head -2 file01.txt 【查看前面2行内容】 
* tail -3 file01.txt 【查看后面2行内容】 

## 四、 Linux中的用户与用户组 

* 【#】代表 root权限 
* 【$】代表普通用户 sudo su root 【从普通用户 切换到 root用户，注意：要输入密码 是看不见的】 
* exit 【 退出 root 用户，到普通用户】
*  whoami 【查看当前用户】 
* chmod 777 修改用户文件权限

>    【注意：新建的文件默认是不能执行，我们需要修改用户文件权限】 
>
> 【默认情况下 -rw-r--r-- 1 root root 323 Mar 27 15:53 file01.txt】 Linux工作中，基本上就直接写 chmod 777 file01.txt 授予权限即可 却不关系777是什么意思 
>
> chmod 777 file01.txt 【执行完后 -rwxrwxrwx 1 root root 323 Mar 27 15:53 file01.txt】三组都 可读可写可执行
>
>  “-” 文件 
>
> “d” 文件夹 目录 
>
> rwx【当前自身所在用户的权限】 
>
> rwx【代表同组的权限】 
>
> rwx【代表其他用户的权限】 
> 









