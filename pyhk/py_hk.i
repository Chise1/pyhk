%define DOCSTRING "本模块主要用于海康威视的接口封装"
%enddef

%module(docstring = DOCSTRING) pyhk
%feature("autodoc", "2"); //生成自动的接口注释代码
%header %{
/*  Includes the header in the wrapper code */
#include "HCNetSDK.h"
#include "py_hk.h"
// #include "base_define.h"
%} //typedof 重新命名参数
%include "base_define.i"

%include "struct.i"

%include "callback.i"

//初始化相关函数
BOOL NET_DVR_Init();
BOOL NET_DVR_SetConnectTime(DWORD dwWaitTime, DWORD dwTryTimes);
DWORD NET_DVR_GetLastError();
LONG NET_DVR_Login_V30(char *sDVRIP, WORD wDVRPort, char *sUserName, char *sPassword, LPNET_DVR_DEVICEINFO_V30 lpDeviceInfo);
BOOL NET_DVR_GetDVRConfig(  LONG     lUserID,  DWORD    dwCommand,  LONG     lChannel,  LPVOID   lpOutBuffer,  DWORD    dwOutBufferSize,
  LPDWORD  lpBytesReturned);
BOOL NET_DVR_SetDVRConfig(LONG  lUserID,  DWORD  dwCommand,LONG lChannel,  LPVOID lpInBuffer,  DWORD    dwInBufferSize);

%include "py_hk.h"
// %include "base_test.cpp"