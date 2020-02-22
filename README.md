# pyhk
swig hk to python
通过swig封装海康威视的sdk到python，实现python的调用。HIKVISION
只支持linux使用
通过swig的方法，把c++接口封装为python可使用的接口。
目前需要注意的是：swig封装的接口里面使用多线程，会不会依然阻塞python的运行。
使用的海康_linux开发文档版本：CH-HCNetSDKV6.1.4.7_build20191226_Linux64

# 开发计划：
1、完成常用接口的封装  达到可用状态。
2、完成辅助函数的封装（主要是内存操作和从stream获取结构体的一些操作）。
3、优化接口。简化部分接口的操作方式和流程。
4、完成swig测试实例和入门资料（看情况）
5、完成常用海康开发文档的代码的python实现（看情况）

# 另：
征集测试合作伙伴，最好是有大神指点。我现在对swig的使用还是处于原始状态，pyhk.i的结构太乱而且完全不知道如何把里面的代码拆分到多个子文件。

# 模块规划
暂时大的规划是这个结构

```
├── pyhk
|   ├── struct  #存放各结构体
|   ├── callback #存放回调函数模板，源方法里面所有涉及到回调函数的函数，全部会被封装为加上_warper结尾的函数。
|   ├── stl #存放需要使用的stl容器
|   ├── HCNetSDK #存放已经封装的海康接口，目前只考虑HCNetSDK.h头文件的东西
|   ├── tools #存放一些其他可能使用的工具
|   ├── test #存放一些swig的测试内容
|   └── pointer #存放需要封装的指针，比如int *等内置类型指针
```

工作量真是大得惊人，我会优先封装我需要的接口，回调函数的接口会根据需求进行封装，如果有需要的，建议直接在issue里面提。
另，现在有部分嵌套结构体未处理，尚不确定是否为swig自动处理而不用我再修改.
＃v2020022
验证swig编译的文件，确认其可行性。完成登录测试
