%module(package="pyhk",directors="1") pyhk
%feature("autodoc","2");
%{
    #include "HCNetSDK.h"
%}
#define DLL_EXPORT
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
#define MAX_ANALOG_CHANNUM      32      //最大32个模拟通道
#define MAX_ANALOG_ALARMOUT     32      //最大32路模拟报警输出 
#define MAX_ANALOG_ALARMIN      32      //最大32路模拟报警输入
#define MAX_IP_ALARMOUT         64      //允许加入的最多报警输出数

#define MAX_ALARMOUT_V30              ( MAX_ANALOG_ALARMOUT + MAX_IP_ALARMOUT )//96
//报警输入参数配置(256路NVR扩展)
typedef struct tagNET_DVR_ALARMINCFG_V40
{
    DWORD dwSize;
    BYTE sAlarmInName[NAME_LEN];    /* 名称 */
    BYTE byAlarmType;                //报警器类型,0：常开,1：常闭
    BYTE byAlarmInHandle;            /* 是否处理 0-不处理 1-处理*/
    BYTE byChannel;                 // 报警输入触发智能识别通道
    BYTE byInputType;                //输入类型  0-开关量方式  1-信号量方式
    DWORD   dwHandleType;        //异常处理,异常处理方式的"或"结果   
    /*0x00: 无响应*/
    /*0x01: 监视器上警告*/
    /*0x02: 声音警告*/
    /*0x04: 上传中心*/
    /*0x08: 触发报警输出*/
    /*0x10: 触发JPRG抓图并上传Email*/
    /*0x20: 无线声光报警器联动*/
    /*0x40: 联动电子地图(目前只有PCNVR支持)*/
    /*0x200: 抓图并上传FTP*/ 
    /*0x1000:抓图上传到云*/
    /*0x2000:短信报警*/
    DWORD   dwMaxRelAlarmOutChanNum ; //触发的报警输出通道数（只读）最大支持数量
    DWORD   dwRelAlarmOutChanNum; //触发的报警输出通道数 实际支持数
    DWORD   dwRelAlarmOut[MAX_ALARMOUT_V40]; //触发报警通道
    NET_DVR_SCHEDTIME struAlarmTime[MAX_DAYS][MAX_TIMESEGMENT_V30];//布防时间
    /*触发的录像通道*/
    DWORD   dwMaxRecordChanNum;   //设备支持的最大关联录像通道数-只读
    DWORD   dwCurRecordChanNum;    //当前实际已配置的关联录像通道数
    DWORD   dwRelRecordChan[MAX_CHANNUM_V40];     /* 实际触发录像通道，按值表示,采用紧凑型排列，从下标0 - dwCurRecordChanNum -1有效，如果中间遇到0xffffffff,则后续无效*/ 
    DWORD   dwMaxEnablePtzCtrlNun; //最大可启用的云台控制总数(只读)
    DWORD   dwEnablePresetChanNum;  //当前已启用预置点的数目
    NET_DVR_PRESETCHAN_INFO struPresetChanInfo[MAX_CHANNUM_V40]; //启用的预置点信息
    BYTE    byPresetDurationTime[MAX_CHANNUM_V40];//预置点停留时间 范围0-20s，默认10s；
    BYTE    byRes2[4];                    /*保留*/
    DWORD   dwEnableCruiseChanNum;  //当前已启用巡航的通道数目
    NET_DVR_CRUISECHAN_INFO struCruiseChanInfo[MAX_CHANNUM_V40]; //启用巡航功能通道的信息
    DWORD   dwEnablePtzTrackChanNum;  //当前已启用巡航的通道数目
    NET_DVR_PTZTRACKCHAN_INFO struPtzTrackInfo[MAX_CHANNUM_V40]; //调用云台轨迹的通道信息
    WORD   wEventType[NET_SDK_MAX_EVENT_NUM/*64*/]; /*组合事件类型，每一个位对应一个事件类型*/
    BYTE    byRes[128];
}NET_DVR_ALARMINCFG_V40;

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
typedef struct tagNET_DVR_SETUPALARM_PARAM
{
    DWORD dwSize;
    BYTE  byLevel; //布防优先级，0-一等级（高），1-二等级（中），2-三等级（低）
    BYTE  byAlarmInfoType; //上传报警信息类型（抓拍机支持），0-老报警信息（NET_DVR_PLATE_RESULT），1-新报警信息(NET_ITS_PLATE_RESULT)2012-9-28
    BYTE  byRetAlarmTypeV40; //0--返回NET_DVR_ALARMINFO_V30或NET_DVR_ALARMINFO, 1--设备支持NET_DVR_ALARMINFO_V40则返回NET_DVR_ALARMINFO_V40，不支持则返回NET_DVR_ALARMINFO_V30或NET_DVR_ALARMINFO
    BYTE  byRetDevInfoVersion; //CVR上传报警信息回调结构体版本号 0-COMM_ALARM_DEVICE， 1-COMM_ALARM_DEVICE_V40
    BYTE  byRetVQDAlarmType; //VQD报警上传类型，0-上传报报警NET_DVR_VQD_DIAGNOSE_INFO，1-上传报警NET_DVR_VQD_ALARM
    //1-表示人脸侦测报警扩展(INTER_FACE_DETECTION),0-表示原先支持结构(INTER_FACESNAP_RESULT)
    BYTE  byFaceAlarmDetection;
    //Bit0- 表示二级布防是否上传图片: 0-上传，1-不上传
    //Bit1- 表示开启数据上传确认机制；0-不开启，1-开启
    //Bit6- 表示雷达检测报警(eventType:radarDetection)是否开启实时上传；0-不开启，1-开启（用于web插件实时显示雷达目标轨迹）
    BYTE  bySupport; 
    //断网续传类型 
    //bit0-车牌检测（IPC） （0-不续传，1-续传）
    //bit1-客流统计（IPC）  （0-不续传，1-续传）
    //bit2-热度图统计（IPC） （0-不续传，1-续传）
    //bit3-人脸抓拍（IPC） （0-不续传，1-续传）
    //bit4-人脸对比（IPC） （0-不续传，1-续传）
    BYTE  byBrokenNetHttp;
    WORD  wTaskNo;    //任务处理号 和 (上传数据NET_DVR_VEHICLE_RECOG_RESULT中的字段dwTaskNo对应 同时 下发任务结构 NET_DVR_VEHICLE_RECOG_COND中的字段dwTaskNo对应)
    BYTE  byDeployType;    //布防类型：0-客户端布防，1-实时布防
    BYTE  byRes1[3];
    BYTE  byAlarmTypeURL;//bit0-表示人脸抓拍报警上传（INTER_FACESNAP_RESULT）；0-表示二进制传输，1-表示URL传输（设备支持的情况下，设备支持能力根据具体报警能力集判断,同时设备需要支持URL的相关服务，当前是”云存储“）
    //bit1-表示EVENT_JSON中图片数据长传类型；0-表示二进制传输，1-表示URL传输（设备支持的情况下，设备支持能力根据具体报警能力集判断）
    //bit2 - 人脸比对(报警类型为COMM_SNAP_MATCH_ALARM)中图片数据上传类型：0 - 二进制传输，1 - URL传输
    //bit3 - 行为分析(报警类型为COMM_ALARM_RULE)中图片数据上传类型：0 - 二进制传输，1 - URL传输，本字段设备是否支持，对应软硬件能力集中<isSupportBehaviorUploadByCloudStorageURL>节点是否返回且为true
    BYTE  byCustomCtrl;//Bit0- 表示支持副驾驶人脸子图上传: 0-不上传,1-上传
}NET_DVR_SETUPALARM_PARAM, *LPNET_DVR_SETUPALARM_PARAM;
//报警输出状态(9000扩展)
typedef struct 
{
    BYTE Output[MAX_ALARMOUT_V30];
}NET_DVR_ALARMOUTSTATUS_V30, *LPNET_DVR_ALARMOUTSTATUS_V30;



NET_DVR_API BOOL __stdcall NET_DVR_Init();
NET_DVR_API BOOL __stdcall NET_DVR_Logout(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_Cleanup();
NET_DVR_API BOOL __stdcall NET_DVR_SetConnectTime(DWORD dwWaitTime = 3000, DWORD dwTryTimes = 3);
NET_DVR_API BOOL __stdcall NET_DVR_SetReconnect(DWORD dwInterval = 30000, BOOL bEnableRecon = TRUE);
NET_DVR_API LONG __stdcall NET_DVR_Login_V30(char *sDVRIP, WORD wDVRPort, char *sUserName, char *sPassword, NET_DVR_DEVICEINFO_V30 *lpDeviceInfo);
NET_DVR_API DWORD __stdcall NET_DVR_GetLastError();
NET_DVR_API LONG __stdcall NET_DVR_SetupAlarmChan_V41(LONG lUserID, NET_DVR_SETUPALARM_PARAM *lpSetupParam);
NET_DVR_API LONG __stdcall NET_DVR_SetupAlarmChan_V30(LONG lUserID);
NET_DVR_API BOOL __stdcall NET_DVR_StopListen_V30(LONG lListenHandle);
NET_DVR_API BOOL __stdcall NET_DVR_GetDVRConfig(LONG lUserID, DWORD dwCommand,LONG lChannel, LPVOID lpOutBuffer, DWORD dwOutBufferSize, LPDWORD lpBytesReturned);
NET_DVR_API BOOL __stdcall NET_DVR_SetDVRConfig(LONG lUserID, DWORD dwCommand,LONG lChannel, LPVOID lpInBuffer, DWORD dwInBufferSize);
NET_DVR_API BOOL __stdcall NET_DVR_GetDeviceConfig(LONG lUserID, DWORD dwCommand, DWORD dwCount, LPVOID lpInBuffer, DWORD dwInBufferSize, LPVOID lpStatusList, LPVOID lpOutBuffer, DWORD dwOutBufferSize);
NET_DVR_API BOOL __stdcall NET_DVR_SetDeviceConfig(LONG lUserID, DWORD dwCommand, DWORD dwCount, LPVOID lpInBuffer, DWORD dwInBufferSize, LPVOID lpStatusList, LPVOID lpInParamBuffer, DWORD dwInParamBufferSize);
NET_DVR_API BOOL __stdcall NET_DVR_GetAlarmOut_V30(LONG lUserID, NET_DVR_ALARMOUTSTATUS_V30* lpAlarmOutState);




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
NET_DVR_API BOOL __stdcall NET_DVR_SetDVRMessageCallBack_V30_wrapper(MSGCallBackOp *fMessageCallBack, void* pUser=NULL){
    MSGCallBackOp_ptr=fMessageCallBack;
    BOOL result= NET_DVR_SetDVRMessageCallBack_V30(&MSGCallBack_helper,  pUser);
    fMessageCallBack=NULL;
    return result;}

NET_DVR_API LONG __stdcall NET_DVR_StartListen_V30_wrapper(char *sLocalIP, WORD wLocalPort, MSGCallBackOp *DataCallback, void* pUserData = NULL){
    MSGCallBackOp_ptr=DataCallback;
    LONG result= NET_DVR_StartListen_V30(sLocalIP,  wLocalPort, &MSGCallBack_helper, pUserData );
    DataCallback=NULL;
    return result;}

%} 


//TOOLS
%inline%{

%}