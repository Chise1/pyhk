%module(package="pyhk",directors="1") pyhk
%feature("autodoc","2");
%{
#include "HCNetSDK.h"
%}
// %include "hk_callback/hk_callback.i"
#define BOOL int
typedef unsigned int DWORD;
typedef unsigned short WORD;
typedef unsigned short USHORT;
typedef short SHORT;
typedef int LONG;
typedef unsigned char BYTE;
typedef unsigned int UINT;
typedef void* LPVOID;
typedef void* HANDLE;
typedef unsigned int* LPDWORD;
typedef unsigned long long UINT64;
typedef signed long long INT64;
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
typedef void* HWND;
 #endif
 #endif



#define SERIALNO_LEN           48     
#define NAME_LEN                32      //用户名长度
#define MACADDR_LEN                6       //mac地址长度
typedef struct
{
    BYTE sSerialNumber[SERIALNO_LEN];  
    BYTE byAlarmInPortNum;                
    BYTE byAlarmOutPortNum;                
    BYTE byDiskNum;                    
    BYTE byDVRType;                    
    BYTE byChanNum;                    
    BYTE byStartChan;                    
    BYTE byAudioChanNum;                
    BYTE byIPChanNum;                    
    BYTE byZeroChanNum;            
    BYTE byMainProto;            
    BYTE bySubProto;                
    BYTE bySupport;        
    BYTE bySupport1;        
    BYTE bySupport2; 
    WORD wDevType;              
    BYTE bySupport3; 
    BYTE byMultiStreamProto;
    BYTE byStartDChan;        
    BYTE byStartDTalkChan;    
    BYTE byHighDChanNum;        
    BYTE bySupport4;        
    BYTE byLanguageType;
    BYTE byVoiceInChanNum;   
    BYTE byStartVoiceInChanNo; 
    BYTE  bySupport5;  
    BYTE  bySupport6;   
    BYTE  byMirrorChanNum;    
    WORD wStartMirrorChanNo;  
    BYTE bySupport7;   
    BYTE  byRes2;        
}NET_DVR_DEVICEINFO_V30, *LPNET_DVR_DEVICEINFO_V30;
//报警设备信息
typedef struct
{   
    BYTE byUserIDValid;                 /* userid是否有效 0-无效，1-有效 */
    BYTE bySerialValid;                 /* 序列号是否有效 0-无效，1-有效 */
    BYTE byVersionValid;                /* 版本号是否有效 0-无效，1-有效 */
    BYTE byDeviceNameValid;             /* 设备名字是否有效 0-无效，1-有效 */
    BYTE byMacAddrValid;                /* MAC地址是否有效 0-无效，1-有效 */    
    BYTE byLinkPortValid;               /* login端口是否有效 0-无效，1-有效 */
    BYTE byDeviceIPValid;               /* 设备IP是否有效 0-无效，1-有效 */
    BYTE bySocketIPValid;               /* socket ip是否有效 0-无效，1-有效 */
    LONG lUserID;                       /* NET_DVR_Login()返回值, 布防时有效 */
    BYTE sSerialNumber[SERIALNO_LEN];    /* 序列号 */
    DWORD dwDeviceVersion;                /* 版本信息 高16位表示主版本，低16位表示次版本*/
    char sDeviceName[NAME_LEN];            /* 设备名字 */
    BYTE byMacAddr[MACADDR_LEN];        /* MAC地址 */    
    WORD wLinkPort;                     /* link port */
    char sDeviceIP[128];                /* IP地址 */
    char sSocketIP[128];                /* 报警主动上传时的socket IP地址 */
    BYTE byIpProtocol;                  /* Ip协议 0-IPV4, 1-IPV6 */
    BYTE byRes1[2];
    BYTE bJSONBroken;                   //JSON断网续传标志。0：不续传；1：续传
    WORD wSocketPort;
    BYTE byRes2[6];
}NET_DVR_ALARMER, *LPNET_DVR_ALARMER;




NET_DVR_API BOOL __stdcall NET_DVR_Init();
NET_DVR_API BOOL __stdcall NET_DVR_Cleanup();
NET_DVR_API BOOL __stdcall NET_DVR_SetConnectTime(DWORD dwWaitTime = 3000, DWORD dwTryTimes = 3);
NET_DVR_API BOOL __stdcall NET_DVR_SetReconnect(DWORD dwInterval = 30000, BOOL bEnableRecon = TRUE);
NET_DVR_API LONG __stdcall NET_DVR_Login_V30(char *sDVRIP, WORD wDVRPort, char *sUserName, char *sPassword, LPNET_DVR_DEVICEINFO_V30 lpDeviceInfo);
NET_DVR_API DWORD __stdcall NET_DVR_GetLastError();






%feature("director")MSGCallBackOp;
%inline%{
struct MSGCallBackOp{
    virtual  void MSGCallBack(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void* pUser)=0;
    virtual ~MSGCallBackOp(){}};
%}
%{
static MSGCallBackOp *MSGCallBackOp_ptr=NULL;
static void MSGCallBack_helper(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void* pUser){
    return MSGCallBackOp_ptr->MSGCallBack(lCommand, pAlarmer, pAlarmInfo, dwBufLen, pUser);}
%}


//callback涉及到的函数
    // NET_DVR_API LONG __stdcall NET_DVR_StartPassiveTransCode(LONG lUserID, NET_DVR_STREAM_INFO const *pStreamInfo, NET_DVR_COMPRESSIONCFG_V30 const *pDstTransInfo, NET_DVR_PASSIVETRANSINFO const *pPassiveTransInfo, void(CALLBACK *fTransCodeDataCallBack) (LONG lPassiveHandle, DWORD dwDataType, BYTE *pBuffer, DWORD dwBufSize, void* pUser) = NULL, void* pUser = NULL);
%inline%{
NET_DVR_API BOOL __stdcall NET_DVR_SetDVRMessageCallBack_V30_wrapper(MSGCallBackOp *fMessageCallBack, void* pUser){
    MSGCallBackOp_ptr=fMessageCallBack;
     BOOL result= NET_DVR_SetDVRMessageCallBack_V30(&MSGCallBack_helper,  pUser);
     fMessageCallBack=NULL;
     return result;}
%} 
