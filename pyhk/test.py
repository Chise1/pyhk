from pyhk import *
# ip = str('192.168.1.64')  #摄像头IP地址，要和本机IP在同一局域网
# name = str('admin')       #管理员用户名
# pw = str('12345678')      #管理员密码
# pyhk.init(ip, name, pw)
# x=pyhk.NET_DVR_TIME()
# pyhk.test(x)
# print(x.dwHour)
NET_DVR_Init()
NET_DVR_SetConnectTime(2000,1)
NET_DVR_SetReconnect(10000,True)
struDeviceInfo=NET_DVR_DEVICEINFO_V30()
lUserID=NET_DVR_Login_V30("192.168.2.31",8000,"admin","ADMIN1234",struDeviceInfo)
if lUserID<0:
    print("Login error :",NET_DVR_GetLastError())
    NET_DVR_Cleanup()
class cb(MSGCallBackOp):
    def MSGCallBack(lCommand,pAlarmer,pAlarmInfo,dwBufLen,pUser):
        print("调用成功")
        with open("log.txt",'w+')as f:
            f.write("调用成功")
    def __init__(self):
        MSGCallBackOp.__init__(self)
handler=cb()
NET_DVR_SetDVRMessageCallBack_V30_wrapper(handler,NULL)
import time
time.sleep(5000)
NET_DVR_Logout(lUserID)
NET_DVR_Cleanup()
