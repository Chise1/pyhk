#include <stdio.h>
#include <iostream>
#include "HCNetSDK.h"
using namespace std;
typedef HWND(WINAPI *PROCGETCONSOLEWINDOW)();
PROCGETCONSOLEWINDOW GetConsoleWindow;
int iNum = 0;
void CALLBACK MSesGCallback(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void *pUser)
{
    cout<<"回调成功"<<endl;
    return;
}
void main()
{
    //---------------------------------------
    //初始化
    NET_DVR_Init();
    //获取控制台窗口句柄
    HMODULE hKernel32 = GetModuleHandle("kernel32");
    GetConsoleWindow = (PROCGETCONSOLEWINDOW)GetProcAddress(hKernel32, "GetConsoleWindow");
    //设置连接时间与重连时间
    NET_DVR_SetConnectTime(2000, 1);
    NET_DVR_SetReconnect(10000, true);
    //---------------------------------------
    //注册设备
    LONG lUserID;
    NET_DVR_DEVICEINFO_V30 struDeviceInfo;
    lUserID = NET_DVR_Login_V30("192.168.2.31", 8000, "admin", "ADMIN1234", &struDeviceInfo);
    if (lUserID < 0)
    {
        printf("Login error, %d\n", NET_DVR_GetLastError());
        NET_DVR_Cleanup();

        return;
    }
    else{
        cout<<"login success.";
        NET_DVR_Logout(lUserID);
        NET_DVR_Cleanup();
        return;
    }
    return;
}