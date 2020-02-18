%module(package="hk_callback") hk_callback
%header%{
    #include "HCNetSDK.h"
%}
%feature("autodoc","2");
%import "../hk_struct/hk_struct_test.i"
%inline%{
struct REALDATACALLBACKOp{
    virtual void REALDATACALLBACK(LONG lPlayHandle, DWORD dwDataType, BYTE *pBuffer, DWORD dwBufSize, void* pUser)=0;
    virtual ~REALDATACALLBACKOp(){}
};
struct REGCallBackOp{
    virtual LONG REGCallBack(LONG lUserID, LPNET_DVR_REGCALLBACKPARAM pRegCallbackParam, LPNET_DVR_LOGONREPONSEPARAM pInterParam, void *pUser)=0;
    virtual ~REGCallBackOp(){}
};
struct PREVIEWRESPONSECallBackOp{
    virtual LONG PREVIEWRESPONSECallBack(LONG lUserID, LONG lStreamHandle, LPNET_DVR_PREVIEWCALLBACKPARAM pPewviewCallbackParam,void *pUser)=0;
    virtual ~PREVIEWRESPONSECallBackOp(){}

};
struct PLAYBACKRESPONSECallBackOp
{
    virtual  LONG PLAYBACKRESPONSECallBack(LONG lUserID, LONG lPlaybackHandle, LPNET_DVR_PLAYBACKCALLBACKPARAM lpPlaybackParam,void *pUser)=0;  
    virtual ~PLAYBACKRESPONSECallBackOp(){}
};
struct VOICERESPONSECallBackOp
{
    virtual LONG  VOICERESPONSECallBack(LONG lUserID, LONG lVoiceHandle, LONG lVoiceChannel, BYTE nAudioType, void *pUser)=0;     
    virtual ~VOICERESPONSECallBackOp(){}
};
struct NAKEDDAtACALLBACKOp
{
    virtual  void NAKEDDAtACALLBACK(DWORD typeInfo, char *pInfo, DWORD dwInfoLen,DWORD dwIPLen, void* pUser)=0;
    virtual ~NAKEDDAtACALLBACKOp(){}
};
struct ALARMSETUPRESPONSECallBackOp
{
    virtual  ALARMSETUPRESPONSECallBack(LONG lUserID, LONG lAlarmHandle, void * pUser)=0;   
    virtual ~ALARMSETUPRESPONSECallBackOp(){}
};
struct fAlarmHostSerialDataCallBackOp
{
    virtual  void fAlarmHostSerialDataCallBack(LONG lSerialHandle, LONG lPort, LONG lDateType, char *pRecvDataBuffer, DWORD  dwBufSize,void *pUser)=0;
    virtual ~fAlarmHostSerialDataCallBackOp(){}
};
struct FLOWTESTCALLBACKOp
{
    virtual void FLOWTESTCALLBACK(LONG lFlowHandle, LPNET_DVR_FLOW_INFO pFlowInfo, void *pUser)=0;
    virtual ~FLOWTESTCALLBACKOp(){}
};
struct SCREENPICDATACBOp
{
    virtual void SCREENPICDATACB(LONG nScreenPicHandle, DWORD dwDataType, BYTE *pBuffer, DWORD dwBufSize, void *pUser)=0;
    virtual ~SCREENPICDATACBOp(){};
};
struct fRemoteConfigCallbackOp
{
    virtual void fRemoteConfigCallback(DWORD dwType, void* lpBuffer, DWORD dwBufLen, void* pUserData)=0;
    virtual ~fRemoteConfigCallbackOp(){}
};
struct fLongCfgStateCallbackOp
{
    virtual  void fLongCfgStateCallback(LONG lHandle,  DWORD dwState, LPVOID pUserData)=0;
    virtual ~fLongCfgStateCallbackOp(){}
};
struct fSearchDBCallBackOp
{
    virtual void fSearchDBCallBack(LONG lHandle, DWORD dwType, DWORD dwResultNum, BYTE* pBuffer, DWORD dwBufSize,void *pUser)=0;
    virtual ~fSearchDBCallBackOp(){}
};
struct PicViewCallBackOp
{
    virtual  LONG PicViewCallBack(LPNET_DVR_PICVIEW_CALLBACKPARAM pStruPicViewParam, void *pUser)=0;
    virtual ~PicViewCallBackOp(){}
};
struct fGPSDataCallbackOp
{
    virtual  void fGPSDataCallback(LONG nHandle, DWORD dwState, void* lpBuffer, DWORD dwBufLen, void* pUserData)=0;
    virtual ~fGPSDataCallbackOp(){}
};
struct MSGCallBackOp
{
    virtual  void MSGCallBack(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void* pUser)=0;
    virtual ~MSGCallBackOp(){}
};
struct MSGCallBack_V31Op
{
    virtual BOOL MSGCallBack_V31(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void* pUser)=0;
    virtual ~MSGCallBack_V31Op(){}
};
struct fLoginResultCallBackOp
{
    virtual  void fLoginResultCallBack (LONG lUserID, DWORD dwResult, LPNET_DVR_DEVICEINFO_V30 lpDeviceInfo , void* pUser)=0;
    virtual ~fLoginResultCallBackOp(){}
};
struct fnCertVerifyResultCallBackOp
{
    virtual BOOL fnCertVerifyResultCallBack (DWORD uiResult, LPNET_DVR_CETTIFICATE_INFO lpCertificateInfo, char *pUserData)=0;
   virtual ~fnCertVerifyResultCallBackOp(){}
};
struct DATADOWNLOADOp
{
    virtual void DATADOWNLOAD(LONG nDownloadHandle, DWORD dwDataType, void* pBuffer, DWORD dwBufSize, void *pUser)=0;
    virtual ~DATADOWNLOADOp(){}
};
struct DVCS_UPGRADESTATE_CBOp
{
    virtual void DVCS_UPGRADESTATE_CB(LONG nUpgradeHandle, BYTE *pBuffer, DWORD dwBufSize, void* pUser)=0;
    virtual ~DVCS_UPGRADESTATE_CBOp(){}
};
struct CHAR_ENCODE_CONVERTOp
{
    virtual  int CHAR_ENCODE_CONVERT(char * pInput, DWORD dwInputLen, DWORD dwInEncodeType, char *pOutput, DWORD dwOutputLen, DWORD dwOutEncodeType)=0;
    virtual ~CHAR_ENCODE_CONVERTOp(){}
};

%}
%{
static REALDATACALLBACKOp *REALDATACALLBACKOp ptr=NULL;
static REGCallBackOp *REGCallBackOp ptr=NULL;
static PREVIEWRESPONSECallBackOp *PREVIEWRESPONSECallBackOp ptr=NULL;
static PLAYBACKRESPONSECallBackOp *PLAYBACKRESPONSECallBackOp ptr=NULL;
static VOICERESPONSECallBackOp *VOICERESPONSECallBackOp ptr=NULL;
static ALARMSETUPRESPONSECallBackOp *ALARMSETUPRESPONSECallBackOp ptr=NULL;
static fAlarmHostSerialDataCallBackOp *fAlarmHostSerialDataCallBackOp ptr=NULL;
static FLOWTESTCALLBACKOp *FLOWTESTCALLBACKOp ptr=NULL;
static SCREENPICDATACBOp *SCREENPICDATACBOp ptr=NULL;
static fLongCfgStateCallbackOp *fLongCfgStateCallbackOp ptr=NULL;
static fSearchDBCallBackOp *fSearchDBCallBackOp ptr=NULL;
static fGPSDataCallbackOp *fGPSDataCallbackOp ptr=NULL;
static MSGCallBackOp *MSGCallBackOp ptr=NULL;
static MSGCallBack_V31Op *MSGCallBack_V31Op ptr=NULL;
static fLoginResultCallBackOp *fLoginResultCallBackOp ptr=NULL;
static fnCertVerifyResultCallBackOp *fnCertVerifyResultCallBackOp ptr=NULL;
static DATADOWNLOADOp *DATADOWNLOADOp ptr=NULL;
static DVCS_UPGRADESTATE_CBOp *DVCS_UPGRADESTATE_CBOp ptr=NULL;
static CHAR_ENCODE_CONVERTOp *CHAR_ENCODE_CONVERTOp ptr=NULL;
static NAKEDDAtACALLBACKOp *NAKEDDAtACALLBACKOp ptr=NULL;
static fRemoteConfigCallbackOp *fRemoteConfigCallbackOp ptr=NULL;
static PicViewCallBackOp *PicViewCallBackOp ptr=NULL;



static void REALDATACALLBACK_helper(LONG lPlayHandle, DWORD dwDataType, BYTE *pBuffer, DWORD dwBufSize, void* pUser){
    return REALDATACALLBACK_ptr->REALDATACALLBACK(lPlayHandle, dwDataType, pBuffer, dwBufSize, pUser);
}
static LONG  REGCallBack_helper(LONG lUserID, LPNET_DVR_REGCALLBACKPARAM pRegCallbackParam, LPNET_DVR_LOGONREPONSEPARAM pInterParam, void *pUser);
static LONG  PREVIEWRESPONSECallBack_helper(LONG lUserID, LONG lStreamHandle, LPNET_DVR_PREVIEWCALLBACKPARAM pPewviewCallbackParam,void *pUser);
static LONG  PLAYBACKRESPONSECallBack_helper(LONG lUserID, LONG lPlaybackHandle, LPNET_DVR_PLAYBACKCALLBACKPARAM lpPlaybackParam,void *pUser);     
static LONG  VOICERESPONSECallBack_helper(LONG lUserID, LONG lVoiceHandle, LONG lVoiceChannel, BYTE nAudioType, void *pUser);     
static void  NAKEDDAtACALLBACK_helper(DWORD typeInfo, char *pInfo, DWORD dwInfoLen,DWORD dwIPLen, void* pUser);
static LONG  ALARMSETUPRESPONSECallBack_helper(LONG lUserID, LONG lAlarmHandle, void * pUser);         
static void fAlarmHostSerialDataCallBack_helper(LONG lSerialHandle, LONG lPort, LONG lDateType, char *pRecvDataBuffer, DWORD  dwBufSize,void *pUser);
static void FLOWTESTCALLBACK_helper(LONG lFlowHandle, LPNET_DVR_FLOW_INFO pFlowInfo, void *pUser);
static void SCREENPICDATACB_helper(LONG nScreenPicHandle, DWORD dwDataType, BYTE *pBuffer, DWORD dwBufSize, void *pUser);
static void fRemoteConfigCallback_helper(DWORD dwType, void* lpBuffer, DWORD dwBufLen, void* pUserData);
static void fLongCfgStateCallback_helper(LONG lHandle,  DWORD dwState, LPVOID pUserData);
static void fSearchDBCallBack_helper(LONG lHandle,       DWORD dwType, DWORD dwResultNum, BYTE* pBuffer, DWORD dwBufSize,void *pUser);
static LONG PicViewCallBack_helper(LPNET_DVR_PICVIEW_CALLBACKPARAM pStruPicViewParam, void *pUser);
static void fGPSDataCallback_helper(LONG nHandle, DWORD dwState, void* lpBuffer, DWORD dwBufLen, void* pUserData);
static void MSGCallBack_helper(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void* pUser);
static BOOL MSGCallBack_V31_helper(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void* pUser);
static void fLoginResultCallBack_helper(LONG lUserID, DWORD dwResult, LPNET_DVR_DEVICEINFO_V30 lpDeviceInfo , void* pUser);
static BOOL fnCertVerifyResultCallBack_helper(DWORD uiResult, LPNET_DVR_CETTIFICATE_INFO lpCertificateInfo, char *pUserData);
static void DATADOWNLOAD_helper(LONG nDownloadHandle, DWORD dwDataType, void* pBuffer, DWORD dwBufSize, void *pUser);
static void DVCS_UPGRADESTATE_CB_helper(LONG nUpgradeHandle, BYTE *pBuffer, DWORD dwBufSize, void* pUser);
static int  CHAR_ENCODE_CONVERT_helper(char * pInput, DWORD dwInputLen, DWORD dwInEncodeType, char *pOutput, DWORD dwOutputLen, DWORD dwOutEncodeType);
%}

%inline%{
NET_DVR_API LONG __stdcall NET_DVR_ZeroStartPlay_wrapper(LONG lUserID, LPNET_DVR_CLIENTINFO lpClientInfo, REALDATACALLBACKOp *fRealDataCallBack_V30 = NULL, void* pUser = NULL, BOOL bBlocked = TRUE){
    REALDATACALLBACK_ptr=fRealDataCallBack_V30;
    LONG result=NET_DVR_ZeroStartPlay(lUserID, lpClientInfo, &REALDATACALLBACK_helper, pUser, bBlocked);
    fRealDataCallBack_V30=NULL;
    return result;
}
%} 