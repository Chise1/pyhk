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