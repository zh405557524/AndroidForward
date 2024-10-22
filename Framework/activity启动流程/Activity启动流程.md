### Android 系统启动流程

#### 一、整体流程分析

##### 1、启动Bootloader

*  加载数据结构
* 初始化硬件设备(CPU、内存)
* 装载启动Linux系统。
  * boot.img印像装载进内存
  * 初始化系统。
* 启动init进程

##### 2、启动init进程

* 加载android系统
* 创建守护进程
* 启动MediaServicer
* 启动FurfaceFinger
* 启动ServerManager
* fork zygeto进程。

##### 3、fork zygeto进程 

* 启动android虚拟机
* 注册本地jni方法
* 预装android系统资源、加载java类。
* fork SystemService进程。
* 启动结束后变成守护进程，启动的app进程都是由zygeto fork出来

##### 4、fork  SystemServicer进程

* 1、加载动态库
* 2、创建SystemServierManager
* 3、初始化Context系统上下文
* 4、启动引导服务
  * AMS、ATMS、WMS、PKMS。
* 4、启动核心服务
  * 电量
* 5、启动其他服务
  * AMS启动->AMS.SystemReady().
* 6、启动Looper.loop()

##### 5、SystemReady()

* 启动SystemUI
* 发送Intent().启动launcher界面。

​	