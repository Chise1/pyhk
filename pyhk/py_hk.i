%module(package="hk_struct") hk_struct
%feature("autodoc","2");
%{
#include "HCNetSDK.h"
#include "hk_callback_wrap.h"
%}
%import "hk_callback/hk_callback.i"

NET_DVR_API BOOL __stdcall NET_DVR_Init();
NET_DVR_API BOOL __stdcall NET_DVR_Cleanup();
NET_DVR_API BOOL __stdcall NET_DVR_SetConnectTime(DWORD dwWaitTime = 3000, DWORD dwTryTimes = 3);
NET_DVR_API BOOL __stdcall NET_DVR_SetReconnect(DWORD dwInterval = 30000, BOOL bEnableRecon = TRUE);
NET_DVR_API LONG __stdcall NET_DVR_Login_V30(char *sDVRIP, WORD wDVRPort, char *sUserName, char *sPassword, LPNET_DVR_DEVICEINFO_V30 lpDeviceInfo);
NET_DVR_API DWORD __stdcall NET_DVR_GetLastError();

//callback涉及到的函数
    // NET_DVR_API LONG __stdcall NET_DVR_StartPassiveTransCode(LONG lUserID, NET_DVR_STREAM_INFO const *pStreamInfo, NET_DVR_COMPRESSIONCFG_V30 const *pDstTransInfo, NET_DVR_PASSIVETRANSINFO const *pPassiveTransInfo, void(CALLBACK *fTransCodeDataCallBack) (LONG lPassiveHandle, DWORD dwDataType, BYTE *pBuffer, DWORD dwBufSize, void* pUser) = NULL, void* pUser = NULL);
%inline%{
NET_DVR_API LONG __stdcall NET_DVR_ZeroStartPlay_wrapper(LONG lUserID, LPNET_DVR_CLIENTINFO lpClientInfo, REALDATACALLBACKOp *fRealDataCallBack_V30 = NULL, void* pUser = NULL, BOOL bBlocked = TRUE){
    REALDATACALLBACK_ptr=fRealDataCallBack_V30;
    LONG result=NET_DVR_ZeroStartPlay(lUserID, lpClientInfo, &REALDATACALLBACK_helper, pUser, bBlocked);
    fRealDataCallBack_V30=NULL;
    return result;}
NET_DVR_API BOOL __stdcall NET_DVR_SetDVRMessageCallBack_V30_wrapper(MSGCallBackOp *fMessageCallBack, void* pUser){
    MSGCallBack_ptr=fMessageCallBack;
     BOOL result= NET_DVR_SetDVRMessageCallBack_V30(&MSGCallBack_helper,  pUser);
     fMessageCallBack=NULL;
     return result;}
}
%} 

