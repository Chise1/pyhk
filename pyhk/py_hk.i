%module(package="hk_struct") hk_struct
%feature("autodoc","2");
%{
#include "HCNetSDK.h"
%}
%import "hk_callback/hk_callback.i"

#if defined(__LP64__)
    #define OS_POSIX64    1 
#endif
#ifndef __PLAYRECT_defined
    #define __PLAYRECT_defined
    typedef struct __PLAYRECT
    {
        int x;                               
        int y;                                  
        int uWidth;                            
        int uHeight;                            
    }PLAYRECT;
#endif
#if (defined(_WIN32)) //windows
    #define NET_DVR_API  extern "C" __declspec(dllimport)
    typedef  unsigned __int64   UINT64;
    typedef  signed   __int64   INT64;
#elif defined(__linux__) || defined(__APPLE__) //linux
    #define  BOOL  int
    typedef  unsigned int       DWORD;
    typedef  unsigned short     WORD;
    typedef  unsigned short     USHORT;
    typedef  short              SHORT;
    typedef  int                LONG;
    typedef  unsigned char      BYTE;
    typedef  unsigned int       UINT;
    typedef  void*              LPVOID;
    typedef  void*              HANDLE;
    typedef  unsigned int*      LPDWORD; 
    typedef  unsigned long long UINT64;
    typedef  signed long long   INT64;
    #ifndef TRUE
        #define TRUE  1
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
    typedef unsigned int   COLORKEY;
    typedef unsigned int   COLORREF;
    #ifndef __HWND_defined
        #define __HWND_defined
        #if defined(__linux__)
            typedef unsigned int HWND;
        #else
            typedef void* HWND;
        #endif
    #endif
    #ifndef __HDC_defined
        #define __HDC_defined
        #if defined(__linux__)
            typedef struct __DC
            {
                void*   surface;        //SDL Surface
                HWND    hWnd;           //HDC window handle
            }DC;
            typedef DC* HDC;
        #else
            typedef void* HDC;
        #endif
    #endif
    typedef struct tagInitInfo
    {
        int uWidth; 
        int uHeight; 
    }INITINFO; 
#endif

NET_DVR_API BOOL __stdcall NET_DVR_Init();
NET_DVR_API BOOL __stdcall NET_DVR_Cleanup();

#ifdef _WIN32
NET_DVR_API BOOL __stdcall NET_DVR_SetDVRMessage(UINT nMessage,HWND hWnd);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetExceptionCallBack_V30(UINT nMessage, HWND hWnd, void (CALLBACK* fExceptionCallBack)(DWORD dwType, LONG lUserID, LONG lHandle, void *pUser), void *pUser);
#elif defined(__linux__) || defined(__APPLE__)
    // NET_DVR_API BOOL __stdcall NET_DVR_SetExceptionCallBack_V30(UINT reserved1, void* reserved2, void (CALLBACK* fExceptionCallBack)(DWORD dwType, LONG lUserID, LONG lHandle, void *pUser), void *pUser);
/*Linux专有 */
#if defined(__linux__)
NET_DVR_API BOOL NET_DVR_DrawAreaInit(INITINFO InitInfo, DWORD iUseSDL = 1);
NET_DVR_API BOOL NET_DVR_DrawAreaRelease();
#endif
#endif
NET_DVR_API BOOL __stdcall NET_DVR_LoadAllCom();
    // NET_DVR_API BOOL __stdcall NET_DVR_SetDVRMessCallBack(BOOL (CALLBACK *fMessCallBack)(LONG lCommand,char *sDVRIP,char *pBuf,DWORD dwBufLen));
    // NET_DVR_API BOOL __stdcall NET_DVR_SetDVRMessCallBack_EX(BOOL (CALLBACK *fMessCallBack_EX)(LONG lCommand,LONG lUserID,char *pBuf,DWORD dwBufLen));
    // NET_DVR_API BOOL __stdcall NET_DVR_SetDVRMessCallBack_NEW(BOOL (CALLBACK *fMessCallBack_NEW)(LONG lCommand,char *sDVRIP,char *pBuf,DWORD dwBufLen, WORD dwLinkDVRPort));
    // NET_DVR_API BOOL __stdcall NET_DVR_SetDVRMessageCallBack(BOOL (CALLBACK *fMessageCallBack)(LONG lCommand,char *sDVRIP,char *pBuf,DWORD dwBufLen, DWORD dwUser), DWORD dwUser);
    // typedef void (CALLBACK *MSGCallBack)(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void* pUser);
    // typedef BOOL (CALLBACK *MSGCallBack_V31)(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void* pUser);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetDVRMessageCallBack_V31(MSGCallBack_V31 fMessageCallBack, void* pUser);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetDVRMessageCallBack_V50(int iIndex, MSGCallBack fMessageCallBack, void* pUser);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetDVRMessageCallBack_V51(int iIndex, MSGCallBack fMsgCallBack, void* pUser);
NET_DVR_API BOOL __stdcall NET_DVR_SetConnectTime(DWORD dwWaitTime = 3000, DWORD dwTryTimes = 3);
NET_DVR_API BOOL __stdcall NET_DVR_SetReconnect(DWORD dwInterval = 30000, BOOL bEnableRecon = TRUE);
NET_DVR_API DWORD __stdcall NET_DVR_GetSDKVersion();
NET_DVR_API DWORD __stdcall NET_DVR_GetSDKBuildVersion();
NET_DVR_API int __stdcall NET_DVR_IsSupport();
NET_DVR_API BOOL __stdcall NET_DVR_StartListen(char *sLocalIP,WORD wLocalPort);
NET_DVR_API BOOL __stdcall NET_DVR_StopListen();
    // NET_DVR_API LONG __stdcall NET_DVR_StartListen_V30(char *sLocalIP, WORD wLocalPort, MSGCallBack DataCallback, void* pUserData = NULL);
NET_DVR_API BOOL __stdcall NET_DVR_StopListen_V30(LONG lListenHandle);
NET_DVR_API LONG __stdcall NET_DVR_Login(char *sDVRIP,WORD wDVRPort,char *sUserName,char *sPassword,LPNET_DVR_DEVICEINFO lpDeviceInfo);
NET_DVR_API LONG __stdcall NET_DVR_Login_V30(char *sDVRIP, WORD wDVRPort, char *sUserName, char *sPassword, LPNET_DVR_DEVICEINFO_V30 lpDeviceInfo);
NET_DVR_API LONG __stdcall NET_DVR_Login_V40(LPNET_DVR_USER_LOGIN_INFO pLoginInfo,LPNET_DVR_DEVICEINFO_V40 lpDeviceInfo);
NET_DVR_API BOOL __stdcall NET_DVR_Login_Check(char *sDVRIP, WORD wDVRPort, char *sUserName, char *sPassword, LPNET_DVR_DEVICEINFO_V30 lpDeviceInfo);
NET_DVR_API BOOL __stdcall NET_DVR_Logout(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_Logout_V30(LONG lUserID);
NET_DVR_API DWORD __stdcall NET_DVR_GetLastError();
NET_DVR_API char* __stdcall NET_DVR_GetErrorMsg(LONG *pErrorNo = NULL);
NET_DVR_API BOOL __stdcall NET_DVR_SetShowMode(DWORD dwShowType,COLORREF colorKey);
NET_DVR_API BOOL __stdcall NET_DVR_GetDVRIPByResolveSvr(char *sServerIP, WORD wServerPort, BYTE *sDVRName,WORD wDVRNameLen,BYTE *sDVRSerialNumber,WORD wDVRSerialLen,char* sGetIP);
NET_DVR_API BOOL  __stdcall NET_DVR_GetDVRIPByResolveSvr_EX(char *sServerIP, WORD wServerPort, BYTE *sDVRName, WORD wDVRNameLen, BYTE *sDVRSerialNumber, WORD wDVRSerialLen, char* sGetIP, DWORD *dwPort);
NET_DVR_API BOOL __stdcall NET_DVR_GetDVRNAMEByResolveSvr(char const *sServerIP, WORD wServerPort, char const *sIP, char *sDVRName);
//预览相关接口
    // NET_DVR_API LONG __stdcall NET_DVR_PlayDirect(char *sDVRIP, char *sUserName, char *sPassword, LPNET_DVR_CLIENTINFO lpClientInfo, void(CALLBACK *fRealDataCallBack_V30) (LONG lRealHandle, DWORD dwDataType, BYTE *pBuffer, DWORD dwBufSize, void* pUser) = NULL, void* pUser = NULL, BOOL bBlocked = FALSE);
NET_DVR_API LONG __stdcall NET_DVR_RealPlay(LONG lUserID,LPNET_DVR_CLIENTINFO lpClientInfo);
    // NET_DVR_API LONG __stdcall NET_DVR_RealPlay_V30(LONG lUserID, LPNET_DVR_CLIENTINFO lpClientInfo, void(CALLBACK *fRealDataCallBack_V30) (LONG lRealHandle, DWORD dwDataType, BYTE *pBuffer, DWORD dwBufSize, void* pUser) = NULL, void* pUser = NULL, BOOL bBlocked = FALSE);
NET_DVR_API BOOL __stdcall NET_DVR_StopRealPlay(LONG lRealHandle);
NET_DVR_API BOOL __stdcall NET_DVR_StopPlayDirect(LONG lRealHandle);
    // NET_DVR_API BOOL __stdcall NET_DVR_RigisterDrawFun(LONG lRealHandle,void (CALLBACK* fDrawFun)(LONG lRealHandle,HDC hDc,DWORD dwUser),DWORD dwUser);
NET_DVR_API BOOL __stdcall NET_DVR_SetPlayerBufNumber(LONG lRealHandle,DWORD dwBufNum);
NET_DVR_API BOOL __stdcall NET_DVR_ThrowBFrame(LONG lRealHandle,DWORD dwNum);
NET_DVR_API BOOL __stdcall NET_DVR_SetAudioMode(DWORD dwMode);
NET_DVR_API BOOL __stdcall NET_DVR_OpenSound(LONG lRealHandle);
NET_DVR_API BOOL __stdcall NET_DVR_CloseSound();
NET_DVR_API BOOL __stdcall NET_DVR_OpenSoundShare(LONG lRealHandle);
NET_DVR_API BOOL __stdcall NET_DVR_CloseSoundShare(LONG lRealHandle);
NET_DVR_API BOOL __stdcall NET_DVR_Volume(LONG lRealHandle,WORD wVolume);
NET_DVR_API BOOL __stdcall NET_DVR_SaveRealData(LONG lRealHandle,char *sFileName);
NET_DVR_API BOOL __stdcall NET_DVR_StopSaveRealData(LONG lRealHandle);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetRealDataCallBack(LONG lRealHandle,void(CALLBACK *fRealDataCallBack) (LONG lRealHandle, DWORD dwDataType, BYTE *pBuffer,DWORD dwBufSize,DWORD dwUser),DWORD dwUser);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetRealDataCallBackEx(LONG lRealHandle,void(CALLBACK *fRealDataCallBack) (LONG lRealHandle, DWORD dwDataType, BYTE *pBuffer,DWORD dwBufSize,void *pUser),void *pUser);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetStandardDataCallBack(LONG lRealHandle,void(CALLBACK *fStdDataCallBack) (LONG lRealHandle, DWORD dwDataType, BYTE *pBuffer,DWORD dwBufSize,DWORD dwUser),DWORD dwUser);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetStandardDataCallBackEx(LONG lRealHandle,void(CALLBACK *fStdDataCallBack) (LONG lRealHandle, DWORD dwDataType, BYTE *pBuffer,DWORD dwBufSize,void *pUser),void *pUser);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetTransparentDataCallBack(LONG lRealHandle, void(CALLBACK *fTpDataCallBack) (LONG lRealHandle, DWORD dwDataType, BYTE *pBuffer, DWORD dwBufSize, void *pUser), void *pUser);
NET_DVR_API BOOL __stdcall NET_DVR_CapturePicture(LONG lRealHandle,char *sPicFileName);//bmp
NET_DVR_API BOOL __stdcall NET_DVR_SetCapturePictureMode(DWORD dwCaptureMode);
//动态生成I帧
NET_DVR_API BOOL __stdcall NET_DVR_MakeKeyFrame(LONG lUserID, LONG lChannel);//主码流
NET_DVR_API BOOL __stdcall NET_DVR_MakeKeyFrameSub(LONG lUserID, LONG lChannel);//子码流
//云台控制相关接口
NET_DVR_API BOOL __stdcall NET_DVR_PTZControl(LONG lRealHandle,DWORD dwPTZCommand,DWORD dwStop);
NET_DVR_API BOOL __stdcall NET_DVR_PTZControl_Other(LONG lUserID,LONG lChannel,DWORD dwPTZCommand,DWORD dwStop);
NET_DVR_API BOOL __stdcall NET_DVR_TransPTZ(LONG lRealHandle,char *pPTZCodeBuf,DWORD dwBufSize);
NET_DVR_API BOOL __stdcall NET_DVR_TransPTZ_Other(LONG lUserID,LONG lChannel,char *pPTZCodeBuf,DWORD dwBufSize);
NET_DVR_API BOOL __stdcall NET_DVR_PTZPreset(LONG lRealHandle,DWORD dwPTZPresetCmd,DWORD dwPresetIndex);
NET_DVR_API BOOL __stdcall NET_DVR_PTZPreset_Other(LONG lUserID,LONG lChannel,DWORD dwPTZPresetCmd,DWORD dwPresetIndex);
NET_DVR_API BOOL __stdcall NET_DVR_TransPTZ_EX(LONG lRealHandle,char *pPTZCodeBuf,DWORD dwBufSize);
NET_DVR_API BOOL __stdcall NET_DVR_PTZControl_EX(LONG lRealHandle,DWORD dwPTZCommand,DWORD dwStop);
NET_DVR_API BOOL __stdcall NET_DVR_PTZPreset_EX(LONG lRealHandle,DWORD dwPTZPresetCmd,DWORD dwPresetIndex);
NET_DVR_API BOOL __stdcall NET_DVR_PTZCruise(LONG lRealHandle,DWORD dwPTZCruiseCmd,BYTE byCruiseRoute, BYTE byCruisePoint, WORD wInput);
NET_DVR_API BOOL __stdcall NET_DVR_PTZCruise_Other(LONG lUserID,LONG lChannel,DWORD dwPTZCruiseCmd,BYTE byCruiseRoute, BYTE byCruisePoint, WORD wInput);
NET_DVR_API BOOL __stdcall NET_DVR_PTZCruise_EX(LONG lRealHandle,DWORD dwPTZCruiseCmd,BYTE byCruiseRoute, BYTE byCruisePoint, WORD wInput);
NET_DVR_API BOOL __stdcall NET_DVR_PTZTrack(LONG lRealHandle, DWORD dwPTZTrackCmd);
NET_DVR_API BOOL __stdcall NET_DVR_PTZTrack_Other(LONG lUserID, LONG lChannel, DWORD dwPTZTrackCmd);
NET_DVR_API BOOL __stdcall NET_DVR_PTZTrack_EX(LONG lRealHandle, DWORD dwPTZTrackCmd);
NET_DVR_API BOOL __stdcall NET_DVR_PTZControlWithSpeed(LONG lRealHandle, DWORD dwPTZCommand, DWORD dwStop, DWORD dwSpeed);
NET_DVR_API BOOL __stdcall NET_DVR_PTZControlWithSpeed_Other(LONG lUserID, LONG lChannel, DWORD dwPTZCommand, DWORD dwStop, DWORD dwSpeed);
NET_DVR_API BOOL __stdcall NET_DVR_PTZControlWithSpeed_EX(LONG lRealHandle, DWORD dwPTZCommand, DWORD dwStop, DWORD dwSpeed);
NET_DVR_API BOOL __stdcall NET_DVR_GetPTZCruise(LONG lUserID,LONG lChannel,LONG lCruiseRoute, LPNET_DVR_CRUISE_RET lpCruiseRet);
//文件查找与回放
NET_DVR_API LONG __stdcall NET_DVR_FindFile(LONG lUserID,LONG lChannel,DWORD dwFileType, LPNET_DVR_TIME lpStartTime, LPNET_DVR_TIME lpStopTime);
NET_DVR_API LONG __stdcall NET_DVR_FindNextFile(LONG lFindHandle,LPNET_DVR_FIND_DATA lpFindData);
NET_DVR_API LONG __stdcall NET_DVR_FindNextFile_Card(LONG lFindHandle, LPNET_DVR_FINDDATA_CARD lpFindData);
NET_DVR_API BOOL __stdcall NET_DVR_FindClose(LONG lFindHandle);
NET_DVR_API LONG __stdcall NET_DVR_FindNextFile_V30(LONG lFindHandle, LPNET_DVR_FINDDATA_V30 lpFindData);
NET_DVR_API LONG __stdcall NET_DVR_FindNextFile_V40(LONG lFindHandle, LPNET_DVR_FINDDATA_V40 lpFindData);
NET_DVR_API LONG __stdcall NET_DVR_FindNextFile_V50(LONG lFindHandle, LPNET_DVR_FINDDATA_V50 lpFindData);
NET_DVR_API LONG __stdcall NET_DVR_FindFile_V30(LONG lUserID, LPNET_DVR_FILECOND pFindCond);
NET_DVR_API LONG __stdcall NET_DVR_FindFile_V50(LONG lUserID, LPNET_DVR_FILECOND_V50 pFindCond);
NET_DVR_API BOOL __stdcall NET_DVR_FindClose_V30(LONG lFindHandle);
NET_DVR_API BOOL __stdcall NET_DVR_LockFileByName(LONG lUserID, char *sLockFileName);
NET_DVR_API BOOL __stdcall NET_DVR_UnlockFileByName(LONG lUserID, char *sUnlockFileName);
NET_DVR_API BOOL __stdcall NET_DVR_LockFileByNameV40(LONG lUserID, BOOL bLock, const NET_DVR_LOCK_FILE_BY_NAME_PARA *lpLockFilePara);
NET_DVR_API LONG __stdcall NET_DVR_PlayBackByName(LONG lUserID,char *sPlayBackFileName, HWND hWnd);
NET_DVR_API LONG __stdcall NET_DVR_PlayBackByTime(LONG lUserID,LONG lChannel, LPNET_DVR_TIME lpStartTime, LPNET_DVR_TIME lpStopTime, HWND hWnd);
NET_DVR_API LONG __stdcall NET_DVR_PlayBackReverseByName(LONG lUserID, char *sPlayBackFileName, HWND hWnd);
NET_DVR_API LONG __stdcall NET_DVR_PlayBackByName_V50(LONG lUserID, LPNET_DVR_PLAY_BY_NAME_PARA pParam);
NET_DVR_API LONG __stdcall NET_DVR_PlayBackReverseByName_V50(LONG lUserID, LPNET_DVR_PLAY_BY_NAME_PARA pParam);
NET_DVR_API LONG __stdcall NET_DVR_PlayBackByTime_PCNVR(LONG lUserID, NET_DVR_PLAYBCK_BYTIME_COND_PCNVR const *pPlaybackParams);
NET_DVR_API BOOL __stdcall NET_DVR_PlayBackControl(LONG lPlayHandle,DWORD dwControlCode,DWORD dwInValue,DWORD *LPOutValue);
NET_DVR_API BOOL __stdcall NET_DVR_StopPlayBack(LONG lPlayHandle);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetPlayDataCallBack(LONG lPlayHandle,void(CALLBACK *fPlayDataCallBack) (LONG lPlayHandle, DWORD dwDataType, BYTE *pBuffer,DWORD dwBufSize,DWORD dwUser),DWORD dwUser);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetPlayBackESCallBack(LONG lPlayHandle, void (CALLBACK *fPlayESCallBack)(LONG lPlayHandle, NET_DVR_PACKET_INFO_EX *struPackInfo,  void* pUser), void* pUser);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetPlayDataCallBack_V40(LONG lPlayHandle,void(CALLBACK *fPlayDataCallBack_V40) (LONG lPlayHandle, DWORD dwDataType, BYTE *pBuffer,DWORD dwBufSize,void *pUser),void *pUser);
NET_DVR_API BOOL __stdcall NET_DVR_PlayBackSaveData(LONG lPlayHandle,char *sFileName);
NET_DVR_API BOOL __stdcall NET_DVR_StopPlayBackSave(LONG lPlayHandle);
NET_DVR_API BOOL __stdcall NET_DVR_GetPlayBackOsdTime(LONG lPlayHandle, LPNET_DVR_TIME lpOsdTime);
NET_DVR_API BOOL __stdcall NET_DVR_PlayBackCaptureFile(LONG lPlayHandle,char *sFileName);
NET_DVR_API LONG __stdcall NET_DVR_GetFileByName(LONG lUserID,char *sDVRFileName,char *sSavedFileName);
NET_DVR_API LONG __stdcall NET_DVR_GetFileByName_V50(LONG lUserID, LPNET_DVR_DOWNLOAD_BY_NAME_COND pParam);
NET_DVR_API LONG __stdcall NET_DVR_GetFileByTime(LONG lUserID,LONG lChannel, LPNET_DVR_TIME lpStartTime, LPNET_DVR_TIME lpStopTime, char *sSavedFileName);
NET_DVR_API BOOL __stdcall NET_DVR_StopGetFile(LONG lFileHandle);
NET_DVR_API int __stdcall NET_DVR_GetDownloadPos(LONG lFileHandle);
NET_DVR_API int    __stdcall NET_DVR_GetPlayBackPos(LONG lPlayHandle);
//升级
NET_DVR_API LONG __stdcall NET_DVR_AdapterUpgrade(LONG lUserID, char *sFileName);
NET_DVR_API LONG __stdcall NET_DVR_Upgrade(LONG lUserID, char *sFileName);
NET_DVR_API LONG __stdcall NET_DVR_VcalibUpgrade(LONG lUserID, LONG lChannel, char const *sFileName);
NET_DVR_API int __stdcall NET_DVR_GetUpgradeState(LONG lUpgradeHandle);
NET_DVR_API int __stdcall NET_DVR_GetUpgradeProgress(LONG lUpgradeHandle);
NET_DVR_API BOOL __stdcall NET_DVR_CloseUpgradeHandle(LONG lUpgradeHandle);
NET_DVR_API BOOL __stdcall NET_DVR_SetNetworkEnvironment(DWORD dwEnvironmentLevel);
//远程格式化硬盘
NET_DVR_API LONG __stdcall NET_DVR_FormatDisk(LONG lUserID,LONG lDiskNumber);
NET_DVR_API LONG __stdcall NET_DVR_FormatDisk_V50(LONG lUserID, NET_DVR_FORMAT_HDD *lpStruHddFormatCond);
NET_DVR_API BOOL __stdcall NET_DVR_GetFormatProgress(LONG lFormatHandle, LONG *pCurrentFormatDisk,LONG *pCurrentDiskPos,LONG *pFormatStatic);
NET_DVR_API BOOL __stdcall NET_DVR_CloseFormatHandle(LONG lFormatHandle);
//报警
NET_DVR_API LONG __stdcall NET_DVR_SetupAlarmChan(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_CloseAlarmChan(LONG lAlarmHandle);
NET_DVR_API LONG __stdcall NET_DVR_SetupAlarmChan_V30(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_CloseAlarmChan_V30(LONG lAlarmHandle);
//语音对讲
    // NET_DVR_API LONG __stdcall NET_DVR_StartVoiceCom(LONG lUserID, void(CALLBACK *fVoiceDataCallBack)(LONG lVoiceComHandle, char *pRecvDataBuffer, DWORD dwBufSize, BYTE byAudioFlag, DWORD dwUser), DWORD dwUser);
    // NET_DVR_API LONG __stdcall NET_DVR_StartVoiceCom_V30(LONG lUserID, DWORD dwVoiceChan, BOOL bNeedCBNoEncData, void(CALLBACK *fVoiceDataCallBack)(LONG lVoiceComHandle, char *pRecvDataBuffer, DWORD dwBufSize, BYTE byAudioFlag, void* pUser), void* pUser);
NET_DVR_API BOOL __stdcall NET_DVR_SetVoiceComClientVolume(LONG lVoiceComHandle, WORD wVolume);
NET_DVR_API BOOL __stdcall NET_DVR_StopVoiceCom(LONG lVoiceComHandle);
//语音转发
    // NET_DVR_API LONG __stdcall NET_DVR_StartVoiceCom_MR(LONG lUserID, void(CALLBACK *fVoiceDataCallBack)(LONG lVoiceComHandle, char *pRecvDataBuffer, DWORD dwBufSize, BYTE byAudioFlag, DWORD dwUser), DWORD dwUser);
    // NET_DVR_API LONG __stdcall NET_DVR_StartVoiceCom_MR_V30(LONG lUserID, DWORD dwVoiceChan, void(CALLBACK *fVoiceDataCallBack)(LONG lVoiceComHandle, char *pRecvDataBuffer, DWORD dwBufSize, BYTE byAudioFlag, void* pUser), void* pUser);
NET_DVR_API BOOL __stdcall NET_DVR_VoiceComSendData(LONG lVoiceComHandle, char *pSendBuf, DWORD dwBufSize);
NET_DVR_API BOOL __stdcall NET_DVR_GetCurrentAudioCompress(LONG lUserID, LPNET_DVR_COMPRESSION_AUDIO lpCompressAudio);
NET_DVR_API BOOL __stdcall NET_DVR_GetCurrentAudioCompress_V50(LONG lUserID, LPNET_DVR_AUDIO_CHANNEL lpAudioChannel, LPNET_DVR_COMPRESSION_AUDIO lpCompressAudio);
//语音广播
NET_DVR_API BOOL __stdcall NET_DVR_ClientAudioStart();
    // NET_DVR_API BOOL __stdcall NET_DVR_ClientAudioStart_V30(void(CALLBACK *fVoiceDataCallBack)(char *pRecvDataBuffer, DWORD dwBufSize, void * pUser), void *pUser);
NET_DVR_API BOOL __stdcall NET_DVR_ClientAudioStop();
NET_DVR_API BOOL __stdcall NET_DVR_AddDVR(LONG lUserID);
NET_DVR_API LONG __stdcall NET_DVR_AddDVR_V30(LONG lUserID, DWORD dwVoiceChan);
NET_DVR_API BOOL __stdcall NET_DVR_DelDVR(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_DelDVR_V30(LONG lVoiceHandle);
//透明通道设置
    // NET_DVR_API LONG __stdcall NET_DVR_SerialStart(LONG lUserID,LONG lSerialPort,void(CALLBACK *fSerialDataCallBack)(LONG lSerialHandle,char *pRecvDataBuffer,DWORD dwBufSize,DWORD dwUser),DWORD dwUser);
//485作为透明通道时，需要指明通道号，因为不同通道号485的设置可以不同(比如波特率)
    // NET_DVR_API LONG __stdcall NET_DVR_SerialStart_V40(LONG lUserID,void* lpInBuffer, LONG dwInBufferSize, void(CALLBACK *fSerialDataCallBack)(LONG lSerialHandle, LONG lCHannel, char *pRecvDataBuffer, DWORD dwBufSize, void* pUser), void* pUser);
NET_DVR_API BOOL __stdcall NET_DVR_SerialSend(LONG lSerialHandle, LONG lChannel, char *pSendBuf,DWORD dwBufSize);
NET_DVR_API BOOL __stdcall NET_DVR_SerialStop(LONG lSerialHandle);
NET_DVR_API BOOL __stdcall NET_DVR_SendTo232Port(LONG lUserID, char *pSendBuf, DWORD dwBufSize);
NET_DVR_API BOOL __stdcall NET_DVR_SendToSerialPort(LONG lUserID, DWORD dwSerialPort, DWORD dwSerialIndex, char *pSendBuf, DWORD dwBufSize);
#if (!defined __linux__) && (!defined _WIN64)
//Decoding nBitrate = 16000
NET_DVR_API void* __stdcall NET_DVR_InitG722Decoder(int nBitrate = 16000);
NET_DVR_API BOOL __stdcall NET_DVR_DecodeG722Frame(void *pDecHandle, BYTE* pInBuffer, BYTE* pOutBuffer);
//Encoding
NET_DVR_API void* __stdcall NET_DVR_InitG722Encoder();
NET_DVR_API BOOL __stdcall NET_DVR_EncodeG722Frame(void *pEncodeHandle, BYTE* pInBuffer, BYTE* pOutBuffer);
#elif ((defined __linux__) || (defined _WIN64))
NET_DVR_API void* __stdcall NET_DVR_InitG722Decoder();
NET_DVR_API BOOL __stdcall NET_DVR_DecodeG722Frame(void *handle, NET_DVR_AUDIODEC_PROCESS_PARAM * param);
//Encoding
NET_DVR_API void* __stdcall NET_DVR_InitG722Encoder(NET_DVR_AUDIOENC_INFO* enc_info);
NET_DVR_API BOOL __stdcall NET_DVR_EncodeG722Frame(void *handle, NET_DVR_AUDIOENC_PROCESS_PARAM* param);
#endif // _WIN32
NET_DVR_API void __stdcall NET_DVR_ReleaseG722Decoder(void *pDecHandle);
NET_DVR_API void __stdcall NET_DVR_ReleaseG722Encoder(void *pEncodeHandle);
//解码
NET_DVR_API void* __stdcall NET_DVR_InitG726Decoder(void** pDecMoudle);
NET_DVR_API void __stdcall NET_DVR_ReleaseG726Decoder(void *pDecHandle);
NET_DVR_API BOOL __stdcall NET_DVR_DecodeG726Frame(void *pDecMoudle, BYTE* pInBuffer, BYTE* pOutBuffer, BYTE byReset);
//编码
NET_DVR_API void* __stdcall NET_DVR_InitG726Encoder(void** pEncMoudle);
NET_DVR_API BOOL __stdcall NET_DVR_EncodeG726Frame(void *pEncMoudle, BYTE* pInBuffer, BYTE* pOutBuffer, BYTE byReset);
NET_DVR_API void __stdcall NET_DVR_ReleaseG726Encoder(void *pEncHandle);
//远程控制本地显示
NET_DVR_API BOOL __stdcall NET_DVR_ClickKey(LONG lUserID, LONG lKeyIndex);
NET_DVR_API BOOL __stdcall NET_DVR_DoorBellControl(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_Preview(LONG lUserID, LONG lPicNum);
NET_DVR_API BOOL __stdcall NET_DVR_PreviewOne(LONG lUserID, LONG lChannel);
NET_DVR_API BOOL __stdcall NET_DVR_PlayBackByNameLocDisplay(LONG lUserID, char *sFileName);
NET_DVR_API BOOL __stdcall NET_DVR_PlayBackByTimeLocDisplay(LONG lUserID, LONG lChannel, NET_DVR_TIME const *lpStartTime, NET_DVR_TIME const *lpStopTime);
NET_DVR_API BOOL __stdcall NET_DVR_StopLocDisplayPlay(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_PlayControlLocDisplay(LONG lUserID, DWORD dwControlCode);
//远程控制设备端手动录像
NET_DVR_API BOOL __stdcall NET_DVR_StartDVRRecord(LONG lUserID,LONG lChannel,LONG lRecordType);
NET_DVR_API BOOL __stdcall NET_DVR_StopDVRRecord(LONG lUserID,LONG lChannel);
//解码卡
NET_DVR_API BOOL __stdcall NET_DVR_InitDevice_Card(long *pDeviceTotalChan);
NET_DVR_API BOOL __stdcall NET_DVR_ReleaseDevice_Card();
NET_DVR_API BOOL __stdcall NET_DVR_InitDDraw_Card(HWND hParent,COLORREF colorKey);
NET_DVR_API BOOL __stdcall NET_DVR_ReleaseDDraw_Card();
NET_DVR_API LONG __stdcall NET_DVR_RealPlay_Card(LONG lUserID,LPNET_DVR_CARDINFO lpCardInfo,long lChannelNum);
NET_DVR_API BOOL __stdcall NET_DVR_ResetPara_Card(LONG lRealHandle,LPNET_DVR_DISPLAY_PARA lpDisplayPara);
NET_DVR_API BOOL __stdcall NET_DVR_RefreshSurface_Card();
NET_DVR_API BOOL __stdcall NET_DVR_ClearSurface_Card();
NET_DVR_API BOOL __stdcall NET_DVR_RestoreSurface_Card();
NET_DVR_API BOOL __stdcall NET_DVR_OpenSound_Card(LONG lRealHandle);
NET_DVR_API BOOL __stdcall NET_DVR_CloseSound_Card(LONG lRealHandle);
NET_DVR_API BOOL __stdcall NET_DVR_SetVolume_Card(LONG lRealHandle,WORD wVolume);
NET_DVR_API BOOL __stdcall NET_DVR_AudioPreview_Card(LONG lRealHandle,BOOL bEnable);
NET_DVR_API LONG __stdcall NET_DVR_GetCardLastError_Card();
NET_DVR_API BOOL __stdcall NET_DVR_SetDspErrMsg_Card(DWORD dwMessage, HANDLE hWnd);
NET_DVR_API BOOL __stdcall NET_DVR_ResetDSP_Card(LONG iChannelNum);
NET_DVR_API HANDLE __stdcall NET_DVR_GetChanHandle_Card(LONG lRealHandle);
NET_DVR_API BOOL __stdcall NET_DVR_CapturePicture_Card(LONG lRealHandle, char *sPicFileName);
NET_DVR_API BOOL __stdcall NET_DVR_GetSerialNum_Card(long lChannelNum,DWORD *pDeviceSerialNo);
NET_DVR_API LONG __stdcall NET_DVR_FindDVRLog(LONG lUserID, LONG lSelectMode, DWORD dwMajorType,DWORD dwMinorType, LPNET_DVR_TIME lpStartTime, LPNET_DVR_TIME lpStopTime);
NET_DVR_API LONG __stdcall NET_DVR_FindNextLog(LONG lLogHandle, LPNET_DVR_LOG lpLogData);
NET_DVR_API BOOL __stdcall NET_DVR_FindLogClose(LONG lLogHandle);
NET_DVR_API LONG __stdcall NET_DVR_FindDVRLog_V30(LONG lUserID, LONG lSelectMode, DWORD dwMajorType,DWORD dwMinorType, LPNET_DVR_TIME lpStartTime, LPNET_DVR_TIME lpStopTime, BOOL bOnlySmart = FALSE);
NET_DVR_API LONG __stdcall NET_DVR_FindNextLog_V30(LONG lLogHandle, LPNET_DVR_LOG_V30 lpLogData);
NET_DVR_API LONG __stdcall NET_DVR_FindDVRLog_V50(LONG lUserID, LPNET_DVR_FIND_LOG_COND pFindCond);
NET_DVR_API LONG __stdcall NET_DVR_FindNextLog_V50(LONG lLogHandle, LPNET_DVR_LOG_V50 lpLogData);
NET_DVR_API BOOL __stdcall NET_DVR_FindLogClose_V30(LONG lLogHandle);
NET_DVR_API LONG __stdcall NET_DVR_FindAlarmHostLog(LONG lUserID, LONG lSelectMode, NET_DVR_ALARMHOST_SEARCH_LOG_PARAM *lpSearchParam);
NET_DVR_API LONG __stdcall NET_DVR_FindNextAlarmHostLog(LONG lFindHandle, NET_DVR_ALARMHOST_LOG_RET *lpFindData);
NET_DVR_API BOOL __stdcall NET_DVR_FindAlarmHostLogClose(LONG lFindHandle);
NET_DVR_API LONG __stdcall NET_DVR_FindFile_PCNVR(LONG lUserID, LPNET_DVR_FILE_COND_PCNVR const pFindCond);
NET_DVR_API LONG __stdcall NET_DVR_FindNextFile_PCNVR(LONG lFindHandle, LPNET_DVR_FINDDATA_PCNVR lpFindData);
NET_DVR_API BOOL __stdcall NET_DVR_FindClose_PCNVR(LONG lFindHandle);
NET_DVR_API LONG __stdcall NET_DVR_FindFileByCard(LONG lUserID,LONG lChannel,DWORD dwFileType, int nFindType, BYTE *sCardNumber, LPNET_DVR_TIME lpStartTime, LPNET_DVR_TIME lpStopTime);
NET_DVR_API BOOL __stdcall NET_DVR_CaptureJPEGPicture(LONG lUserID, LONG lChannel, LPNET_DVR_JPEGPARA lpJpegPara, char *sPicFileName);
NET_DVR_API BOOL __stdcall NET_DVR_CaptureJPEGPicture_NEW(LONG lUserID, LONG lChannel, LPNET_DVR_JPEGPARA lpJpegPara, char *sJpegPicBuffer, DWORD dwPicSize,  LPDWORD lpSizeReturned);
NET_DVR_API BOOL __stdcall NET_DVR_CapturePicture_V50(LONG lUserID, LONG lChannel, LPNET_DVR_PICPARAM_V50  lpPicParam, char *sPicBuffer, DWORD dwPicSize, LPDWORD lpSizeReturned);
NET_DVR_API BOOL __stdcall NET_DVR_CaptureJPEGPicture_WithAppendData(LONG lUserID, LONG lChannel, NET_DVR_JPEGPICTURE_WITH_APPENDDATA *lpJpegWithAppend);
NET_DVR_API BOOL __stdcall NET_DVR_GetRealPlayOsdTime(LONG iRealHandle, LPNET_DVR_TIME lpOsdTime);
NET_DVR_API BOOL __stdcall NET_DVR_RealPlayPause(LONG iRealHandle);
NET_DVR_API BOOL __stdcall NET_DVR_RealPlayRestart(LONG iRealHandle, HWND hPlayWnd);
NET_DVR_API int __stdcall NET_DVR_GetRealPlayerIndex(LONG lRealHandle);
NET_DVR_API int __stdcall NET_DVR_GetPlayBackPlayerIndex(LONG lPlayHandle);
NET_DVR_API BOOL __stdcall NET_DVR_SetScaleCFG(LONG lUserID, DWORD dwScale);
NET_DVR_API BOOL __stdcall NET_DVR_GetScaleCFG(LONG lUserID, DWORD *lpOutScale);
NET_DVR_API BOOL __stdcall NET_DVR_SetScaleCFG_V30(LONG lUserID, LPNET_DVR_SCALECFG pScalecfg);
NET_DVR_API BOOL __stdcall NET_DVR_GetScaleCFG_V30(LONG lUserID, LPNET_DVR_SCALECFG pScalecfg);
NET_DVR_API BOOL __stdcall NET_DVR_SetATMPortCFG(LONG lUserID, WORD wATMPort);
NET_DVR_API BOOL __stdcall NET_DVR_GetATMPortCFG(LONG lUserID, WORD *LPOutATMPort);
NET_DVR_API BOOL __stdcall NET_DVR_InitDDrawDevice();
NET_DVR_API BOOL __stdcall NET_DVR_ReleaseDDrawDevice();
NET_DVR_API LONG __stdcall NET_DVR_GetDDrawDeviceTotalNums();
NET_DVR_API BOOL __stdcall NET_DVR_SetDDrawDevice(LONG lPlayPort, DWORD nDeviceNum);
NET_DVR_API BOOL __stdcall NET_DVR_PTZSelZoomIn(LONG lRealHandle, LPNET_DVR_POINT_FRAME pStruPointFrame);
NET_DVR_API BOOL __stdcall NET_DVR_PTZSelZoomIn_EX(LONG lUserID, LONG lChannel, LPNET_DVR_POINT_FRAME pStruPointFrame);
NET_DVR_API BOOL __stdcall NET_DVR_StartDecode(LONG lUserID, LONG lChannel, LPNET_DVR_DECODERINFO lpDecoderinfo);
NET_DVR_API BOOL __stdcall NET_DVR_StopDecode(LONG lUserID, LONG lChannel);
NET_DVR_API BOOL __stdcall NET_DVR_GetDecoderState(LONG lUserID, LONG lChannel, LPNET_DVR_DECODERSTATE lpDecoderState);
NET_DVR_API BOOL __stdcall NET_DVR_SetDecInfo(LONG lUserID, LONG lChannel, LPNET_DVR_DECCFG lpDecoderinfo);
NET_DVR_API BOOL __stdcall NET_DVR_GetDecInfo(LONG lUserID, LONG lChannel, LPNET_DVR_DECCFG lpDecoderinfo);
NET_DVR_API BOOL __stdcall NET_DVR_SetDecTransPort(LONG lUserID, LPNET_DVR_PORTCFG lpTransPort);
NET_DVR_API BOOL __stdcall NET_DVR_GetDecTransPort(LONG lUserID, LPNET_DVR_PORTCFG lpTransPort);
NET_DVR_API BOOL __stdcall NET_DVR_DecPlayBackCtrl(LONG lUserID, LONG lChannel, DWORD dwControlCode, DWORD dwInValue,DWORD *LPOutValue, LPNET_DVR_PLAYREMOTEFILE lpRemoteFileInfo);
NET_DVR_API BOOL __stdcall NET_DVR_StartDecSpecialCon(LONG lUserID, LONG lChannel, LPNET_DVR_DECCHANINFO lpDecChanInfo);
NET_DVR_API BOOL __stdcall NET_DVR_StopDecSpecialCon(LONG lUserID, LONG lChannel, LPNET_DVR_DECCHANINFO lpDecChanInfo);
NET_DVR_API BOOL __stdcall NET_DVR_DecCtrlDec(LONG lUserID, LONG lChannel, DWORD dwControlCode);
NET_DVR_API BOOL __stdcall NET_DVR_DecCtrlScreen(LONG lUserID, LONG lChannel, DWORD dwControl);
NET_DVR_API BOOL __stdcall NET_DVR_GetDecCurLinkStatus(LONG lUserID, LONG lChannel, LPNET_DVR_DECSTATUS lpDecStatus);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixStartDynamic(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_DYNAMIC_DEC lpDynamicInfo);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixStopDynamic(LONG lUserID, DWORD dwDecChanNum); 
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetDecChanInfo(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_DEC_CHAN_INFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetLoopDecChanInfo(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_LOOP_DECINFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetLoopDecChanInfo(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_LOOP_DECINFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetLoopDecChanEnable(LONG lUserID, DWORD dwDecChanNum, DWORD dwEnable);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetLoopDecChanEnable(LONG lUserID, DWORD dwDecChanNum, LPDWORD lpdwEnable);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetLoopDecEnable(LONG lUserID, LPDWORD lpdwEnable);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetDecChanEnable(LONG lUserID, DWORD dwDecChanNum, DWORD dwEnable);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetDecChanEnable(LONG lUserID, DWORD dwDecChanNum, LPDWORD lpdwEnable);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetDecChanStatus(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_DEC_CHAN_STATUS lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetVideoStandard(LONG lUserID, DWORD dwDecChanNum, LPDWORD lpdwVideoStandard);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetVideoStandard(LONG lUserID, DWORD dwDecChanNum, DWORD dwVideoStandard);
//2007-12-22 增加支持接口 
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetTranInfo(LONG lUserID, LPNET_DVR_MATRIX_TRAN_CHAN_CONFIG lpTranInfo);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetTranInfo(LONG lUserID, LPNET_DVR_MATRIX_TRAN_CHAN_CONFIG lpTranInfo);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetRemotePlay(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_DEC_REMOTE_PLAY lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetRemotePlayControl(LONG lUserID, DWORD dwDecChanNum, DWORD dwControlCode, DWORD dwInValue, DWORD *LPOutValue);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetRemotePlayStatus(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_DEC_REMOTE_PLAY_STATUS lpOuter);
//2009-4-13 新增
NET_DVR_API BOOL __stdcall NET_DVR_MatrixStartDynamic_V30(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_PU_STREAM_CFG lpDynamicInfo);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetLoopDecChanInfo_V30(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_LOOP_DECINFO_V30 lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetLoopDecChanInfo_V30(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_LOOP_DECINFO_V30 lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetDecChanInfo_V30(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_DEC_CHAN_INFO_V30 lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetTranInfo_V30(LONG lUserID, LPNET_DVR_MATRIX_TRAN_CHAN_CONFIG_V30 lpTranInfo);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetTranInfo_V30(LONG lUserID, LPNET_DVR_MATRIX_TRAN_CHAN_CONFIG_V30 lpTranInfo);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetDisplayCfg(LONG lUserID, DWORD dwDispChanNum, LPNET_DVR_VGA_DISP_CHAN_CFG lpDisplayCfg);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetDisplayCfg(LONG lUserID, DWORD dwDispChanNum, LPNET_DVR_VGA_DISP_CHAN_CFG lpDisplayCfg);
NET_DVR_API LONG __stdcall NET_DVR_MatrixStartPassiveDecode(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_PASSIVEMODE lpPassiveMode );
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSendData(LONG lPassiveHandle, char *pSendBuf, DWORD dwBufSize);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixStopPassiveDecode(LONG lPassiveHandle);
NET_DVR_API BOOL __stdcall NET_DVR_UploadLogo(LONG lUserID, DWORD dwDispChanNum, LPNET_DVR_DISP_LOGOCFG lpDispLogoCfg, char *sLogoBuffer);
#define    NET_DVR_SHOWLOGO            1        /*显示LOGO*/
#define    NET_DVR_HIDELOGO            2        /*隐藏LOGO*/  
NET_DVR_API BOOL __stdcall NET_DVR_LogoSwitch(LONG lUserID, DWORD dwDecChan, DWORD dwLogoSwitch);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetDeviceStatus(LONG lUserID,  LPNET_DVR_DECODER_WORK_STATUS lpDecoderCfg);
#define    DISP_CMD_ENLARGE_WINDOW                1    /*显示通道放大某个窗口*/
#define    DISP_CMD_RENEW_WINDOW                2    /*显示通道窗口还原*/
#define    DISP_CMD_OPENAUDIO                    3    /*显示通道打开音频*/
#define    DISP_CMD_CLOSEAUDIO                    4    /*显示通道关闭音频*/
NET_DVR_API BOOL __stdcall NET_DVR_MatrixDiaplayControl(LONG lUserID, DWORD dwDispChanNum, DWORD dwDispChanCmd, DWORD dwCmdParam);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixPassiveDecodeControl(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_PASSIVEDECODE_CONTROL lpInter);
NET_DVR_API LONG __stdcall NET_DVR_MatrixGetPassiveDecodeStatus(LONG lPassiveHandle);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetDecChanCfg(LONG lUserID, DWORD dwDecChan, LPNET_DVR_MATRIX_DECCHAN_CONTROL lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetDecChanCfg(LONG lUserID, DWORD dwDecChan, LPNET_DVR_MATRIX_DECCHAN_CONTROL lpInter);
NET_DVR_API LONG __stdcall NET_DVR_PlayBackByTime_NEW(LONG lUserID, LONG lChannel, NET_DVR_TIME const *lpStartTime, NET_DVR_TIME const *lpStopTime, LONG lLongitude, LONG lLatitude, HWND hWnd);
NET_DVR_API BOOL __stdcall NET_DVR_RefreshPlay(LONG lPlayHandle);
//恢复默认值
NET_DVR_API BOOL __stdcall NET_DVR_RestoreConfig(LONG lUserID);
//保存参数
NET_DVR_API BOOL __stdcall NET_DVR_SaveConfig(LONG lUserID);
//重启
NET_DVR_API BOOL __stdcall NET_DVR_RebootDVR(LONG lUserID);
//关闭DVR
NET_DVR_API BOOL __stdcall NET_DVR_ShutDownDVR(LONG lUserID);
//参数配置 begin
NET_DVR_API BOOL __stdcall NET_DVR_GetDVRConfig(LONG lUserID, DWORD dwCommand,LONG lChannel, LPVOID lpOutBuffer, DWORD dwOutBufferSize, LPDWORD lpBytesReturned);
NET_DVR_API BOOL __stdcall NET_DVR_SetDVRConfig(LONG lUserID, DWORD dwCommand,LONG lChannel, LPVOID lpInBuffer, DWORD dwInBufferSize);
NET_DVR_API BOOL __stdcall NET_DVR_GetDVRWorkState_V30(LONG lUserID, LPNET_DVR_WORKSTATE_V30 lpWorkState);
NET_DVR_API BOOL __stdcall NET_DVR_GetDVRWorkState(LONG lUserID, LPNET_DVR_WORKSTATE lpWorkState);
NET_DVR_API BOOL __stdcall NET_DVR_SetVideoEffect(LONG lUserID, LONG lChannel, DWORD dwBrightValue, DWORD dwContrastValue, DWORD dwSaturationValue, DWORD dwHueValue);
NET_DVR_API BOOL __stdcall NET_DVR_GetVideoEffect(LONG lUserID, LONG lChannel, DWORD *pBrightValue, DWORD *pContrastValue, DWORD *pSaturationValue, DWORD *pHueValue);
NET_DVR_API BOOL __stdcall NET_DVR_ClientGetframeformat(LONG lUserID, LPNET_DVR_FRAMEFORMAT lpFrameFormat);
NET_DVR_API BOOL __stdcall NET_DVR_ClientSetframeformat(LONG lUserID, LPNET_DVR_FRAMEFORMAT lpFrameFormat);
NET_DVR_API BOOL __stdcall NET_DVR_ClientGetframeformat_V30(LONG lUserID, LPNET_DVR_FRAMEFORMAT_V30 lpFrameFormat);
NET_DVR_API BOOL __stdcall NET_DVR_ClientSetframeformat_V30(LONG lUserID, LPNET_DVR_FRAMEFORMAT_V30 lpFrameFormat);
NET_DVR_API BOOL __stdcall NET_DVR_GetAtmFrameFormat_V30(LONG lUserID, LONG lAtmChannel, LPNET_DVR_ATM_FRAMEFORMAT_V30 lpFrameFormat);
NET_DVR_API BOOL __stdcall NET_DVR_SetAtmFrameFormat_V30(LONG lUserID, LONG lAtmChannel, LPNET_DVR_ATM_FRAMEFORMAT_V30 lpFrameFormat);
NET_DVR_API BOOL __stdcall NET_DVR_GetAtmProtocol(LONG lUserID, LPNET_DVR_ATM_PROTOCOL lpAtmProtocol);
NET_DVR_API BOOL __stdcall NET_DVR_GetAlarmOut_V30(LONG lUserID, LPNET_DVR_ALARMOUTSTATUS_V30 lpAlarmOutState);
NET_DVR_API BOOL __stdcall NET_DVR_GetAlarmOut(LONG lUserID, LPNET_DVR_ALARMOUTSTATUS lpAlarmOutState);
NET_DVR_API BOOL __stdcall NET_DVR_SetAlarmOut(LONG lUserID, LONG lAlarmOutPort,LONG lAlarmOutStatic);
//视频参数调节
NET_DVR_API BOOL __stdcall NET_DVR_ClientSetVideoEffect(LONG lRealHandle,DWORD dwBrightValue,DWORD dwContrastValue, DWORD dwSaturationValue,DWORD dwHueValue);
NET_DVR_API BOOL __stdcall NET_DVR_ClientGetVideoEffect(LONG lRealHandle,DWORD *pBrightValue,DWORD *pContrastValue, DWORD *pSaturationValue,DWORD *pHueValue);
//配置文件
NET_DVR_API BOOL __stdcall NET_DVR_GetConfigFile(LONG lUserID, char *sFileName);
NET_DVR_API BOOL __stdcall NET_DVR_SetConfigFile(LONG lUserID, char *sFileName);
NET_DVR_API BOOL __stdcall NET_DVR_GetConfigFile_V30(LONG lUserID, char *sOutBuffer, DWORD dwOutSize, DWORD *pReturnSize);
NET_DVR_API BOOL __stdcall NET_DVR_GetConfigFile_EX(LONG lUserID, char *sOutBuffer, DWORD dwOutSize);
NET_DVR_API BOOL __stdcall NET_DVR_SetConfigFile_EX(LONG lUserID, char *sInBuffer, DWORD dwInSize);
//启用日志文件写入接口
NET_DVR_API BOOL __stdcall NET_DVR_SetLogToFile(DWORD nLogLevel = 0, char * strLogDir = NULL, BOOL bAutoDel = TRUE);
NET_DVR_API BOOL __stdcall NET_DVR_GetSDKState(LPNET_DVR_SDKSTATE pSDKState);
NET_DVR_API BOOL __stdcall NET_DVR_GetSDKAbility(LPNET_DVR_SDKABL pSDKAbl);
NET_DVR_API BOOL __stdcall NET_DVR_GetPTZProtocol(LONG lUserID, NET_DVR_PTZCFG *pPtzcfg);
NET_DVR_API BOOL __stdcall NET_DVR_GetPTZCtrl_Other(LONG iUserID, LONG iChannel);
NET_DVR_API BOOL __stdcall NET_DVR_GetPTZCtrl(LONG iRealHandle);
//前面板锁定
NET_DVR_API BOOL __stdcall NET_DVR_LockPanel(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_UnLockPanel(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_StartPanelKey(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_StopPanelKey(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_SetRtspConfig(LONG lUserID, DWORD dwCommand, LPNET_DVR_RTSPCFG lpInBuffer, DWORD dwInBufferSize);
NET_DVR_API BOOL __stdcall NET_DVR_GetRtspConfig(LONG lUserID, DWORD dwCommand, LPNET_DVR_RTSPCFG lpOutBuffer, DWORD dwOutBufferSize);
//能力集获取
NET_DVR_API BOOL __stdcall NET_DVR_GetDeviceAbility(LONG lUserID, DWORD dwAbilityType, char* pInBuf, DWORD dwInLength, char* pOutBuf, DWORD dwOutLength);
NET_DVR_API BOOL __stdcall NET_DVR_SetSimAbilityPath(char * szSimAbilityPath, char *szSDCard);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetSubSystemInfo(LONG lUserID, LPNET_DVR_ALLSUBSYSTEMINFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetSubSystemInfo(LONG lUserID, LPNET_DVR_ALLSUBSYSTEMINFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetCodeSplitter(LONG lUserID, DWORD dwCodeChan, LPNET_DVR_CODESPLITTERINFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetCodeSplitter(LONG lUserID, DWORD dwCodeChan, LPNET_DVR_CODESPLITTERINFO lpInter);
//智能
//设置/获取参数关键字
NET_DVR_API BOOL __stdcall NET_DVR_SetBehaviorParamKey(LONG lUserID, LONG lChannel, DWORD dwParameterKey,int nValue);
NET_DVR_API BOOL __stdcall NET_DVR_GetBehaviorParamKey(LONG lUserID, LONG lChannel, DWORD dwParameterKey,int *pValue);
//获取/设置行为分析目标叠加接口
NET_DVR_API BOOL __stdcall NET_DVR_GetVCADrawMode(LONG lUserID, LONG lChannel, LPNET_VCA_DRAW_MODE lpDrawMode);
NET_DVR_API BOOL __stdcall NET_DVR_SetVCADrawMode(LONG lUserID, LONG lChannel, LPNET_VCA_DRAW_MODE lpDrawMode);
//球机跟踪模式设置接口
NET_DVR_API BOOL __stdcall NET_DVR_SetTrackMode(LONG lUserID, LONG lChannel, LPNET_DVR_TRACK_MODE lpTrackMode);
NET_DVR_API BOOL __stdcall NET_DVR_GetTrackMode(LONG lUserID, LONG lChannel, LPNET_DVR_TRACK_MODE lpTrackMode);
//重启智能库
NET_DVR_API BOOL __stdcall NET_VCA_RestartLib(LONG lUserID, LONG lChannel);
NET_DVR_API BOOL __stdcall NET_DVR_SaveRealData_V30(LONG lRealHandle, DWORD dwTransType, char *sFileName);
#if ((!defined __linux__) && (!defined _WIN64))
NET_DVR_API BOOL __stdcall NET_DVR_EncodeG711Frame(DWORD iType, BYTE *pInBuffer, BYTE *pOutBuffer);
NET_DVR_API BOOL __stdcall NET_DVR_DecodeG711Frame(DWORD iType, BYTE *pInBuffer, BYTE *pOutBuffer);
#elif ((defined __linux__) || (defined _WIN64))
NET_DVR_API BOOL __stdcall NET_DVR_EncodeG711Frame(LPVOID handle, NET_DVR_AUDIOENC_PROCESS_PARAM *p_enc_proc_param);
NET_DVR_API BOOL __stdcall NET_DVR_DecodeG711Frame(LPVOID handle, NET_DVR_AUDIODEC_PROCESS_PARAM *p_dec_proc_param);
NET_DVR_API LPVOID __stdcall NET_DVR_InitG711Decoder();
NET_DVR_API LPVOID __stdcall NET_DVR_InitG711Encoder(NET_DVR_AUDIOENC_INFO *enc_info);
NET_DVR_API BOOL __stdcall NET_DVR_ReleaseG711Encoder(LPVOID pEncodeHandle);
NET_DVR_API BOOL __stdcall NET_DVR_ReleaseG711Decoder(LPVOID pDecHandle);
#endif //(defined _WIN32)
NET_DVR_API LONG __stdcall NET_DVR_FindFileByEvent(LONG lUserID, LPNET_DVR_SEARCH_EVENT_PARAM  lpSearchEventParam);
NET_DVR_API LONG __stdcall NET_DVR_FindFileByEvent_V40(LONG lUserID, LPNET_DVR_SEARCH_EVENT_PARAM_V40  lpSearchEventParam);
NET_DVR_API LONG __stdcall NET_DVR_FindFileByEvent_V50(LONG lUserID, LPNET_DVR_SEARCH_EVENT_PARAM_V50 lpSearchEventParam);
NET_DVR_API LONG __stdcall NET_DVR_FindNextEvent(LONG lSearchHandle, LPNET_DVR_SEARCH_EVENT_RET lpSearchEventRet);
NET_DVR_API LONG __stdcall NET_DVR_FindNextEvent_V40(LONG lSearchHandle, LPNET_DVR_SEARCH_EVENT_RET_V40 lpSearchEventRet);
NET_DVR_API LONG __stdcall NET_DVR_FindNextEvent_V50(LONG lFindHandle, LPNET_DVR_SEARCH_EVENT_RET_V50 lpSearchEventRet);
//停止采用 NET_DVR_FindClose
NET_DVR_API LONG __stdcall NET_DVR_FindPDCInfo(LONG lUserID, LONG lChannel, LPNET_DVR_TIME lpStartTime, LPNET_DVR_TIME lpStopTime);
NET_DVR_API LONG __stdcall NET_DVR_FindNextPDCInfo(LONG lFindHandle,LPNET_DVR_PDC_QUERY lpFindData);
NET_DVR_API BOOL __stdcall NET_DVR_FindPDCClose(LONG lFindHandle);
// 标定校验 
#define NET_DVR_PDC_VERIFY_CALIBRATION          1    //当值为1是为PDC标定校验 pdc传入值为NET_VCA_POINT   传出值为 NET_VCA_RECT结构
#define NET_DVR_VERIFY_BEHAVIOR_CALIBRATION     2    // 行为分析标定线校验 
#define NET_DVR_VERIFY_ITS_CALIBRATION            3    // 智能交通标定校验 
#define NET_DVR_VERIFY_BV_CALIBRATION            5    //双目标定校验
NET_DVR_API BOOL __stdcall  NET_DVR_VerifyCalibration(LONG lUserID, DWORD dwCommand, LONG lChannel, LPVOID lpInBuffer, DWORD dwInBufferSize, LPVOID lpOuterBuffer, DWORD dwOuterBufferSize);
NET_DVR_API BOOL __stdcall  NET_DVR_ResetCounter(LONG lUserID,LONG lChannel);
NET_DVR_API BOOL __stdcall NET_DVR_GetPtzPosition(LONG lUserID, LONG lChannel, LONG lPositionID, LPNET_DVR_PTZ_POSITION lpPtzPosition);
NET_DVR_API BOOL __stdcall NET_DVR_SetPtzPosition(LONG lUserID, LONG lChannel, LONG lPositionID, LPNET_DVR_PTZ_POSITION lpPtzPosition);
NET_DVR_API BOOL __stdcall NET_DVR_SetPatrolTrack(LONG lUserID, LONG lChannel, LONG lPatrolIndex, LPNET_DVR_PATROL_TRACKCFG lpPatrolTrack);
NET_DVR_API BOOL __stdcall NET_DVR_GetPatrolTrack(LONG lUserID, LONG lChannel, LONG lPatrolIndex, LPNET_DVR_PATROL_TRACKCFG lpPatrolTrack);
NET_DVR_API LONG __stdcall NET_DVR_FindNextLog_MATRIX(LONG lLogHandle, LPNET_DVR_LOG_MATRIX lpLogData);
NET_DVR_API LONG __stdcall NET_DVR_FindDVRLog_Matrix(LONG lUserID, LONG lSelectMode, DWORD dwMajorType, DWORD dwMinorType, LPNET_DVR_VEDIOPLATLOG lpVedioPlatLog, LPNET_DVR_TIME lpStartTime, LPNET_DVR_TIME lpStopTime);
NET_DVR_API BOOL __stdcall NET_DVR_ManualSnap(LONG lUserID, NET_DVR_MANUALSNAP const* lpInter, LPNET_DVR_PLATE_RESULT lpOuter);
NET_DVR_API BOOL __stdcall NET_DVR_ContinuousShoot(LONG lUserID, LPNET_DVR_SNAPCFG lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_GetPTZProtocol_Ex(LONG lUserID, LONG lChannel, NET_DVR_PTZCFG *pPtzcfg);
NET_DVR_API LONG __stdcall NET_DVR_StartEmailTest(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_StopEmailTest(LONG lEmailTestHandle);
NET_DVR_API BOOL __stdcall NET_DVR_GetEmailTestProgress(LONG lEmailTestHandle, DWORD* pState);
NET_DVR_API BOOL __stdcall NET_DVR_GetIPCProtoList(LONG lUserID, LPNET_DVR_IPC_PROTO_LIST lpProtoList);
NET_DVR_API BOOL __stdcall NET_DVR_GetIPCProtoList_V41(LONG lUserID, LPNET_DVR_IPC_PROTO_LIST_V41 lpProtoList);
NET_DVR_API LONG __stdcall NET_DVR_SmartSearch(LONG lUserID,  LPNET_DVR_SMART_SEARCH_PARAM lpSmartSearchParam);
NET_DVR_API LONG __stdcall NET_DVR_SmartSearch_V40(LONG lUserID,  LPNET_DVR_SMART_SEARCH_PARAM_V40 lpSmartSearchParam);
NET_DVR_API LONG __stdcall NET_DVR_SearchNextInfo(LONG lSearchHandle, LPNET_DVR_SMART_SEARCH_RET lpSmartSearchRet);
NET_DVR_API BOOL __stdcall NET_DVR_StopSearch(LONG lSearchHandle);
// IP San 文件目录查找
NET_DVR_API LONG __stdcall NET_DVR_FindIpSanDirectory(LONG lUserID, LPNET_DVR_IPSAN_SERACH_PARAM lpIpsanSearchParam);
NET_DVR_API LONG __stdcall NET_DVR_FindNextDirectory(LONG lFindHandle, LPNET_DVR_IPSAN_SERACH_RET lpFindData);
NET_DVR_API BOOL __stdcall NET_DVR_FindDirectoryClose(LONG lFindHandle);
    // typedef void (CALLBACK *REALDATACALLBACK) (LONG lPlayHandle, DWORD dwDataType, BYTE *pBuffer, DWORD dwBufSize, void* pUser);
    // NET_DVR_API LONG __stdcall NET_DVR_ZeroStartPlay(LONG lUserID, LPNET_DVR_CLIENTINFO lpClientInfo, REALDATACALLBACK fRealDataCallBack_V30 = NULL, void* pUser = NULL, BOOL bBlocked = TRUE);
NET_DVR_API BOOL __stdcall NET_DVR_ZeroStopPlay(LONG lPlayHandle);
NET_DVR_API BOOL __stdcall NET_DVR_ZeroMakeKeyFrame(LONG lUserID, LONG lZeroChan);
NET_DVR_API BOOL __stdcall NET_DVR_PlayBackControl_V40(LONG lPlayHandle,DWORD dwControlCode, LPVOID lpInBuffer = NULL, DWORD dwInLen = 0, LPVOID lpOutBuffer = NULL, DWORD *lpOutLen = NULL);
NET_DVR_API BOOL __stdcall NET_DVR_ZeroTurnOver(LONG lUserID, LONG lChannel, BOOL bNextPreview);
NET_DVR_API LONG __stdcall NET_DVR_RealPlay_Card_V30(LONG lUserID, NET_DVR_CARDINFO const *lpCardInfo, LONG lChannelNum, DWORD dwMode, BOOL bBlock, REALDATACALLBACK fRealDataCallBack_V30, void* pUser);
NET_DVR_API BOOL __stdcall NET_DVR_GetDiskList(LONG lUserID, LPNET_DVR_DISKABILITY_LIST lpDiskList);
NET_DVR_API LONG __stdcall NET_DVR_Backup(LONG lUserID, DWORD dwBackupType, LPVOID lpBackupBuff, DWORD dwBackupBuffSize);
NET_DVR_API LONG __stdcall NET_DVR_BackupByName(LONG lUserID, LPNET_DVR_BACKUP_NAME_PARAM lpBackupByName);
NET_DVR_API LONG __stdcall NET_DVR_BackupByTime(LONG lUserID, LPNET_DVR_BACKUP_TIME_PARAM lpBackupBytime);
NET_DVR_API BOOL __stdcall NET_DVR_GetBackupProgress(LONG lHandle, DWORD* pState);
NET_DVR_API BOOL __stdcall NET_DVR_StopBackup(LONG lHandle);
NET_DVR_API BOOL __stdcall NET_DVR_GetSadpInfoList(LONG lUserID, LPNET_DVR_SADPINFO_LIST lpSadpInfoList);
NET_DVR_API BOOL __stdcall NET_DVR_UpdateSadpInfo(LONG lUserID, LPNET_DVR_SADP_VERIFY lpSadpVerify, LPNET_DVR_SADPINFO lpSadpInfo);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetSubDecSystemJoinInfo(LONG lUserID, LPNET_DVR_ALLDECSUBSYSTEMJOININFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_SetCodeSplitterAssociate(LONG lUserID, DWORD dwDecoderChan, DWORD dwSlotNum, LPNET_DVR_CODESPLITTERASSOCIATE lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_GetCodeSplitterAssociate(LONG lUserID, DWORD dwDecoderChan, DWORD dwSlotNum, LPNET_DVR_CODESPLITTERASSOCIATE lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_InquestGetCDRWScheme(LONG lUserID, LPNET_DVR_INQUEST_CDRW_CFG lpCDRWCfg);
NET_DVR_API BOOL __stdcall NET_DVR_InquestSetCDRWScheme(LONG lUserID, LPNET_DVR_INQUEST_CDRW_CFG lpCDRWCfg);
NET_DVR_API BOOL __stdcall NET_DVR_InquestDeleteFile(LONG lUserID, LPNET_DVR_INQUEST_FILES lpDeleteFile);
NET_DVR_API BOOL __stdcall NET_DVR_InquestCDWByFile(LONG lUserID, LPNET_DVR_INQUEST_FILES lpCdrwFile);
NET_DVR_API LONG __stdcall NET_DVR_InquestUploadFile(LONG lUserID, char *sFileName);
NET_DVR_API BOOL __stdcall NET_DVR_InquestUploadClose(LONG lUploadHandle);
NET_DVR_API LONG __stdcall NET_DVR_InquestGetUploadState(LONG lUploadHandle, LPDWORD pProgress);
NET_DVR_API BOOL __stdcall NET_DVR_InquestStartCDW( LONG lUserID, BOOL bPause);
NET_DVR_API BOOL __stdcall NET_DVR_InquestStopCDW(LONG lUserID, BOOL bCancelWrite);
NET_DVR_API BOOL __stdcall NET_DVR_InquestGetCDWState(LONG lUserID, LPNET_DVR_INQUEST_CDRW_STATUS pStatus);
NET_DVR_API BOOL __stdcall NET_DVR_InquestGetPIPStatus(LONG lUserID, LPNET_DVR_INQUEST_PIP_STATUS pStatus);
NET_DVR_API BOOL __stdcall NET_DVR_InquestSetPIPStatus(LONG lUserID, LPNET_DVR_INQUEST_PIP_STATUS pStatus);
NET_DVR_API BOOL __stdcall NET_DVR_InquestCheckSecretKey(LONG lUserID, BOOL *bSecretSet);
NET_DVR_API BOOL __stdcall NET_DVR_InquestSetSecretKey(LONG lUserID, LPNET_DVR_INQUEST_SECRET_INFO pSecretInfo);
NET_DVR_API BOOL __stdcall NET_DVR_InquestStreamEncrypt(LONG lUserID, LONG lChannel, BOOL bEncrypt);
NET_DVR_API BOOL __stdcall NET_DVR_InquestGetEncryptState(LONG  lUserID, LONG lChannel, BOOL *bEncrypt);
NET_DVR_API LONG __stdcall NET_DVR_InquestFindFile(LONG lUserID);
NET_DVR_API LONG __stdcall NET_DVR_InquestFindNextFile(LONG lFindHandle, LPNET_DVR_INQUEST_FILEINFO lpFindData);
NET_DVR_API BOOL __stdcall NET_DVR_InquestFindClose(LONG lFindHandle);
// 9000RH
NET_DVR_API LONG __stdcall NET_DVR_RaidFastConfig(LONG lUserID, char *sName);
NET_DVR_API BOOL __stdcall NET_DVR_FastConfigProcess(LONG lHandle, DWORD *pState);
NET_DVR_API BOOL __stdcall NET_DVR_CloseFastConfig(LONG lHandle);
NET_DVR_API BOOL __stdcall NET_DVR_GetArraySpaceAlloc(LONG lUserID, DWORD dwSlot, LPNET_DVR_ARRAY_SPACE_ALLOC_INFO lpOutBuf);
NET_DVR_API BOOL __stdcall NET_DVR_DelArray(LONG lUserID, DWORD dwID);
NET_DVR_API BOOL __stdcall NET_DVR_CreateArray(LONG lUserID, LPNET_DVR_OPERATE_ARRAY_PARAM lpArrayParam);
NET_DVR_API BOOL __stdcall NET_DVR_CalcArraySize(LONG lUserID, LPNET_DVR_OPERATE_ARRAY_PARAM lpArrayParam, UINT64* lpArraySize);
NET_DVR_API BOOL __stdcall NET_DVR_MigrateArray(LONG lUserID, LPNET_DVR_OPERATE_ARRAY_PARAM lpArrayParam);
NET_DVR_API BOOL __stdcall NET_DVR_RebuildArray(LONG lUserID, LPNET_DVR_OPERATE_ARRAY_PARAM lpArrayParam);
NET_DVR_API BOOL __stdcall NET_DVR_CreateVD(LONG lUserID, LPNET_DVR_OPERATE_VD_PARAM lpVDParam);
NET_DVR_API BOOL __stdcall NET_DVR_CreateVDEx(LONG lUserID, LPNET_DVR_OPERATE_VD_PARAM_EX lpVDParamEx);
NET_DVR_API BOOL __stdcall NET_DVR_DelVD(LONG lUserID, DWORD dwID);
NET_DVR_API BOOL __stdcall NET_DVR_RepairVD(LONG lUserID, DWORD dwID);
NET_DVR_API BOOL __stdcall NET_DVR_SetSpareDisk(LONG lUserID, LPNET_DVR_SPARE_DISK_PARAM lpSpareDisk);
NET_DVR_API BOOL __stdcall NET_DVR_GetPDList(LONG lUserID, LPNET_DVR_PHY_DISK_LIST lpPDList);
NET_DVR_API BOOL __stdcall NET_DVR_GetArrayList(LONG lUserID, LPNET_DVR_ARRAY_LIST lpArrayList);
NET_DVR_API BOOL __stdcall NET_DVR_GetVDList(LONG lUserID, LPNET_DVR_VD_LIST lpVDList);
NET_DVR_API LONG __stdcall NET_DVR_ExpandDisk(LONG lUserID,DWORD dwVDSLot);
NET_DVR_API BOOL __stdcall NET_DVR_GetExpandProgress(LONG lExpandHandle, DWORD* pState);
NET_DVR_API BOOL __stdcall NET_DVR_CloseExpandHandle(LONG lExpandHandle);
    // NET_DVR_API LONG __stdcall NET_DVR_AlgoDebugStart(LONG lUserID, LONG lCHannel, void(CALLBACK *fAlgoLibInfoCallBack)(LONG lHandle, LONG lChannel,char *pRecvDataBuffer, DWORD dwBufSize, void* pUser), void* pUser);
NET_DVR_API BOOL __stdcall NET_DVR_AlgoDebugSend(LONG lHandle, LONG lChannel, char *pSendBuf, DWORD dwBufSize);
NET_DVR_API BOOL __stdcall NET_DVR_AlgoDebugStop(LONG lHandle);
NET_DVR_API BOOL __stdcall NET_DVR_SetLogPrint(BOOL bLogPrint);
NET_DVR_API BOOL __stdcall NET_DVR_SetLogPrintAction(DWORD nLogLevel, DWORD nToDevice, BOOL bEnable, int Reserve1, int Reserve2);
NET_DVR_API BOOL __stdcall NET_DVR_GetPositionRule(LONG lUserID, LONG lChannel, LONG lPositionIndex, LPNET_DVR_POSITION_RULE_CFG lpPositionRule);
NET_DVR_API BOOL __stdcall NET_DVR_GetPositionRule_V41(LONG lUserID, LONG lChannel, LONG lPositionIndex, LPNET_DVR_POSITION_RULE_CFG_V41 lpPositionRule);
NET_DVR_API BOOL __stdcall NET_DVR_SetPositionRule(LONG lUserID, LONG lChannel, LONG lPositionIndex, LPNET_DVR_POSITION_RULE_CFG lpPositionRule);
NET_DVR_API BOOL __stdcall NET_DVR_SetPositionRule_V41(LONG lUserID, LONG lChannel, LONG lPositionIndex, LPNET_DVR_POSITION_RULE_CFG_V41 lpPositionRule);
NET_DVR_API BOOL __stdcall NET_DVR_SetPositionLimitAngle(LONG lUserID, LONG lChannel, LONG lPositionIndex, LPNET_DVR_LIMIT_ANGLE lpLimitAngle);
NET_DVR_API BOOL __stdcall NET_DVR_GetPositionLimitAngle(LONG lUserID, LONG lChannel, LONG lPositionIndex, LPNET_DVR_LIMIT_ANGLE lpLimitAngle);
NET_DVR_API BOOL __stdcall NET_DVR_GetPtzPosition(LONG lUserID, LONG lChannel, LONG lPositionID, LPNET_DVR_PTZ_POSITION lpPtzPosition);
NET_DVR_API BOOL __stdcall NET_DVR_SetPtzPosition(LONG lUserID, LONG lChannel, LONG lPositionID, LPNET_DVR_PTZ_POSITION lpPtzPosition);
NET_DVR_API BOOL __stdcall NET_DVR_SetPatrolTrack(LONG lUserID, LONG lChannel, LONG lPatrolIndex, LPNET_DVR_PATROL_TRACKCFG lpPatrolTrack);
NET_DVR_API BOOL __stdcall NET_DVR_GetPatrolTrack(LONG lUserID, LONG lChannel, LONG lPatrolIndex, LPNET_DVR_PATROL_TRACKCFG lpPatrolTrack);
NET_DVR_API BOOL __stdcall NET_DVR_SetPatrolLimitAngle(LONG lUserID, LONG lChannel, LONG lPatrolIndex, LPNET_DVR_LIMIT_ANGLE lpLimitAngle);
NET_DVR_API BOOL __stdcall NET_DVR_GetPatrolLimitAngle(LONG lUserID, LONG lChannel, LONG lPatrolIndex, LPNET_DVR_LIMIT_ANGLE lpLimitAngle);
NET_DVR_API BOOL __stdcall NET_DVR_SetSceneMode(LONG  lUserID, LONG lChannel, DWORD dwSceneMode);
NET_DVR_API BOOL __stdcall NET_DVR_GetSceneMode(LONG lUserID, LONG lChannel, DWORD  *pSceneMode);
NET_DVR_API BOOL __stdcall NET_DVR_GetVCAVersion(LONG lUserID, LONG lChannel, LPNET_DVR_VCA_VERSION lpVersion);
NET_DVR_API BOOL __stdcall NET_DVR_ContinuousShoot(LONG lUserID, LPNET_DVR_SNAPCFG lpInter);     
NET_DVR_API BOOL __stdcall NET_DVR_MatrixPicAdjust(LONG lUserID, DWORD dwDispChan, DWORD dwPicAdjust, DWORD dwCmdParam); 
NET_DVR_API BOOL __stdcall NET_DVR_AlarmJoinedRecord(LONG lUserID, DWORD dwChan, DWORD dwAlarmSeq, DWORD dwRecordTime, DWORD dwRes);
NET_DVR_API BOOL __stdcall NET_DVR_GetUnitedMatrixInfo(LONG lUserID, LPNET_DVR_UNITEDMATRIXINFO lpInter);
    // typedef LONG(CALLBACK * REGCallBack)(LONG lUserID, LPNET_DVR_REGCALLBACKPARAM pRegCallbackParam, LPNET_DVR_LOGONREPONSEPARAM pInterParam, void *pUser);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetRegisterCallBack(REGCallBack fRegCallBack, void* pUser);
NET_DVR_API BOOL __stdcall NET_DVR_PreviewRequest(LONG lUserID, LONG lChannel, LPNET_DVR_PREVIEWPARAM lpPreviewParam, LPNET_DVR_DEVICENATINFO lpOuter);
    // typedef LONG(CALLBACK * PREVIEWRESPONSECallBack)(LONG lUserID, LONG lStreamHandle, LPNET_DVR_PREVIEWCALLBACKPARAM pPewviewCallbackParam,void *pUser);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetPreviewResponseCallBack(PREVIEWRESPONSECallBack fPreviewResponseCallBack, void *pUser);
NET_DVR_API BOOL __stdcall NET_DVR_PlaybackRequest(LONG lUserID, LPNET_DVR_PLAYBACKREQUESTPARAM lpPlayBackRequestParam);
    // typedef LONG(CALLBACK * PLAYBACKRESPONSECallBack)(LONG lUserID, LONG lPlaybackHandle, LPNET_DVR_PLAYBACKCALLBACKPARAM lpPlaybackParam,void *pUser);     
    // NET_DVR_API BOOL __stdcall NET_DVR_SetPlaybackResponseCallBack(PLAYBACKRESPONSECallBack fPlaybackResponseCallBack, void *pUser);          
    // typedef LONG(CALLBACK * VOICERESPONSECallBack)(LONG lUserID, LONG lVoiceHandle, LONG lVoiceChannel, BYTE nAudioType, void *pUser);     
    // NET_DVR_API BOOL __stdcall NET_DVR_SetVoiceResponseCallBack(VOICERESPONSECallBack fVoiceResponseCallBack, void *pUser);
NET_DVR_API BOOL __stdcall NET_DVR_VoiceRequest(LONG lUserID, LPNET_DVR_VOICEREQUESTPARAM lpVoiceParam);           
NET_DVR_API BOOL __stdcall NET_DVR_AlarmSetupRequest(LONG lUserID, LPNET_DVR_ALARMSETUPREQUESTPARAM lpAlarmSetupParam);
NET_DVR_API BOOL __stdcall NET_DVR_GetDialParam(LONG lUserID, LPNET_DVR_DIALREQUEST lpDialRequest, LPNET_DVR_DIALPARAM lpDialParam);                      
NET_DVR_API BOOL __stdcall NET_DVR_SetDialParam(LONG lUserID, LPNET_DVR_DIALREQUEST lpDialRequest, LPNET_DVR_DIALPARAM lpDialParam);
NET_DVR_API BOOL __stdcall NET_DVR_GetSmsListInfo(LONG lUserID, LPNET_DVR_TIME_EX lpStartTime, LPNET_DVR_TIME_EX lpStopTime, LPNET_DVR_SMSLISTINFO lpSmsListInfo);
NET_DVR_API BOOL __stdcall NET_DVR_GetSmsContent(LONG lUserID, DWORD dwSmsIndex, LPNET_DVR_SMSCONTENT lpSmsContent);
NET_DVR_API BOOL __stdcall NET_DVR_SendSms(LONG lUserID, LPNET_DVR_SMSCONTENT lpSmsContent);
NET_DVR_API LONG __stdcall NET_DVR_StartServer(char *sLocalIP, WORD wLocalPort, BYTE byMode);
NET_DVR_API BOOL __stdcall NET_DVR_StopServer(LONG lServerHandle); 
NET_DVR_API LONG __stdcall NET_DVR_StartRecvNakedDataListen(NAKED_DATA_TYPE type, LPNET_DVR_NAKED_DATA_PARAM pParams);
NET_DVR_API BOOL __stdcall NET_DVR_StopRecvNakedDataListen(LONG lNakedDataRecvHandle);          
    // typedef void(CALLBACK * NAKEDDAtACALLBACK)(DWORD typeInfo, char *pInfo, DWORD dwInfoLen,DWORD dwIPLen, void* pUser);
    // NET_DVR_API BOOL __stdcall  NET_DVR_SetNakedDataRecvCallBack(LONG lNakedDataRecvHandle, void(CALLBACK *fNakedDataCallBack)(DWORD dwTypeInfo, NET_DVR_NAKED_DATA_INFO *pStruNakedDataInfo, char *pInfo, DWORD dwInfoLen, void* pUser), void* pUser);
    // typedef LONG(CALLBACK * ALARMSETUPRESPONSECallBack)(LONG lUserID, LONG lAlarmHandle, void * pUser);         
    // NET_DVR_API BOOL __stdcall NET_DVR_SetAlarmSetupResponseCallBack(ALARMSETUPRESPONSECallBack fAlarmSetupResponseCallBack, void * pUser);
NET_DVR_API BOOL __stdcall NET_DVR_SpringJPEGPicture(LONG lUserID, LONG lChannel, NET_DVR_PUSHJPEGPARA const *lpJpegPara);
NET_DVR_API BOOL __stdcall NET_DVR_SetPushModeParam(LPNET_DVR_PUSHMODEPARAM pPushParam);
NET_DVR_API BOOL __stdcall NET_DVR_AlarmHostSetupAlarmChan(LONG lUserID, NET_DVR_ALARMIN_SETUP *lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_AlarmHostCloseAlarmChan(LONG lUserID, NET_DVR_ALARMIN_SETUP *lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_BypassAlarmChan(LONG lUserID, NET_DVR_ALARMIN_SETUP *lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_UnBypassAlarmChan(LONG lUserID, NET_DVR_ALARMIN_SETUP *lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_AlarmHostAssistantControl(LONG lUserID, DWORD dwType, DWORD dwNumber, DWORD dwCmdParam);
NET_DVR_API BOOL __stdcall NET_DVR_SetAirCondition(LONG lUserID, LONG l485Index, NET_DVR_AIR_CONDITION_PARAM* lpAirConditionParam);
NET_DVR_API BOOL __stdcall NET_DVR_GetAirCondition(LONG lUserID, LONG l485Index, NET_DVR_AIR_CONDITION_PARAM* lpAirConditionParam);
NET_DVR_API BOOL __stdcall NET_DVR_GetDeviceTypeList(LONG lUserID, NET_DVR_DEVICE_TYPE_LIST *lpDeviceTypeList);
NET_DVR_API BOOL __stdcall NET_DVR_GetDeviceProtoList(LONG lUserID, LONG lDeviceType, NET_DVR_DEVICE_PROTO_LIST *lpDeviceProtoList);
NET_DVR_API BOOL __stdcall NET_DVR_GetBatteryVoltage(LONG lUserID, float *pVoltage);
NET_DVR_API BOOL __stdcall NET_DVR_SetAlarmDeviceUser(LONG lUserID, LONG lUserIndex, NET_DVR_ALARM_DEVICE_USER* lpDeviceUser);
NET_DVR_API BOOL __stdcall NET_DVR_GetAlarmDeviceUser(LONG lUserID, LONG lUserIndex, NET_DVR_ALARM_DEVICE_USER* lpDeviceUser);
NET_DVR_API BOOL __stdcall NET_DVR_SetKeyboardUser(LONG lUserID, LONG lUserIndex, NET_DVR_KEYBOARD_USER* lpKeyboardUser);
NET_DVR_API BOOL __stdcall NET_DVR_GetKeyboardUser(LONG lUserID, LONG lUserIndex, NET_DVR_KEYBOARD_USER* lpKeyboardUser);
NET_DVR_API BOOL __stdcall NET_DVR_SetOperateUser(LONG lUserID, LONG lUserIndex, NET_DVR_OPERATE_USER* lpOperateUser);
NET_DVR_API BOOL __stdcall NET_DVR_GetOperateUser(LONG lUserID, LONG lUserIndex, NET_DVR_OPERATE_USER* lpOperateUser);
NET_DVR_API BOOL __stdcall NET_DVR_ControlGateway(LONG lUserID, LONG lGatewayIndex, DWORD dwStaic);
NET_DVR_API BOOL __stdcall NET_DVR_SetAlarmHostOut(LONG lUserID, LONG lAlarmOutPort, LONG lAlarmOutStatic);
    // typedef void(CALLBACK *fAlarmHostSerialDataCallBack)(LONG lSerialHandle, LONG lPort, LONG lDateType, char *pRecvDataBuffer, DWORD  dwBufSize,void *pUser);
    // NET_DVR_API LONG __stdcall NET_DVR_AlarmHostSerialStart(LONG lUserID, LONG lSerialType, fAlarmHostSerialDataCallBack cbSerialDataCallBack, void *pUser);
NET_DVR_API BOOL __stdcall NET_DVR_AlarmHostSerialSend(LONG lSerialHandle,LONG lPort,char *pSendBuf,DWORD dwBufSize);
NET_DVR_API BOOL __stdcall NET_DVR_AlarmHostSerialStop(LONG  lSerialHandle);
NET_DVR_API BOOL __stdcall NET_DVR_GetMatrixPuChan(LONG lUserID, LONG lChanType, NET_DVR_PU_CHAN_LIST* lpChanList);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixAlarmOffMonitor(LONG lUserID, DWORD dwMonID, DWORD dwCamID);
NET_DVR_API BOOL __stdcall NET_DVR_GetCameraListInfo(LONG lUserID, DWORD dwCamNum, DWORD dwStartCam, LPNET_DVR_MATRIX_CAMERALIST lpCamListInfo);
NET_DVR_API BOOL __stdcall NET_DVR_GetMonitorListInfo(LONG lUserID, DWORD dwMonNum, DWORD dwStartMon, LPNET_DVR_MATRIX_MONITORLIST lpMonListInfo);
NET_DVR_API BOOL __stdcall NET_DVR_GetGlobalNum(LONG lUserID, DWORD *dwCamNum, DWORD *dwMonNum); 
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetUnitedMatrixInfo(LONG lUserID, LPNET_DVR_ALLUNITEDMATRIXINFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetUnitedMatrixInfo(LONG lUserID, LPNET_DVR_ALLUNITEDMATRIXINFO lpInter); 
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetGatewayInfo(LONG lUserID, LPNET_DVR_MATRIXGATEWAYINFO lpInter);         
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetGatewayInfo(LONG lUserID, LPNET_DVR_MATRIXGATEWAYINFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSpanSwitch(LONG lUserID, BYTE nSwitchMode, LPNET_DVR_MATRIXSWITCH lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixStartSwitch(LONG lUserID, LPNET_DVR_MATRIXSWITCHCTRL lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetConfigFile(LONG lUserID, LPNET_DVR_MATRIXDATABASE lpInter, char *sInBuffer,  DWORD dwInSize);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetConfigFile(LONG lUserID, LPNET_DVR_MATRIXDATABASE lpInter, char  *sOutBuffer,  DWORD   dwOutSize,  DWORD   *pReturnSize);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetSubSystemInfo_V40(LONG lUserID, LPNET_DVR_ALLSUBSYSTEMINFO_V40 lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetSubSystemInfo_V40(LONG lUserID, LPNET_DVR_ALLSUBSYSTEMINFO_V40 lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetSubDecSystemJoinInfo_V40(LONG lUserID, LPNET_DVR_ALLDECSUBSYSTEMJOININFO_V40 lpInter);
    // typedef void (CALLBACK *FLOWTESTCALLBACK)(LONG lFlowHandle, LPNET_DVR_FLOW_INFO pFlowInfo, void *pUser);
    // NET_DVR_API LONG __stdcall NET_DVR_StartNetworkFlowTest(LONG lUserID, NET_DVR_FLOW_TEST_PARAM* pFlowTest,  FLOWTESTCALLBACK fFlowTestCallback, void *pUser);
NET_DVR_API BOOL __stdcall NET_DVR_StopNetworkFlowTest(LONG lHandle);
NET_DVR_API LONG __stdcall NET_DVR_FindRecordLabel(LONG lUserID, LPNET_DVR_FIND_LABEL lpFindLabel);
NET_DVR_API LONG __stdcall NET_DVR_FindNextLabel(LONG lFindHandle, LPNET_DVR_FINDLABEL_DATA lpFindData);
NET_DVR_API BOOL __stdcall NET_DVR_StopFindLabel(LONG lFindHandle);
NET_DVR_API BOOL __stdcall NET_DVR_InsertRecordLabel(LONG lPlayHandle, NET_DVR_RECORD_LABEL* lpRecordLabel, NET_DVR_LABEL_IDENTIFY *lpLableIdentify);
NET_DVR_API BOOL __stdcall NET_DVR_DelRecordLabel(LONG lUserID, NET_DVR_DEL_LABEL_PARAM* lpDelLabelParam);
NET_DVR_API BOOL __stdcall NET_DVR_ModifyRecordLabel(LONG lUserID, NET_DVR_MOD_LABEL_PARAM * lpModLabelParam);
NET_DVR_API BOOL __stdcall NET_DVR_CapturePlaybackPictureBlock(LONG lPlayHandle, char *sPicFileName, DWORD dwTimeOut);
NET_DVR_API BOOL __stdcall NET_DVR_CapturePlaybackPictureBlock_New(LONG lPlayHandle, char *pPicBuf, DWORD dwPicSize, DWORD *lpSizeReturned);
NET_DVR_API LONG __stdcall NET_DVR_FindPicture(LONG lUserID, NET_DVR_FIND_PICTURE_PARAM* pFindParam);
NET_DVR_API LONG __stdcall NET_DVR_FindNextPicture(LONG lFindHandle,LPNET_DVR_FIND_PICTURE lpFindData);
NET_DVR_API LONG __stdcall NET_DVR_FindNextPicture_V40(LONG lFindHandle,LPNET_DVR_FIND_PICTURE_V40 lpFindData);
NET_DVR_API LONG __stdcall NET_DVR_FindNextPicture_V50(LONG lFindHandle, LPNET_DVR_FIND_PICTURE_V50 lpFindData);
NET_DVR_API BOOL __stdcall NET_DVR_CloseFindPicture(LONG lFindHandle);
NET_DVR_API BOOL __stdcall NET_DVR_GetPicture(LONG lUserID,char *sDVRFileName,const char *sSavedFileName);
NET_DVR_API BOOL __stdcall NET_DVR_GetPicture_V30(LONG lUserID, char *sDVRFileName, char *sSavedFileBuf, DWORD dwBufLen, DWORD *lpdwRetLen);
NET_DVR_API BOOL __stdcall NET_DVR_GetPicture_V50(LONG lUserID, LPNET_DVR_PIC_PARAM lpPicParam);
NET_DVR_API LONG __stdcall NET_DVR_BackupPicture(LONG lUserID, NET_DVR_BACKUP_PICTURE_PARAM *lpBackupPicture);
NET_DVR_API LONG __stdcall NET_DVR_GetUpgradeStep(LONG lUpgradeHandle, LONG *pSubProgress);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetEncodeJoint(LONG lUserID, LONG lChannel, LPNET_DVR_ENCODE_JOINT_PARAM lpEncodeJoint);
NET_DVR_API BOOL  __stdcall NET_DVR_GetLocalIP(char strIP[16][16], DWORD *pValidNum, BOOL *pEnableBind);
NET_DVR_API BOOL  __stdcall NET_DVR_SetValidIP(DWORD dwIPIndex, BOOL bEnableBind);
NET_DVR_API BOOL __stdcall NET_DVR_GetLocalIPv6(BYTE strIP[16][16], DWORD *pValidNum, BOOL *pEnableBind);
NET_DVR_API BOOL __stdcall NET_DVR_SetValidIPv6(DWORD dwIPIndex, BOOL bEnableBind);
NET_DVR_API BOOL __stdcall NET_DVR_GetVcaDevWorkState(LONG lUserID, LPNET_DVR_VCA_DEV_WORKSTATUS lpWorkState);
NET_DVR_API BOOL  __stdcall NET_DVR_SetRecvTimeOut(DWORD nRecvTimeOut = 5000); //最小3000毫秒
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetDisplayCfg_V40(LONG lUserID, DWORD dwDispChanNum, LPNET_DVR_VGA_DISP_CHAN_CFG_V40 lpDisplayCfg);              
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetDisplayCfg_V40(LONG lUserID, DWORD dwDispChanNum, LPNET_DVR_VGA_DISP_CHAN_CFG_V40 lpDisplayCfg);
NET_DVR_API BOOL __stdcall NET_DVR_ShutterCompensation(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_CorrectDeadPixel(LONG lUserID, LONG lChannel, LPNET_DVR_CORRECT_DEADPIXEL_PARAM lpInParam);
NET_DVR_API BOOL __stdcall NET_DVR_CustomConfig(LONG lUserID, LONG lChannel, LPVOID lpInBuffer, DWORD dwInBufferSize, LPVOID lpOutBuffer, DWORD dwOutBufferSize, LPDWORD lpBytesReturned);
NET_DVR_API BOOL __stdcall NET_DVR_GetHistoricDataInfo(LONG lUserID, LONG lChannel, LPNET_DVR_HISTORICDATACFG lpHisData);
NET_DVR_API BOOL __stdcall NET_DVR_GetHistoricData(LONG lUserID, LONG lChannel, LPNET_DVR_PLATE_RESULT lpOuter);
NET_DVR_API BOOL __stdcall NET_DVR_ClearHistoricData(LONG lUserID, LONG lChannel);
NET_DVR_API BOOL __stdcall NET_VPD_SetShutter(LONG lUserID, LONG lChannel, LPNET_VPD_SHUTTER lpShutter);
NET_DVR_API BOOL __stdcall NET_VPD_SendPicture(LONG lUserID, DWORD dwFields, BYTE const *sImageBuffer, DWORD dwWidth, DWORD dwHeight);
NET_DVR_API LONG  __stdcall NET_DVR_InquestUploadFile_V30(LONG lUserID, LPNET_DVR_INQUEST_ROOM lpInquestRoom,  char *sFileName);
NET_DVR_API BOOL  __stdcall NET_DVR_InquestDeleteFile_V30(LONG lUserID, LPNET_DVR_INQUEST_ROOM lpInquestRoom, LPNET_DVR_INQUEST_FILES lpDeleteFile);
NET_DVR_API BOOL  __stdcall NET_DVR_InquestGetPIPStatus_V30(LONG lUserID, LPNET_DVR_INQUEST_ROOM lpInquestRoom, LPNET_DVR_INQUEST_PIP_STATUS lpStatus);
NET_DVR_API BOOL  __stdcall NET_DVR_InquestSetPIPStatus_V30(LONG lUserID, LPNET_DVR_INQUEST_ROOM lpInquestRoom, LPNET_DVR_INQUEST_PIP_STATUS lpStatus);
NET_DVR_API BOOL __stdcall NET_DVR_InquestGetPIPStatus_V40(LONG lUserID, NET_DVR_INQUEST_ROOM const *lpInquestRoom, LPNET_DVR_INQUEST_PIP_STATUS_V40 lpStatus);
NET_DVR_API BOOL __stdcall NET_DVR_InquestSetPIPStatus_V40(LONG lUserID, NET_DVR_INQUEST_ROOM const *lpInquestRoom, LPNET_DVR_INQUEST_PIP_STATUS_V40 lpStatus);
NET_DVR_API BOOL  __stdcall NET_DVR_InquestGetSystemInfo(LONG lUserID, LPNET_DVR_INQUEST_SYSTEM_INFO lpSystemInfo);
NET_DVR_API BOOL  __stdcall NET_DVR_InquestSetSystemInfo(LONG lUserID, LPNET_DVR_INQUEST_SYSTEM_INFO lpSystemInfo);
NET_DVR_API BOOL  __stdcall NET_DVR_InquestSendMessage(LONG lUserID, LPNET_DVR_INQUEST_ROOM lpInquestRoom, LPNET_DVR_INQUEST_MESSAGE lpInquestMessage);
NET_DVR_API BOOL  __stdcall NET_DVR_InquestStartCDW_V30(LONG lUserID, LPNET_DVR_INQUEST_ROOM lpInquestRoom, BOOL bNotBurn);
NET_DVR_API BOOL  __stdcall NET_DVR_InquestStopCDW_V30(LONG lUserID, LPNET_DVR_INQUEST_ROOM lpInquestRoom, BOOL bCancelWrite);
NET_DVR_API BOOL  __stdcall NET_DVR_InquestGetCDWState_V30(LONG lUserID, LPNET_DVR_INQUEST_ROOM lpInquestRoom, LPNET_DVR_INQUEST_CDRW_STATUS pStatus);
NET_DVR_API LONG  __stdcall NET_DVR_InquestResumeEvent(LONG lUserID, LPNET_DVR_INQUEST_RESUME_EVENT lpResumeEvent);
NET_DVR_API BOOL  __stdcall NET_DVR_InquestGetResumeProgress(LONG lHandle, DWORD* pState);
NET_DVR_API BOOL  __stdcall NET_DVR_InquestStopResume(LONG lHandle);
NET_DVR_API LONG  __stdcall NET_DVR_InquestFindFile_V30(LONG lUserID, LPNET_DVR_INQUEST_ROOM pInquestRoom);
NET_DVR_API BOOL  __stdcall NET_DVR_InquestGetDeviceVersion(LONG lUserID, LPNET_DVR_INQUEST_DEVICE_VERSION lpVersionInfo);
NET_DVR_API BOOL  __stdcall NET_DVR_SetSDKSecretKey(LONG lUserID, char *sSecretKey);
NET_DVR_API BOOL __stdcall NET_DVR_LockFileByTime(LONG lUserID, LPNET_DVR_TIME_LOCK lpLockPara, LPNET_DVR_LOCK_RETURN lpLockReturn);
NET_DVR_API BOOL __stdcall NET_DVR_UnlockFileByTime(LONG lUserID, LPNET_DVR_TIME_LOCK lpLockPara, LPNET_DVR_LOCK_RETURN lpLockReturn);
NET_DVR_API BOOL __stdcall NET_DVR_ScreenZoomIn(LONG lUserID, LPNET_DVR_SCREENZOOM pStruScreen);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetAllCameraInfo(LONG lUserID, LPNET_DVR_MATRIX_CAMERALIST lpCamListInfo);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetSingleCameraInfo(LONG lUserID, DWORD dwCameraId, LPNET_MATRIX_CAMERAINFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixAddCamera(LONG lUserID, DWORD dwCameraNum, BYTE *pBuffer, DWORD dwBufLength);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixModCameraInfo(LONG lUserID, LPNET_MATRIX_CAMERAINFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixDelCamera(LONG lUserID, DWORD dwCameraId);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetAllMonitorInfo(LONG lUserID, LPNET_DVR_MATRIX_MONITORLIST lpMonListInfo);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetSingleMonitorInfo(LONG lUserID, DWORD dwMonitorId, LPNET_MATRIX_MONITORINFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixAddMonitor(LONG lUserID, DWORD dwMonitorNum, BYTE *pBuffer, DWORD dwBufLength);            
NET_DVR_API BOOL __stdcall NET_DVR_MatrixModMonitorInfo(LONG lUserID, LPNET_MATRIX_MONITORINFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixDelMonitor(LONG lUserID, DWORD dwMonitorId);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetAllMatrixInfo(LONG lUserID, LPNET_DVR_MATRIXLIST lpMatrixListInfo);
NET_DVR_API BOOL __stdcall NET_DVR_GetSingleMatrixInfo(LONG lUserID, DWORD dwMatrixId, LPNET_MATRIX_MATRIXINFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_AddMatrix(LONG lUserID, LPNET_MATRIX_MATRIXINFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_ModMatrixInfo(LONG lUserID, LPNET_MATRIX_MATRIXINFO lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_DelMatrix(LONG lUserID, DWORD dwMatrixId);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetUartParam(LONG lUserID, DWORD dwSerialChan, LPNET_MATRIX_UARTPARAM lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetUartParam(LONG lUserID, DWORD dwSerialChan , LPNET_MATRIX_UARTPARAM lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetUserInfo(LONG lUserID, DWORD dwUserNum, LPNET_MATRIX_USERPARAM lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixAddUser(LONG lUserID, DWORD dwUserNum, LPNET_MATRIX_USERPARAM lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixModUserInfo(LONG lUserID, DWORD dwUserNum, LPNET_MATRIX_USERPARAM lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixDelUser(LONG lUserID, DWORD dwUserNum);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetResourceInfo(LONG lUserID, DWORD dwResourceNum, LPNET_MATRIX_RESOURSEGROUPPARAM lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixAddResourceInfo(LONG lUserID, DWORD dwResourceNum, LPNET_MATRIX_RESOURSEGROUPPARAM lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixModResourceInfo(LONG lUserID, DWORD dwResourceNum, LPNET_MATRIX_RESOURSEGROUPPARAM lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixDelResourceInfo(LONG lUserID, DWORD dwResourceNum);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetUserGroupInfo(LONG lUserID, DWORD dwUserGroupNum, LPNET_MATRIX_USERGROUPPARAM lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixAddUserGroupInfo(LONG lUserID, DWORD dwUserGroupNum, LPNET_MATRIX_USERGROUPPARAM lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixModUserGroupInfo(LONG lUserID, DWORD dwUserGroupNum, LPNET_MATRIX_USERGROUPPARAM lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixDelUserGroup (LONG lUserID, DWORD dwUserGroupNum);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetAllTrunkInfo(LONG lUserID, LPNET_DVR_MATRIX_TRUNKLIST lpTrunkListInfo);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetTrunkInfo(LONG lUserID, DWORD dwTrunkNum, LPNET_MATRIX_TRUNKPARAM lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixAddTrunk(LONG lUserID, LPNET_MATRIX_TRUNKPARAM lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixModTrunkInfo(LONG lUserID, LPNET_MATRIX_TRUNKPARAM lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixTrunkCtrl(LONG lUserID, DWORD dwTrunkNum, BYTE byCtrlMode);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixTrunkStatusQuery(LONG lUserID, DWORD dwTrunkNum, BYTE *byTrunkStatus);
NET_DVR_API BOOL __stdcall NET_DVR_FindBackgroundPic(LONG lUserID, DWORD dwPicID, BYTE *pPicBuffer, DWORD *lpPicLen);
NET_DVR_API BOOL __stdcall NET_DVR_DetectImage(LONG lUserID, LPNET_VCA_FD_PROCIMG_CFG lpFDProcImg,LPNET_VCA_FD_PROCIMG_RESULT lpOutBuf);
NET_DVR_API BOOL __stdcall NET_DVR_GetPictureModel(LONG lUserID, LPNET_VCA_REGISTER_PIC lpInBuf, LPNET_VCA_PICMODEL_RESULT lpOutBuf);
NET_DVR_API BOOL __stdcall NET_DVR_AddBlackList(LONG lUserID,LONG lChannel,LPNET_VCA_BLACKLIST_PARA lpInter);
NET_DVR_API LONG __stdcall NET_DVR_FindBlackList(LONG lUserID, LPNET_VCA_BLACKLIST_COND lpBlackListCond);
NET_DVR_API LONG __stdcall NET_DVR_FindNextBlackList(LONG lFindHandle,LPNET_VCA_BLACKLIST_INFO lpFindData);
NET_DVR_API BOOL __stdcall NET_DVR_FindBlackListClose(LONG lFindHandle);
NET_DVR_API BOOL __stdcall NET_DVR_GetBlackListPicture(LONG lUserID, DWORD dwRegisterID, LPNET_VCA_BLACKLIST_PIC lpOutBuffer);
NET_DVR_API BOOL __stdcall NET_DVR_UpdateBlackList(LONG lUserID,LONG lChannel, LPNET_VCA_BLACKLIST_PARA lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_DelBlackList(LONG lUserID,LONG lChannel, DWORD dwRegisterID);
NET_DVR_API LONG __stdcall NET_DVR_FindSnapPicture(LONG lUserID, LPNET_VCA_FIND_PICTURECOND lpFindParam);
NET_DVR_API LONG __stdcall NET_DVR_FindNextSnapPic(LONG lFindHandle,LPNET_VCA_SUB_SNAPPIC_DATA lpFindData);
NET_DVR_API BOOL __stdcall NET_DVR_FindSnapPicClose(LONG lFindHandle);
NET_DVR_API LONG __stdcall NET_DVR_AdvanceFindSnapPicture(LONG lUserID, LPNET_VCA_FIND_PICTURECOND_ADVANCE lpFindParam);
NET_DVR_API LONG __stdcall NET_DVR_FindFaceMatchAlarm(LONG lUserID, LPNET_VCA_FIND_PICTURECOND lpFindParam);
NET_DVR_API LONG __stdcall NET_DVR_FindNextFaceMatchAlarm(LONG lFindHandle, LPNET_VCA_FACESNAP_MATCH_ALARM_LOG lpFaceMatchAlarmLog);
NET_DVR_API BOOL __stdcall NET_DVR_FindFaceMatchAlarmClose(LONG lFindHandle);
NET_DVR_API BOOL __stdcall NET_DVR_GetFaceMatchPic(LONG lUserID, LPNET_VCA_FACEMATCH_PICCOND lpMatchCond, LPNET_VCA_FACEMATCH_PICTURE lpMatchPic);
NET_DVR_API BOOL __stdcall NET_DVR_FastAddBlackList(LONG lUserID,LONG lChannel,LPNET_VCA_BLACKLIST_FASTREGISTER_PARA lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetRemotePlay_V41(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_DEC_REMOTE_PLAY_V41 lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetDisplayCfg_V41(LONG lUserID, DWORD dwDispChanNum, LPNET_DVR_MATRIX_VOUTCFG lpVoutCfg);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetDisplayCfg_V41(LONG lUserID, DWORD dwDispChanNum, LPNET_DVR_MATRIX_VOUTCFG lpDisplayCfg);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetDeviceStatus_V41(LONG lUserID, LPNET_DVR_DECODER_WORK_STATUS_V41 lpDecoderCfg);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetSceneCfg(LONG lUserID, DWORD dwSceneNum, LPNET_DVR_MATRIX_SCENECFG lpSceneCfg);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetSceneCfg(LONG lUserID, DWORD dwSceneNum, LPNET_DVR_MATRIX_SCENECFG lpSceneCfg);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSceneControl(LONG lUserID, DWORD dwSceneNum, DWORD dwCmd, DWORD dwCmdParam);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetCurrentSceneMode(LONG lUserID, DWORD *dwSceneNum);
NET_DVR_API BOOL __stdcall NET_DVR_GetAllValidWinInfo(LONG lUserID, LPNET_DVR_WINLIST lpWinListInfo);
NET_DVR_API BOOL __stdcall NET_DVR_ScreenWinCtrl(LONG lUserID, DWORD dwWinIndex, DWORD dwCommand, LPNET_DVR_SCREEN_WINCFG lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_GetScreenInputStatus(LONG lUserID, LPNET_DVR_SCREENINPUTSTATUS lpStatus);
NET_DVR_API LONG __stdcall NET_DVR_PicUpload(LONG lUserID, char const *sFileName, LPNET_DVR_PICTURECFG lpPictureCfg);
NET_DVR_API LONG __stdcall NET_DVR_GetPicUploadProgress(LONG lUploadHandle);
NET_DVR_API BOOL __stdcall  NET_DVR_CloseUploadHandle(LONG lUploadHandle);        
NET_DVR_API BOOL __stdcall NET_DVR_PicControl(LONG lUserID, BYTE byUseType, BYTE byPicIndex, BYTE byCtrlCmd);
NET_DVR_API LONG __stdcall NET_DVR_GetPicUploadState(LONG lUploadHandle);
NET_DVR_API BOOL __stdcall NET_DVR_ScreenCtrl(LONG lUserID, DWORD dwDeviceNum, LPNET_DVR_SCREEN_CONTROL lpStruScreenCtrl);
    // typedef void (CALLBACK *SCREENPICDATACB)(LONG nScreenPicHandle, DWORD dwDataType, BYTE *pBuffer, DWORD dwBufSize, void *pUser);
    // NET_DVR_API LONG __stdcall NET_DVR_StartScreenPic(LONG nUserID, DWORD nInputNum, SCREENPICDATACB PicDataCallback, void *pUserData);
NET_DVR_API BOOL __stdcall NET_DVR_StopScreenPic(LONG nScreenPicHandle);
NET_DVR_API BOOL __stdcall NET_DVR_FocusOnePush(LONG lUserID, LONG lChannel);
NET_DVR_API BOOL __stdcall NET_DVR_ResetLens(LONG lUserID, LONG lChannel);
    // typedef void(CALLBACK *fRemoteConfigCallback)(DWORD dwType, void* lpBuffer, DWORD dwBufLen, void* pUserData);
    // NET_DVR_API LONG __stdcall NET_DVR_StartRemoteConfig(LONG lUserID, DWORD dwCommand, LPVOID lpInBuffer, DWORD dwInBufferLen, fRemoteConfigCallback cbStateCallback, LPVOID pUserData);
NET_DVR_API BOOL __stdcall NET_DVR_StopRemoteConfig(LONG lHandle);
NET_DVR_API LONG __stdcall NET_DVR_GetNextRemoteConfig(LONG lHandle, void* lpOutBuff, DWORD dwOutBuffSize);
NET_DVR_API BOOL __stdcall NET_DVR_GetRemoteConfigState(LONG lHandle, void *pState);
NET_DVR_API BOOL __stdcall NET_DVR_SendRemoteConfig(LONG lHandle, DWORD dwDataType, char *pSendBuf, DWORD dwBufSize);
NET_DVR_API LONG __stdcall NET_DVR_SendWithRecvRemoteConfig(LONG lHandle, void* lpInBuff, DWORD dwInBuffSize, void* lpOutBuff, DWORD dwOutBuffSize, DWORD *dwOutDataLen);
    // typedef void(CALLBACK *fLongCfgStateCallback)(LONG lHandle,  DWORD dwState, LPVOID pUserData);
NET_DVR_API BOOL __stdcall NET_DVR_CloseLongCfgHandle(LONG lHandle);
    // NET_DVR_API LONG __stdcall NET_DVR_RaidPullDiskStart(LONG lUserID, LONG lRaidID, fLongCfgStateCallback cbStateCallback, LPVOID pUserData);
    // NET_DVR_API LONG __stdcall NET_DVR_ScanRaidStart(LONG lUserID, fLongCfgStateCallback cbStateCallback, LPVOID pUserData);
    // NET_DVR_API LONG __stdcall NET_DVR_SetAccessCameraInfo(LONG lUserID, DWORD dwChannel, LPNET_DVR_ACCESS_CAMERA_INFO lpCameraInfo, fLongCfgStateCallback cbStateCallback, LPVOID pUserData);
NET_DVR_API BOOL __stdcall NET_DVR_InquiryRecordTimeSpan(LONG lUserID, DWORD dwChannel,  NET_DVR_RECORD_TIME_SPAN_INQUIRY const *lpInquiry, LPNET_DVR_RECORD_TIME_SPAN lpResult);
NET_DVR_API BOOL __stdcall NET_DVR_UpdateRecordIndex(LONG lUserID, DWORD dwChannel);
NET_DVR_API BOOL __stdcall NET_DVR_GetUpnpNatState(LONG lUserID, LPNET_DVR_UPNP_NAT_STATE lpState);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetLoopPlanArray(LONG lUserID, DWORD dwArrayNum, LPNET_DVR_MATRIX_LOOP_DECINFO_V30 lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetLoopPlanArray(LONG lUserID, DWORD dwArrayNum, NET_DVR_MATRIX_LOOP_DECINFO_V30 const *lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetAlarmShowMode(LONG lUserID, LPNET_DVR_ALARMMODECFG lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetAlarmShowMode(LONG lUserID, NET_DVR_ALARMMODECFG const *lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixStartDynamicAssociateDecode(LONG lUserID, DWORD dwDecChanNum, NET_DVR_DYNAMICDECODE const *lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixAlarmTurn(LONG lUserID, DWORD dwDecChanNum, DWORD dwTurnParam);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixAlarmShowControl(LONG lUserID, DWORD dwDecChanNum, DWORD dwShowMode);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetPlanDecode(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_PLANDECODE lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetPlanDecode(LONG lUserID, DWORD dwDecChanNum, NET_DVR_PLANDECODE const *lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetLoopDecChanInfo_EX(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_LOOP_DECINFO_EX lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetLoopDecChanInfo_EX(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_LOOP_DECINFO_EX lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixStartDynamic_EX(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_PU_STREAM_CFG_EX lpDynamicInfo);
NET_DVR_API BOOL __stdcall NET_DVR_GetTrunkListInfo(LONG lUserID, DWORD dwTrunkNum, DWORD dwStartTrunk, LPNET_DVR_MATRIX_TRUNKLIST lpTrunkListInfo, DWORD *pReturnSize);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetSubDecSystemJoinInfo_V41(LONG lUserID, LPNET_DVR_ALLDECSUBSYSTEMJOININFO_V41 lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_AlarmHostSubSystemSetupAlarmChan(LONG lUserID, DWORD dwSubSystemNum);
NET_DVR_API BOOL __stdcall NET_DVR_AlarmHostSubSystemCloseAlarmChan(LONG lUserID, DWORD dwSubSystemNum);
NET_DVR_API BOOL __stdcall NET_DVR_AlarmHostClearAlarm(LONG lUserID, DWORD dwSubSystemNum);
NET_DVR_API BOOL __stdcall NET_DVR_AlarmHostArrayBypass(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_AlarmHostArrayBypassResume (LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_AlarmHostSetReportMode(LONG lUserID, LONG lCenterNum, LPVOID lpInputBuf, DWORD dwInputBufLen);
NET_DVR_API BOOL __stdcall NET_DVR_AlarmHostGetReportMode(LONG lUserID, LPVOID lpOutputBuf, DWORD dwOutputBufLen);
NET_DVR_API LONG __stdcall NET_DVR_StartUploadAudio(LONG lUserID, DWORD dwAudioNum, DWORD dwAudioType, char const *sAudioFileName);
NET_DVR_API LONG __stdcall NET_DVR_StartDownloadAudio(LONG lUserID, DWORD dwAudioNum, char const *sAudioFileName);
NET_DVR_API BOOL __stdcall NET_DVR_StopAudioOperate(LONG lAudioHandle);
NET_DVR_API LONG __stdcall NET_DVR_GetAudioProgress(LONG lAudioHandle);
NET_DVR_API BOOL __stdcall NET_DVR_AudioCtrl(LONG lUserID, DWORD dwAudioNum, DWORD dwCtrlParam);
NET_DVR_API BOOL __stdcall NET_DVR_GetDeviceConfig(LONG lUserID, DWORD dwCommand, DWORD dwCount, LPVOID lpInBuffer, DWORD dwInBufferSize, LPVOID lpStatusList, LPVOID lpOutBuffer, DWORD dwOutBufferSize);
NET_DVR_API BOOL __stdcall NET_DVR_SetDeviceConfig(LONG lUserID, DWORD dwCommand, DWORD dwCount, LPVOID lpInBuffer, DWORD dwInBufferSize, LPVOID lpStatusList, LPVOID lpInParamBuffer, DWORD dwInParamBufferSize);
NET_DVR_API BOOL __stdcall NET_DVR_LockStreamFileByTime(LONG lUserID, LPNET_DVR_STREAM_TIME_LOCK lpLockPara, LPNET_DVR_LOCK_RETURN lpLockReturn);
NET_DVR_API BOOL __stdcall NET_DVR_UnlockStreamFileByTime(LONG lUserID, LPNET_DVR_STREAM_TIME_LOCK lpLockPara, LPNET_DVR_LOCK_RETURN lpLockReturn);
NET_DVR_API BOOL __stdcall NET_DVR_StartManualRecord(LONG lUserID, LPNET_DVR_MANUAL_RECORD_PARA lpManualRecPara);
NET_DVR_API BOOL __stdcall NET_DVR_StopManualRecord(LONG lUserID, LPNET_DVR_STREAM_INFO pIDInfo);
NET_DVR_API LONG __stdcall NET_DVR_PlayBackReverseByName(LONG lUserID, char *sPlayBackFileName, HWND hWnd);
NET_DVR_API LONG __stdcall NET_DVR_PlayBackByTime_V40(LONG lUserID, NET_DVR_VOD_PARA const* pVodPara);
NET_DVR_API LONG __stdcall NET_DVR_PlayBackByTime_V50(LONG lUserID, NET_DVR_VOD_PARA_V50 const* pVodPara);
NET_DVR_API LONG __stdcall NET_DVR_PlayBackReverseByTime_V40(LONG lUserID, HWND hWnd, LPNET_DVR_PLAYCOND pPlayCond);
NET_DVR_API LONG __stdcall NET_DVR_GetFileByTime_V40(LONG lUserID, char *sSavedFileName, LPNET_DVR_PLAYCOND  pDownloadCond);
NET_DVR_API LONG __stdcall NET_DVR_FindFile_V40(LONG lUserID, LPNET_DVR_FILECOND_V40 pFindCond);
NET_DVR_API LONG __stdcall NET_DVR_SetupAlarmChan_V41(LONG lUserID, LPNET_DVR_SETUPALARM_PARAM lpSetupParam);
NET_DVR_API BOOL __stdcall NET_DVR_AddDataBase(LONG lUserID, LPNET_VCA_DATABASE_PARAM lpInBuf);
NET_DVR_API LONG __stdcall NET_DVR_FindDataBase(LONG lUserID, LPNET_VCA_FIND_DATABASE_COND lpInBuf);
NET_DVR_API LONG __stdcall NET_DVR_FindNextDataBase(LONG lFindHandle, LPNET_VCA_DATABASE_PARAM lpOutBuf);
NET_DVR_API BOOL __stdcall NET_DVR_FindDataBaseClose(LONG lFindHandle);
NET_DVR_API BOOL __stdcall NET_DVR_UpdateDataBase(LONG lUserID, LPNET_VCA_DATABASE_PARAM lpInBuf);
NET_DVR_API BOOL __stdcall NET_DVR_DeleteDataBase(LONG lUserID, LPNET_VCA_DELETE_DATABASE_COND lpCond);
    // typedef void(CALLBACK *fSearchDBCallBack)(LONG lHandle, DWORD dwType, DWORD dwResultNum, BYTE* pBuffer, DWORD dwBufSize,void *pUser);
    // NET_DVR_API LONG __stdcall NET_DVR_InquireSnapDBRecord(LONG lUserID, DWORD dwDataBaseID, LPNET_VCA_INQUIRE_SNAPDB_COND lpInBuf, fSearchDBCallBack cbSearchDBCallBack, void *pUser);
NET_DVR_API BOOL __stdcall NET_DVR_GetInquireSnapDBProgress(LONG lInquireHandle, DWORD* pState);
NET_DVR_API BOOL __stdcall NET_DVR_DeleteSnapDBRecord(LONG lUserID, DWORD dwDataBaseID, LPNET_VCA_DELETE_SNAPRECORD_COND lpInBuf);
    // NET_DVR_API LONG __stdcall NET_DVR_SearchSnapDB(LONG lUserID, LPNET_VCA_SEARCH_SNAPDB_COND lpInBuf, fSearchDBCallBack cbSearchDBCallBack, void *pUser);
NET_DVR_API BOOL __stdcall NET_DVR_GetSearchSnapDBProgress(LONG lSearchHandle, DWORD* pState);
NET_DVR_API BOOL __stdcall NET_DVR_AddFaceDBRecord(LONG lUserID, DWORD dwDataBaseID, LPNET_VCA_DATARECORD_INFO lpInBuf);
NET_DVR_API BOOL __stdcall NET_DVR_FastAddFaceDBRecord(LONG lUserID, DWORD dwDataBaseID, LPNET_VCA_FAST_DATARECORD_INFO lpInBuf);
    // NET_DVR_API LONG __stdcall NET_DVR_InquireFaceDBRecord(LONG lUserID, LPNET_VCA_DATARECORD_COND lpInBuf,fSearchDBCallBack cbInquireDBCallBack, void *pUser);
NET_DVR_API BOOL __stdcall NET_DVR_GetInquireFaceDBProgress(LONG lInquireHandle, DWORD* pState);
NET_DVR_API BOOL __stdcall NET_DVR_UpdateFaceDBRecord(LONG lUserID, DWORD dwDataBaseID, LPNET_VCA_DATARECORD_INFO lpInBuf);
NET_DVR_API BOOL __stdcall NET_DVR_DeleteFaceDBRecord(LONG lUserID, DWORD dwDataBaseID, LPNET_VCA_DELETE_RECORD_COND lpInBuf);
    // typedef void(CALLBACK *fSearchDBCallBack)(LONG lSearchHandle, DWORD dwType, DWORD dwResultNum, BYTE* pBuffer, DWORD dwBufSize,void *pUser);
    // NET_DVR_API LONG __stdcall NET_DVR_SearchFaceDB(LONG lUserID, LPNET_VCA_SEARCH_FACEDB_COND lpInBuf,fSearchDBCallBack cbSearchDBCallBack, void *pUser);
NET_DVR_API BOOL __stdcall NET_DVR_GetSearchFaceDBProgress(LONG lSearchHandle, DWORD* pState);
NET_DVR_API BOOL __stdcall NET_DVR_StopSearchDB(LONG lHandle);
NET_DVR_API BOOL __stdcall NET_DVR_FindMatchPicture(LONG lUserID, LPNET_VCA_FIND_MATCHPIC_COND lpFindCond, LPNET_VCA_FIND_MATCHPIC_RESULT lpFindResult);
NET_DVR_API BOOL __stdcall NET_DVR_RemoteControl(LONG lUserID, DWORD dwCommand, LPVOID lpInBuffer, DWORD dwInBufferSize);
NET_DVR_API LONG __stdcall NET_DVR_GetBMPByTime(LONG lUserID, LONG lChannel, NET_DVR_TIME const *lpTime, char const *sFilename);
NET_DVR_API BOOL __stdcall NET_DVR_CommandDevice(LONG lUserID, DWORD dwOutCommand, LPVOID lpInBuffer, DWORD dwInBufferSize);
NET_DVR_API BOOL __stdcall NET_DVR_TestDVRAlive(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_PicViewRequest(LONG lUserID, NET_DVR_PIC_VIEW_PARAM *lpPicViewParam);
    // typedef LONG (CALLBACK *PicViewCallBack)(LPNET_DVR_PICVIEW_CALLBACKPARAM pStruPicViewParam, void *pUser);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetPicViewResponseCallBack(PicViewCallBack fPicViewResponseCallBack, void *pUser);
NET_DVR_API BOOL __stdcall NET_DVR_SetPicViewDataCallBack(LONG lPicViewHandle, SCREENPICDATACB fPicDataCallback, void *pUserData);
NET_DVR_API BOOL __stdcall NET_DVR_GetDevList(LONG lUserID, LPNET_DVR_DEVLIST lpDevListInfo);
NET_DVR_API BOOL __stdcall NET_DVR_GetScreenList(LONG lUserID, LPNET_DVR_SCREENLIST lpScreenListInfo);
NET_DVR_API BOOL __stdcall NET_DVR_SetScreenRelation(LONG lUserID, NET_DVR_DISP_SCREEN const* lpScreenInfo);
NET_DVR_API BOOL __stdcall NET_DVR_TextShowCtrl(LONG lUserID, DWORD dwDeviceIndex, LPNET_DVR_TEXTSHOW lpText);
NET_DVR_API LONG __stdcall NET_DVR_StartUpgrade(LONG lUserID, LPNET_DVR_OPERATE_DEVICE lpStruOperate, DVCS_UPGRADESTATE_CB UpgradeStateCallback, void *pUserData);
NET_DVR_API BOOL __stdcall NET_DVR_StopUpgrade(LONG lUserID, LPNET_DVR_OPERATE_DEVICE lpStruOperate, LONG lUpgradeHandle);
NET_DVR_API BOOL __stdcall NET_DVR_AddNetSignal(LONG lUserID, LPNET_DVR_NETSIGNAL_INFO lpStruSignal, void* lpOutBuf , DWORD dwBufLen);
NET_DVR_API LONG __stdcall NET_DVR_StartPicPreview(LONG lUserID, NET_DVR_START_PIC_VIEW_INFO const* lpStruStartPicView, SCREENPICDATACB PicDataCallback, void *pUserData);
NET_DVR_API BOOL __stdcall NET_DVR_GetDeviceStatus(LONG lUserID, DWORD dwCommand, DWORD dwCount, LPVOID lpInBuffer, DWORD dwInBufferSize, LPVOID lpStatusList, LPVOID lpOutBuffer, DWORD dwOutBufferSize);
NET_DVR_API BOOL __stdcall NET_DVR_GetPlanList(LONG lUserID, DWORD dwDevNum, LPNET_DVR_PLAN_LIST lpPlanList);
NET_DVR_API BOOL __stdcall NET_DVR_GetInputSignalList(LONG lUserID, DWORD dwDevNum, LPNET_DVR_INPUT_SIGNAL_LIST lpInputSignalList);
NET_DVR_API BOOL __stdcall NET_DVR_GetInputSignalList_V40(LONG lUserID, DWORD dwDevNum, LPNET_DVR_INPUT_SIGNAL_LIST lpInputSignalList);
NET_DVR_API LONG __stdcall NET_DVR_UploadFile(LONG lUserID, DWORD dwUploadType, LPVOID lpInBuffer, DWORD dwInBufferSize, char* sFileName);
NET_DVR_API LONG __stdcall NET_DVR_UploadFile_V40(LONG lUserID, DWORD dwUploadType, LPVOID lpInBuffer, DWORD dwInBufferSize, char const * sFileName, LPVOID lpOutBuffer, DWORD dwOutBufferSize);
NET_DVR_API LONG __stdcall NET_DVR_GetUploadState(LONG lUploadHandle, LPDWORD pProgress);
NET_DVR_API BOOL __stdcall NET_DVR_GetUploadResult(LONG lUploadHandle, LPVOID lpOutBuffer, DWORD dwOutBufferSize);
NET_DVR_API BOOL __stdcall NET_DVR_UploadClose(LONG lUploadHandle);
NET_DVR_API LONG __stdcall NET_DVR_StartUploadFile(LONG lUserID, LPNET_DVR_UPLOAD_PARAM  lpStruUploadParam);
NET_DVR_API LONG __stdcall NET_DVR_GetUploadFileProgress(LONG lFileHandle);
NET_DVR_API LONG __stdcall NET_DVR_GetUploadFileState(LONG lFileHandle);
NET_DVR_API BOOL __stdcall NET_DVR_StopUploadFile (LONG lFileHandle);
NET_DVR_API LONG __stdcall NET_DVR_StartDownloadFile(LONG lUserID, LPNET_DVR_DOWNLOAD_PARAM lpStruDownloadParam);
NET_DVR_API LONG __stdcall NET_DVR_GetDownloadFileProgress(LONG lFileHandle);
NET_DVR_API LONG __stdcall NET_DVR_GetDownloadFileState(LONG lFileHandle);
NET_DVR_API BOOL __stdcall NET_DVR_StopDownloadFile (LONG lFileHandle);
NET_DVR_API BOOL __stdcall NET_DVR_DownloadControl(LONG lDownloadHandle, NET_SDK_DOWNLOAD_CONTROL_TYPE_ENUM enumDownloadType, void* lpInBuffer, DWORD dwInBufferLen, void* lpOutBuffer, DWORD dwOutBufferLen);
NET_DVR_API LONG __stdcall NET_DVR_UploadSend(LONG lUploadHandle, const NET_DVR_SEND_PARAM_IN *pstruSendParamIN, void* lpOutBuffer);
NET_DVR_API BOOL __stdcall NET_DVR_GetMobileDevStatus(LONG lUserID, DWORD dwStatusType, LPNET_DVR_MB_MOBILEDEV_STATUS lpstruMobileDevStatus);
    // NET_DVR_API BOOL __stdcall NET_DVR_SetVoiceDataCallBack(LONG lVoiceComHandle, BOOL bNeedCBNoEncData, void(CALLBACK *fVoiceDataCallBack)(LONG lVoiceComHandle, char *pRecvDataBuffer, DWORD dwBufSize, BYTE byAudioFlag, void* pUser), void* pUser);
NET_DVR_API BOOL __stdcall NET_DVR_SetTransparentParam(LONG lUserID, char *sInBuffer, DWORD dwInSize);
NET_DVR_API BOOL __stdcall NET_DVR_GetTransparentParam(LONG lUserID, char *sInBuffer, DWORD dwInSize, char *sOutBuffer, DWORD dwOutSize);
NET_DVR_API BOOL __stdcall NET_DVR_SetSDKLocalConfig(LPNET_DVR_SDKLOCAL_CFG lpSdkLocalCfg);
NET_DVR_API BOOL __stdcall NET_DVR_GetSDKLocalConfig(LPNET_DVR_SDKLOCAL_CFG lpSdkLocalCfg);
NET_DVR_API BOOL __stdcall NET_DVR_SetSDKLocalCfg(NET_SDK_LOCAL_CFG_TYPE enumType, const void *lpInBuff);
NET_DVR_API BOOL __stdcall NET_DVR_GetSDKLocalCfg(NET_SDK_LOCAL_CFG_TYPE enumType, void* lpOutBuff);
NET_DVR_API LONG __stdcall NET_DVR_OpticalUpgrade(LONG lUserID, char const *sFileName, LPNET_DVR_OPTICAL_INFO lpOpticalInfo);
    // typedef void(CALLBACK *fGPSDataCallback)(LONG nHandle, DWORD dwState, void* lpBuffer, DWORD dwBufLen, void* pUserData);
    // NET_DVR_API LONG __stdcall NET_DVR_GetVehicleGpsInfo(LONG nUserID, LPNET_DVR_GET_GPS_DATA_PARAM lpGPSDataParam, fGPSDataCallback cbGPSDataCallback, void* pUser);
NET_DVR_API BOOL __stdcall NET_DVR_ClosePreview(LONG lUserID, DWORD nSessionID);
NET_DVR_API BOOL __stdcall NET_DVR_ClosePlayBack(LONG lUserID, DWORD nSessionID);
NET_DVR_API LONG __stdcall NET_DVR_RealPlay_V40(LONG lUserID, LPNET_DVR_PREVIEWINFO lpPreviewInfo, REALDATACALLBACK fRealDataCallBack_V30 = NULL, void* pUser = NULL);
NET_DVR_API LONG __stdcall NET_DVR_RealPlaySpecial(LONG lUserID, LPNET_DVR_PREVIEWINFO_SPECIAL lpPreviewInfo, REALDATACALLBACK fRealDataCallBack_V30 = NULL, void* pUser = NULL);
NET_DVR_API LONG __stdcall NET_DVR_StartDownload(LONG lUserID, DWORD dwDownloadType, LPVOID lpInBuffer, DWORD dwInBufferSize, const char *sFileName);
NET_DVR_API LONG __stdcall NET_DVR_GetDownloadState(LONG lDownloadHandle, LPDWORD pProgress);
NET_DVR_API int  __stdcall NET_DVR_GetDownloadStateInfo(LONG lDownloadHandle, void* pStatusInfo);
NET_DVR_API BOOL __stdcall NET_DVR_StopDownload(LONG lHandle);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixStartDynamic_V41(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_PU_STREAM_CFG_V41 lpDynamicInfo);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetLoopDecChanInfo_V41(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_LOOP_DECINFO_V41 lpOuter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixSetLoopDecChanInfo_V41(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_LOOP_DECINFO_V41 lpInter);
NET_DVR_API BOOL __stdcall NET_DVR_MatrixGetDecChanInfo_V41(LONG lUserID, DWORD dwDecChanNum, LPNET_DVR_MATRIX_DEC_CHAN_INFO_V41 lpOuter);
NET_DVR_API LONG __stdcall NET_DVR_StartT1Test(LONG lUserID, LPNET_DVR_ALARMHOST_DOWNLOAD_PARAM lpStruDownloadParam);
NET_DVR_API BOOL __stdcall NET_DVR_StopTT1Test(BOOL lHandle);
NET_DVR_API BOOL __stdcall NET_DVR_GetT1TestStatus(LONG lHandle, LONG *pStatus);
NET_DVR_API BOOL __stdcall NET_DVR_SendT1TestData(LONG lHandle, DWORD dwDataType, char *pSendBuf, DWORD dwSendBufLen);
NET_DVR_API BOOL __stdcall NET_DVR_UploadLogo_NEW(LONG lUserID, DWORD dwLogoNo, LPNET_DVR_MATRIX_LOGO_INFO lpLogoInfo, char *sLogoBuffer);
NET_DVR_API BOOL __stdcall NET_DVR_DownloadLogo(LONG lUserID, DWORD dwLogoNo, LPNET_DVR_MATRIX_LOGO_INFO lpLogoInfo, char *sLogoBuffer, DWORD dwLogoBufferSize);
// NET_DVR_API LONG __stdcall NET_DVR_StartPassiveTransCode(LONG lUserID, NET_DVR_STREAM_INFO const *pStreamInfo, NET_DVR_COMPRESSIONCFG_V30 const *pDstTransInfo, NET_DVR_PASSIVETRANSINFO const *pPassiveTransInfo, void(CALLBACK *fTransCodeDataCallBack) (LONG lPassiveHandle, DWORD dwDataType, BYTE *pBuffer, DWORD dwBufSize, void* pUser) = NULL, void* pUser = NULL);
NET_DVR_API BOOL __stdcall NET_DVR_TransCodeInputData(LONG lPassiveHandle, BYTE *pBuffer, DWORD dwBufSize);
NET_DVR_API BOOL __stdcall NET_DVR_StopPassiveTransCode(LONG lPassiveHandle);
NET_DVR_API LONG __stdcall NET_DVR_GetPassiveTransChanNum(LONG lPassiveHandle);
NET_DVR_API BOOL __stdcall NET_DVR_SetDeviceConfigEx(LONG lUserID, DWORD dwCommand, DWORD dwCount, NET_DVR_IN_PARAM *lpInParam, NET_DVR_OUT_PARAM *lpOutParam);
NET_DVR_API BOOL __stdcall NET_DVR_GetSTDConfig(LONG lUserID, DWORD dwCommand, LPNET_DVR_STD_CONFIG lpConfigParam);
NET_DVR_API BOOL __stdcall NET_DVR_SetSTDConfig(LONG lUserID, DWORD dwCommand, LPNET_DVR_STD_CONFIG lpConfigParam);
NET_DVR_API BOOL __stdcall NET_DVR_GetSTDAbility(LONG lUserID, DWORD dwAbilityType, LPNET_DVR_STD_ABILITY  lpAbilityParam);
NET_DVR_API BOOL __stdcall NET_DVR_STDControl(LONG lUserID, DWORD dwCommand, LPNET_DVR_STD_CONTROL lpControlParam);
NET_DVR_API BOOL __stdcall NET_DVR_STDXMLConfig(LONG lUserID, NET_DVR_XML_CONFIG_INPUT* lpInputParam, NET_DVR_XML_CONFIG_OUTPUT* lpOutputParam);
NET_DVR_API LONG __stdcall NET_DVR_Upgrade_V40(DWORD lUserID, DWORD dwUpgradeType, char const *sFileName, void *pInbuffer, DWORD dwBufferLen);
NET_DVR_API LONG __stdcall NET_DVR_Upgrade_V50(DWORD lUserID, LPNET_DVR_UPGRADE_PARAM lpUpgradeParam);
NET_DVR_API BOOL __stdcall NET_DVR_DetectImage_V50(LONG lUserID, LPNET_VCA_FD_PROCIMG_CFG lpFDProcImg,LPNET_VCA_FD_PROCIMG_RESULT_V50 lpOutBuf);
NET_DVR_API LONG __stdcall NET_DVR_SmartSearchPicture(LONG lUserID, NET_DVR_SMART_SEARCH_PIC_PARA * pFindParam);
NET_DVR_API LONG __stdcall NET_DVR_FindNextSmartPicture(LONG lFindHandle,LPNET_DVR_SMART_SEARCH_PIC_RET lpFindData);
NET_DVR_API BOOL __stdcall NET_DVR_CloseSmartSearchPicture(LONG lFindHandle);
NET_DVR_API BOOL __stdcall NET_DVR_SetESCallBack(LONG iRealHandle, void (__stdcall *fnESCallback)(LONG lPreviewHandle, DWORD dwDataType, BYTE *pBuffer, DWORD dwBufSize,  void* pUser), void* pUser);
NET_DVR_API BOOL __stdcall NET_DVR_SetESRealPlayCallBack(LONG iRealHandle, void(__stdcall *fPlayESCallBack)(LONG lPreviewHandle, NET_DVR_PACKET_INFO_EX *pstruPackInfo, void* pUser), void* pUser);
NET_DVR_API BOOL __stdcall NET_DVR_ActivateDevice(char* sDVRIP, WORD wDVRPort, LPNET_DVR_ACTIVATECFG    lpActivateCfg);
NET_DVR_API BOOL __stdcall NET_DVR_GetAddrInfoByServer(DWORD     dwQueryType, void* pInBuf, DWORD dwInBufLen, void* pOutBuf, DWORD dwOutBufLen);
NET_DVR_API BOOL __stdcall NET_DVR_StartGetDevState(LPNET_DVR_CHECK_DEV_STATE pParams);
NET_DVR_API BOOL __stdcall NET_DVR_StopGetDevState();
NET_DVR_API BOOL __stdcall NET_DVR_RigisterPlayBackDrawFun(LONG lPlayHandle, void (__stdcall *fDrawFun)(LONG lPlayHandle, HDC hDc, DWORD dwUser), DWORD dwUser);
NET_DVR_API BOOL __stdcall NET_DVR_SetSDKInitCfg(NET_SDK_INIT_CFG_TYPE enumType, void* const lpInBuff);
NET_DVR_API BOOL __stdcall NET_DVR_ReleaseSDKMemPool(LPNET_DVR_SDKMEMPOOL_CFG lpSdkMemPoolCfg);
NET_DVR_API BOOL __stdcall NET_DVR_CapturePictureBlock(LONG iRealHandle, char const *sPicFileName, DWORD dwTimeOut);
NET_DVR_API BOOL __stdcall NET_DVR_CapturePictureBlock_New(LONG iRealHandle, char *pPicBuf, DWORD dwPicSize, DWORD *lpSizeReturned);
NET_DVR_API BOOL __stdcall NET_DVR_ChangeWndResolution(LONG iRealHandle);
NET_DVR_API LONG __stdcall  NET_DVR_SDKChannelToISAPI(LONG lUserID, LONG lInChannel, BOOL bSDKToISAPI);
NET_DVR_API BOOL __stdcall NET_DVR_STDXMLConfig_Conv(LONG lUserID, NET_DVR_XML_CONFIG_INPUT* lpInputParam, NET_DVR_XML_CONFIG_OUTPUT* lpOutputParam);
NET_DVR_API LONG __stdcall NET_DVR_SetupAlarmChan_V50(LONG iUserID, LPNET_DVR_SETUPALARM_PARAM_V50 lpSetupParam, char *pSub, DWORD dwSubSize);
NET_DVR_API BOOL __stdcall NET_DVR_GetAlarmSubscribe(LONG lAlarmHandle, char *pData, DWORD dwDataLen);
NET_DVR_API BOOL __stdcall NET_DVR_SetAlarmSubscribe(LONG lAlarmHandle, char *pData, DWORD dwDataLen);
NET_DVR_API BOOL __stdcall NET_DVR_GetNPQStat(LONG lHandle, NET_SDK_NPQ_STATE* pStruStat);
NET_DVR_API BOOL __stdcall NET_DVR_SetNPQNotifyParam(LONG lHandle, NET_SDK_NPQ_NOTIFY_PARAM* pNotifyParam);
NET_DVR_API BOOL __stdcall NET_DVR_PlaybackGetNPQStat(LONG lHandle, NET_SDK_NPQ_STATE* pStruStat);
NET_DVR_API BOOL __stdcall NET_DVR_RenderPrivateData(LONG lRealHandle, int iIntelType,  BOOL bTrue);
NET_DVR_API BOOL __stdcall NET_DVR_RenderPrivateDataEx(LONG lRealHandle, int iIntelType, int iSubType, BOOL bTrue);
NET_DVR_API BOOL __stdcall NET_DVR_PlaybackSetNPQNotifyParam(LONG lHandle, NET_SDK_NPQ_NOTIFY_PARAM* pNotifyParam);
NET_DVR_API BOOL __stdcall NET_DVR_EnableRelogon(BOOL bEnable, DWORD dwReserved);
NET_DVR_API LONG __stdcall NET_DVR_CreateEzvizUser(LPNET_DVR_EZVIZ_USER_LOGIN_INFO pLoginInfo, LPNET_DVR_DEVICEINFO_V30 pDeviceInfo);
NET_DVR_API BOOL __stdcall NET_DVR_DeleteEzvizUser(LONG iUserID);
NET_DVR_API LONG __stdcall NET_DVR_CreateOpenEzvizUser(LPNET_DVR_OPEN_EZVIZ_USER_LOGIN_INFO pLoginInfo, LPNET_DVR_DEVICEINFO_V40 pDeviceInfo);
NET_DVR_API BOOL __stdcall NET_DVR_DeleteOpenEzvizUser(LONG iUserID);
NET_DVR_API BOOL __stdcall NET_DVR_LoadAdditionalLib(ADDITIONAL_LIB libType, char const *sDllName);



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

