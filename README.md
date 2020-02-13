# pyhk
swig hk to python
只支持linux使用
通过swig的方法，把c++接口封装为python可使用的接口。
目前需要注意的是：swig封装的接口里面使用多线程，会不会依然阻塞python的运行。
使用的海康_linux开发文档版本：CH-HCNetSDKV6.1.4.7_build20191226_Linux64

#开发计划：
1、完成常用接口的封装  达到可用状态。
2、完成辅助函数的封装（主要是内存操作和从stream获取结构体的一些操作）。
3、优化接口。简化部分接口的操作方式和流程。
