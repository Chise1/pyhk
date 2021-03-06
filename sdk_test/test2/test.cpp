
#include <stdio.h>
#include <iostream>
#include "string.h"
#include "HCNetSDK.h"
#include <unistd.h>
using namespace std;
void CALLBACK MessageCallback(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void *pUser)
{
    int i;
    NET_DVR_ALARMINFO struAlarmInfo;
    memcpy(&struAlarmInfo, pAlarmInfo, sizeof(NET_DVR_ALARMINFO));
    switch (lCommand)
    {
    case COMM_ALARM:
    {
        switch (struAlarmInfo.dwAlarmType)
        {
        case 3: //移动侦测报警
            for (i = 0; i < 16; i++)
            //#define MAX_CHANNUM
            {
                if (struAlarmInfo.dwChannel[i] == 1)
                {
                    //最大通道数64
                    cout<<"发生移动侦测报警的通道号"<<i+1<<endl;
                }
            }
            break;
        default:
            break;
        }
    }
    break;
    default:
        break;
    }
}
int main()
{
    //---------------------------------------
    // 初始化
    NET_DVR_Init();
    //设置连接时间与重连时间
    NET_DVR_SetConnectTime(2000, 1);
    NET_DVR_SetReconnect(10000, true);
    //---------------------------------------
    // 注册设备
    LONG lUserID;
    NET_DVR_DEVICEINFO_V30 struDeviceInfo;
    lUserID = NET_DVR_Login_V30("192.168.1.32", 8000, "admin", "admin1234", &struDeviceInfo);
    if (lUserID < 0)
    {
        printf("Login error, % d\n", NET_DVR_GetLastError());
        NET_DVR_Cleanup();
        return 0;
    }
    //设置报警回调函数
    NET_DVR_SetDVRMessageCallBack_V30(MessageCallback, NULL);
    //启用监听
    LONG lHandle;
    lHandle = NET_DVR_StartListen_V30(NULL, 7200, MessageCallback, NULL);
    if (lHandle < 0)
    {
        printf("NET_DVR_StartListen_V30 error, % d\n", NET_DVR_GetLastError());
        NET_DVR_Logout(lUserID);
        NET_DVR_Cleanup();
        return 0;
    }
    sleep(5000);
    //停止监听
    if (!NET_DVR_StopListen_V30(lHandle))
    {
        printf("NET_DVR_StopListen_V30 error, % d\n", NET_DVR_GetLastError());
        NET_DVR_Logout(lUserID);
        NET_DVR_Cleanup();
        return 0;
    }
    //注销用户
    NET_DVR_Logout(lUserID);
    //释放 SDK 资源
    NET_DVR_Cleanup();
    return 0;
}
