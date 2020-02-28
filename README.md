<<<<<<< HEAD
# v 0.1 更新记录
目前已经完成如下接口：

```c++
 LONG  NET_DVR_Login_V30(char *sDVRIP, WORD wDVRPort, char *sUserName, char *sPassword, NET_DVR_DEVICEINFO_V30 * lpDeviceInfo);
 BOOL  NET_DVR_Logout(LONG lUserID);
 BOOL  NET_DVR_Init();
 BOOL  NET_DVR_Cleanup();
 BOOL  NET_DVR_SetConnectTime(DWORD dwWaitTime = 3000, DWORD dwTryTimes = 3);
 BOOL  NET_DVR_SetReconnect(DWORD dwInterval = 30000, BOOL bEnableRecon = TRUE);
 LONG  NET_DVR_SetupAlarmChan_V41(LONG lUserID, NET_DVR_SETUPALARM_PARAM * lpSetupParam);
 DWORD  NET_DVR_GetLastError();

 回调函数相关：
 ```
 # 文件结构
    hk_struct 存放需要使用的结构体
    hk_fun 存放封装好的函数
    hk_tools 存放需要使用到的一些函数工具
    hk_hk_decorator 存放注册回调函数的装饰器

 # 使用方式：
 下载对应的pyhk_win64或pyhk_linux64
 将其拷贝到自己的项目即可，接口与海康sdk接口基本相同，使用说明请查看海康sdk。
# 注意：
所有的使用回调函数的接口均需要重新包装，所以回调函数名字为原名字的小写，需要注册的回调函数请使用装饰器进行装饰，然后就可以注册了。
注意，如果传递的结构体涉及到指针，则无法使用hk_struct里面的结构体，这个与swig文档所述不符，只后会将hk_struct以其他方式生成。
示例代码如下：

```python
from pyhk import hk_fun,hk_struct,hk_decorator,hk_tool
import time
alarm_type = {"0": "信号量报警", "1": "硬盘满", "2": "信号丢失", "3": "移动侦测", "4": "硬盘未格式化",
              "5": "读写硬盘出错", "6": "遮挡报警", "7": "制式不匹配", "8": "非法访问", "9": "视频信号异常",
              "10": "录像/抓图异常", "11": "智能场景变化", "12": "阵列异常", "13": "前端/录像分辨率不匹配", "15": "智能侦测",
              "16": "POE供电异常", "17": "闪光灯异常", "18": "磁盘满负荷异常报警", "19": "音频丢失",
              "23": "脉冲报警", "24": "人脸库硬盘异常", "25": "人脸库变更", "26": "人脸库图片变更 ",
              }
@hk_decorator.message_callback
def cb(lCommand: "LONG", pAlarmer: "NET_DVR_ALARMER *", pAlarmInfo: "char *", dwBufLen: "DWORD", pUser: "void *"):
    print("回调成功:",lCommand)
    if lCommand==0x4000:
        info=hk_struct.NET_DVR_ALARMINFO_V30()
        hk_tool.memmove(info,pAlarmInfo)
        print(alarm_type[str(info.dwAlarmType)])
def start(ip,port,username,pwd):
    hk_fun.NET_DVR_Init()
    info_struct=hk_struct.NET_DVR_DEVICEINFO_V30()
    lUserID=hk_fun.NET_DVR_Login_V30(ip,port,username,pwd,info_struct)
    if lUserID<0:
        print("登录失败")
        print("错误信息：",hk_fun.NET_DVR_GetLastError())
        hk_fun.NET_DVR_Cleanup()
        return 
    #设置监听
    lUserID_intp=hk_tool.intp()
    hk_tool.int2intp(lUserID,lUserID_intp)
    if not hk_fun.net_dvr_setdvrmessagecallback_v31(cb,lUserID_intp):
        print("设置失败:",hk_fun.NET_DVR_GetLastError())
        hk_fun.NET_DVR_Logout(lUserID)
        hk_fun.NET_DVR_Cleanup()
        return
    else:
        print("设置成功")
    #布防
    stru_alarm_param=hk_fun.NET_DVR_SETUPALARM_PARAM()
    stru_alarm_param.dwSize=hk_struct.sizeof_NET_DVR_SETUPALARM_PARAM
    stru_alarm_param.byDeployType=1
    stru_alarm_param.byLevel=1
    
    lHandle=hk_fun.NET_DVR_SetupAlarmChan_V41(lUserID,stru_alarm_param)
    if lHandle<0:#布防失败
        print("NET_DVR_SetupAlarmChan_V41 error, ", hk_fun.NET_DVR_GetLastError())
        hk_fun.NET_DVR_Logout(lUserID)
        hk_fun.NET_DVR_Cleanup()
        return
    else:
        print("布防成功")
    time.sleep(100)#这个时候可以尝试遮挡镜头实现监听
    hk_fun.NET_DVR_Logout(lUserID)
    hk_fun.NET_DVR_Cleanup()
if __name__=="__main__":
    start( "192.168.10.35",8000,"admin","admin1234")

```
=======
# pyhk
swig hk to python
只支持linux使用
通过swig的方法，把c++接口封装为python可使用的接口。
目前需要注意的是：swig封装的接口里面使用多线程，会不会依然阻塞python的运行。
使用的海康_linux开发文档版本：CH-HCNetSDKV6.1.4.7_build20191226_Linux64

具体内容目前请查看各分支。
等疫情过后拿到设备测试通过之后才会合并到master
>>>>>>> cd769022f6ec98b41226711e2aaa37890b90e468
