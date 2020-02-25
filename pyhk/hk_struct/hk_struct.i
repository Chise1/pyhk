%module(package="hk_struct") hk_struct
%feature("autodoc","2");
%inline%{

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
%}
%inline%{

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

%}