// IP San 文件目录查找
typedef void (CALLBACK *REALDATACALLBACK) (LONG lPlayHandle, DWORD dwDataType, BYTE *pBuffer, DWORD dwBufSize, void* pUser);
typedef LONG(CALLBACK * REGCallBack)(LONG lUserID, LPNET_DVR_REGCALLBACKPARAM pRegCallbackParam, LPNET_DVR_LOGONREPONSEPARAM pInterParam, void *pUser);
typedef LONG(CALLBACK * PREVIEWRESPONSECallBack)(LONG lUserID, LONG lStreamHandle, LPNET_DVR_PREVIEWCALLBACKPARAM pPewviewCallbackParam,void *pUser);
typedef LONG(CALLBACK * PLAYBACKRESPONSECallBack)(LONG lUserID, LONG lPlaybackHandle, LPNET_DVR_PLAYBACKCALLBACKPARAM lpPlaybackParam,void *pUser);     
typedef LONG(CALLBACK * VOICERESPONSECallBack)(LONG lUserID, LONG lVoiceHandle, LONG lVoiceChannel, BYTE nAudioType, void *pUser);     
typedef void(CALLBACK * NAKEDDAtACALLBACK)(DWORD typeInfo, char *pInfo, DWORD dwInfoLen,DWORD dwIPLen, void* pUser);
typedef LONG(CALLBACK * ALARMSETUPRESPONSECallBack)(LONG lUserID, LONG lAlarmHandle, void * pUser);         
typedef void(CALLBACK *fAlarmHostSerialDataCallBack)(LONG lSerialHandle, LONG lPort, LONG lDateType, char *pRecvDataBuffer, DWORD  dwBufSize,void *pUser);
typedef void (CALLBACK *FLOWTESTCALLBACK)(LONG lFlowHandle, LPNET_DVR_FLOW_INFO pFlowInfo, void *pUser);
typedef void (CALLBACK *SCREENPICDATACB)(LONG nScreenPicHandle, DWORD dwDataType, BYTE *pBuffer, DWORD dwBufSize, void *pUser);
typedef void(CALLBACK *fRemoteConfigCallback)(DWORD dwType, void* lpBuffer, DWORD dwBufLen, void* pUserData);
typedef void(CALLBACK *fLongCfgStateCallback)(LONG lHandle,  DWORD dwState, LPVOID pUserData);
typedef void(CALLBACK *fSearchDBCallBack)(LONG lHandle, DWORD dwType, DWORD dwResultNum, BYTE* pBuffer, DWORD dwBufSize,void *pUser);
typedef void(CALLBACK *fSearchDBCallBack)(LONG lSearchHandle, DWORD dwType, DWORD dwResultNum, BYTE* pBuffer, DWORD dwBufSize,void *pUser);
typedef LONG (CALLBACK *PicViewCallBack)(LPNET_DVR_PICVIEW_CALLBACKPARAM pStruPicViewParam, void *pUser);
typedef void(CALLBACK *fGPSDataCallback)(LONG nHandle, DWORD dwState, void* lpBuffer, DWORD dwBufLen, void* pUserData);
typedef void (CALLBACK *MSGCallBack)(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void* pUser);
typedef BOOL (CALLBACK *MSGCallBack_V31)(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void* pUser);

typedef void (CALLBACK *fLoginResultCallBack) (LONG lUserID, DWORD dwResult, LPNET_DVR_DEVICEINFO_V30 lpDeviceInfo , void* pUser);

typedef BOOL(CALLBACK *fnCertVerifyResultCallBack) (DWORD uiResult, LPNET_DVR_CETTIFICATE_INFO lpCertificateInfo, char *pUserData);

typedef void (CALLBACK *DATADOWNLOAD)(LONG nDownloadHandle, DWORD dwDataType, void* pBuffer, DWORD dwBufSize, void *pUser);
typedef void (CALLBACK *DVCS_UPGRADESTATE_CB)(LONG nUpgradeHandle, BYTE *pBuffer, DWORD dwBufSize, void* pUser);
typedef int(CALLBACK * CHAR_ENCODE_CONVERT)(char * pInput, DWORD dwInputLen, DWORD dwInEncodeType, char *pOutput, DWORD dwOutputLen, DWORD dwOutEncodeType);