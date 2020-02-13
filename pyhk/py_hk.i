% define DOCSTRING "本模块主要用于海康威视的接口封装" % enddef

    % module(docstring = DOCSTRING) pyhk
    % feature("autodoc", "2"); //生成自动的接口注释代码
% header % {
/*  Includes the header in the wrapper code */
#include "HCNetSDK.h"
#include "py_hk.h"

               % } //typedof 重新命名参数
    % inline %
{
#define BOOL int
    typedef unsigned int DWORD;
    typedef unsigned short WORD;
    typedef unsigned short USHORT;
    typedef short SHORT;
    typedef int LONG;
    typedef unsigned char BYTE;
    typedef unsigned int UINT;
    typedef void *LPVOID;
    typedef void *HANDLE;
    typedef unsigned int *LPDWORD;
    typedef unsigned long long UINT64;
    typedef signed long long INT64;
    %
}
#ifndef TRUE
#define TRUE 1
#endif
#ifndef FALSE
#define FALSE 0
#endif
#ifndef NULL
#define NULL 0
#endif

#define __stdcall
#define CALLBACK

#define NET_DVR_API extern "C"
typedef unsigned int COLORKEY;
typedef unsigned int COLORREF;

#ifndef __HWND_defined
#define __HWND_defined
#if defined(__linux__)
typedef unsigned int HWND;
#else
typedef void *HWND;
#endif
#endif

#ifndef __HDC_defined
#define __HDC_defined
#if defined(__linux__)
typedef struct __DC
{
    void *surface; //SDL Surface
    HWND hWnd;     //HDC window handle
} DC;
typedef DC *HDC;
#else
typedef void *HDC;
#endif
#endif

typedef struct tagInitInfo
{
    int uWidth;
    int uHeight;
} INITINFO;

typedef struct
{
    DWORD dwYear;   //年
    DWORD dwMonth;  //月
    DWORD dwDay;    //日
    DWORD dwHour;   //时
    DWORD dwMinute; //分
    DWORD dwSecond; //秒
} NET_DVR_TIME, *LPNET_DVR_TIME;
//回调函数的抽象集合

% feature("director") CallbackStruct; //启动导演功能，
% inline %{
    
%}
%{
    //静态回调函数类
    static CallbackStruct *C_callback = NULL;
    static void fExceptionCallBack_helper(DWORD dwType, LONG lUserID, LONG lHandle, void *pUser){
        return C_callback->fExceptionCallBack(dwType, lUserID, lHandle, pUser);
        } 
%}

//初始化相关函数
BOOL NET_DVR_Init();
BOOL NET_DVR_SetConnectTime(DWORD dwWaitTime, DWORD dwTryTimes);
DWORD NET_DVR_GetLastError();
BOOL NET_DVR_SetExceptionCallBack_V30(UINT reserved1, void *reserved2, fExceptionCallBack cbExceptionCallBack, void *pUser);
% inline % {
    BOOL NET_DVR_SetExceptionCallBack_V30_wrapper( UINT  nMessage,
  HWND                   hWnd,  CallbackStruct   *cbExceptionCallBack,
  void   *pUser){
      handler_ptr=cbExceptionCallBack;
      BOOL result=NET_DVR_SetExceptionCallBack_V30(nMessage,hWnd,&fExceptionCallBack_helper,pUser);
      cbExceptionCallBack=NULL;
      return result;
  }
%}
% include "py_hk.h"