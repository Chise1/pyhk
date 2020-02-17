%module  pyhk

%header %{
// /*  Includes the header in the wrapper code */
#include "HCNetSDK.h"
// #include "py_hk.h"
 %}
 %include  "HCNetSDK.h"
//  %include "py_hk.h"
//   //typedof 重新命名参数
// //  %include "HCNetSDK.h"
//  % inline %{
// #define BOOL int
//     typedef unsigned int DWORD;
//     typedef unsigned short WORD;
//     typedef unsigned short USHORT;
//     typedef short SHORT;
//     typedef int LONG;
//     typedef unsigned char BYTE;
//     typedef unsigned int UINT;
//     typedef void *LPVOID;
//     typedef void *HANDLE;
//     typedef unsigned int *LPDWORD;
//     typedef unsigned long long UINT64;
//     typedef signed long long INT64;
//  %}
// #ifndef TRUE
// #define TRUE 1
// #endif
// #ifndef FALSE
// #define FALSE 0
// #endif
// #ifndef NULL
// #define NULL 0
// #endif

// #define __stdcall
// #define CALLBACK

// #define NET_DVR_API extern "C"
// typedef unsigned int COLORKEY;
// typedef unsigned int COLORREF;

// #ifndef __HWND_defined
// #define __HWND_defined
// #if defined(__linux__)
// typedef unsigned int HWND;
// #else
// typedef void *HWND;
// #endif
// #endif

// #ifndef __HDC_defined
// #define __HDC_defined
// #if defined(__linux__)
// typedef struct __DC
// {
//     void *surface; //SDL Surface
//     HWND hWnd;     //HDC window handle
// } DC;
// typedef DC *HDC;
// #else
// typedef void *HDC;
// #endif
// #endif

// //注册结构体
// typedef struct tagInitInfo
// {
//     int uWidth;
//     int uHeight;
// } INITINFO;

// typedef struct
// {
//     DWORD dwYear;   //年
//     DWORD dwMonth;  //月
//     DWORD dwDay;    //日
//     DWORD dwHour;   //时
//     DWORD dwMinute; //分
//     DWORD dwSecond; //秒
// } NET_DVR_TIME, *LPNET_DVR_TIME;

// typedef struct
// {
//     BYTE sSerialNumber[SERIALNO_LEN]; //序列号
//     BYTE byAlarmInPortNum;            //报警输入个数
//     BYTE byAlarmOutPortNum;           //报警输出个数
//     BYTE byDiskNum;                   //硬盘个数
//     BYTE byDVRType;                   //设备类型, 1:DVR 2:ATM DVR 3:DVS ......
//     BYTE byChanNum;                   //模拟通道个数
//     BYTE byStartChan;                 //起始通道号,例如DVS-1,DVR - 1
//     BYTE byAudioChanNum;              //语音通道数
//     BYTE byIPChanNum;                 //最大数字通道个数，低位
//     BYTE byZeroChanNum;               //零通道编码个数 //2010-01-16
//     BYTE byMainProto;                 //主码流传输协议类型 0-private, 1-rtsp,2-同时支持private和rtsp
//     BYTE bySubProto;                  //子码流传输协议类型0-private, 1-rtsp,2-同时支持private和rtsp
//     BYTE bySupport;                   //能力，位与结果为0表示不支持，1表示支持，
//     //bySupport & 0x1, 表示是否支持智能搜索
//     //bySupport & 0x2, 表示是否支持备份
//     //bySupport & 0x4, 表示是否支持压缩参数能力获取
//     //bySupport & 0x8, 表示是否支持多网卡
//     //bySupport & 0x10, 表示支持远程SADP
//     //bySupport & 0x20, 表示支持Raid卡功能
//     //bySupport & 0x40, 表示支持IPSAN 目录查找
//     //bySupport & 0x80, 表示支持rtp over rtsp
//     BYTE bySupport1; // 能力集扩充，位与结果为0表示不支持，1表示支持
//     //bySupport1 & 0x1, 表示是否支持snmp v30
//     //bySupport1 & 0x2, 支持区分回放和下载
//     //bySupport1 & 0x4, 是否支持布防优先级
//     //bySupport1 & 0x8, 智能设备是否支持布防时间段扩展
//     //bySupport1 & 0x10, 表示是否支持多磁盘数（超过33个）
//     //bySupport1 & 0x20, 表示是否支持rtsp over http
//     //bySupport1 & 0x80, 表示是否支持车牌新报警信息2012-9-28, 且还表示是否支持NET_DVR_IPPARACFG_V40结构体
//     BYTE bySupport2; /*能力，位与结果为0表示不支持，非0表示支持                            
//                      bySupport2 & 0x1, 表示解码器是否支持通过URL取流解码
//                      bySupport2 & 0x2,  表示支持FTPV40
//                      bySupport2 & 0x4,  表示支持ANR
//                      bySupport2 & 0x8,  表示支持CCD的通道参数配置
//                      bySupport2 & 0x10,  表示支持布防报警回传信息（仅支持抓拍机报警 新老报警结构）
//                      bySupport2 & 0x20,  表示是否支持单独获取设备状态子项
//     bySupport2 & 0x40,  表示是否是码流加密设备*/
//     WORD wDevType;   //设备型号
//     BYTE bySupport3; //能力集扩展，位与结果为0表示不支持，1表示支持
//     //bySupport3 & 0x1, 表示是否支持批量配置多码流参数
//     // bySupport3 & 0x4 表示支持按组配置， 具体包含 通道图像参数、报警输入参数、IP报警输入、输出接入参数、
//     // 用户参数、设备工作状态、JPEG抓图、定时和时间抓图、硬盘盘组管理
//     //bySupport3 & 0x8为1 表示支持使用TCP预览、UDP预览、多播预览中的"延时预览"字段来请求延时预览（后续都将使用这种方式请求延时预览）。而当bySupport3 & 0x8为0时，将使用 "私有延时预览"协议。
//     //bySupport3 & 0x10 表示支持"获取报警主机主要状态（V40）"。
//     //bySupport3 & 0x20 表示是否支持通过DDNS域名解析取流

//     BYTE byMultiStreamProto; //是否支持多码流,按位表示,0-不支持,1-支持,bit1-码流3,bit2-码流4,bit7-主码流，bit-8子码流
//     BYTE byStartDChan;       //起始数字通道号,0表示无效
//     BYTE byStartDTalkChan;   //起始数字对讲通道号，区别于模拟对讲通道号，0表示无效
//     BYTE byHighDChanNum;     //数字通道个数，高位
//     BYTE bySupport4;         //能力集扩展，位与结果为0表示不支持，1表示支持
//     //bySupport4 & 0x4表示是否支持拼控统一接口
//     // bySupport4 & 0x80 支持设备上传中心报警使能。表示判断调用接口是 NET_DVR_PDC_RULE_CFG_V42还是 NET_DVR_PDC_RULE_CFG_V41
//     BYTE byLanguageType; // 支持语种能力,按位表示,每一位0-不支持,1-支持
//     //  byLanguageType 等于0 表示 老设备
//     //  byLanguageType & 0x1表示支持中文
//     //  byLanguageType & 0x2表示支持英文
//     BYTE byVoiceInChanNum;     //音频输入通道数
//     BYTE byStartVoiceInChanNo; //音频输入起始通道号 0表示无效
//     BYTE bySupport5;           //按位表示,0-不支持,1-支持,bit0-支持多码流
//     //bySupport5 &0x01表示支持wEventTypeEx ,兼容dwEventType 的事件类型（支持行为事件扩展）--先占住，防止冲突
//     //bySupport5 &0x04表示是否支持使用扩展的场景模式接口
//     /*
//        bySupport5 &0x08 设备返回该值表示是否支持计划录像类型V40接口协议(DVR_SET_RECORDCFG_V40/ DVR_GET_RECORDCFG_V40)(在该协议中设备支持类型类型13的配置)
//        之前的部分发布的设备，支持录像类型13，则配置录像类型13。如果不支持，统一转换成录像类型3兼容处理。SDK通过命令探测处理)
//        bySupport5 &0x10 设备返回改值表示支持超过255个预置点
//     */
//     BYTE bySupport6; //能力，按位表示，0-不支持,1-支持
//     //bySupport6 0x1  表示设备是否支持压缩
//     //bySupport6 0x2 表示是否支持流ID方式配置流来源扩展命令，DVR_SET_STREAM_SRC_INFO_V40
//     //bySupport6 0x4 表示是否支持事件搜索V40接口
//     //bySupport6 0x8 表示是否支持扩展智能侦测配置命令
//     //bySupport6 0x40表示图片查询结果V40扩展
//     BYTE byMirrorChanNum;    //镜像通道个数，<录播主机中用于表示导播通道>
//     WORD wStartMirrorChanNo; //起始镜像通道号
//     BYTE bySupport7;         //能力,按位表示,0-不支持,1-支持
//     // bySupport7 & 0x1  表示设备是否支持 INTER_VCA_RULECFG_V42 扩展
//     // bySupport7 & 0x2  表示设备是否支持 IPC HVT 模式扩展
//     // bySupport7 & 0x04  表示设备是否支持 返回锁定时间
//     // bySupport7 & 0x08  表示设置云台PTZ位置时，是否支持带通道号
//     // bySupport7 & 0x10  表示设备是否支持双系统升级备份
//     // bySupport7 & 0x20  表示设备是否支持 OSD字符叠加 V50
//     // bySupport7 & 0x40  表示设备是否支持 主从跟踪（从摄像机）
//     // bySupport7 & 0x80  表示设备是否支持 报文加密
//     BYTE byRes2; //保留
// } NET_DVR_DEVICEINFO_V30, *LPNET_DVR_DEVICEINFO_V30;

// //回调函数的抽象集合
// % feature("director") CallbackStruct; //启动导演功能，注册一个可以被python继承的类
// % inline%{
//     struct CallbackStruct
//     {
//         //NET_DVR_SetExceptionCallBack_V30的回调函数
//         //异常、重连等消息的回调函数。
//         virtual void fExceptionCallBack(DWORD dwType, LONG lUserID, LONG lHandle, void *pUser) = 0;

//         virtual ~CallbackStruct() {}
//     };
// %}
// %{
//     //静态回调函数类
//     static CallbackStruct *C_callback = NULL;
//     static void fExceptionCallBack_helper(DWORD dwType, LONG lUserID, LONG lHandle, void *pUser)
//     {
//         return C_callback->fExceptionCallBack(dwType, lUserID, lHandle, pUser);
//     }
// %}
// % inline% {//封装成新的函数
//             BOOL NET_DVR_SetExceptionCallBack_V30_wrapper(UINT nMessage, HWND hWnd, CallbackStruct *cbExceptionCallBack, void *pUser){handler_ptr = cbExceptionCallBack;
// BOOL result = NET_DVR_SetExceptionCallBack_V30(nMessage, hWnd, &fExceptionCallBack_helper, pUser);
// cbExceptionCallBack = NULL;
// return result;
// }
// %}

// //初始化相关函数
// BOOL NET_DVR_Init();
// BOOL NET_DVR_SetConnectTime(DWORD dwWaitTime, DWORD dwTryTimes);
// DWORD NET_DVR_GetLastError();
// LONG NET_DVR_Login_V30(char *sDVRIP, WORD wDVRPort, char *sUserName, char *sPassword, LPNET_DVR_DEVICEINFO_V30 lpDeviceInfo);
// BOOL NET_DVR_GetDVRConfig(  LONG     lUserID,  DWORD    dwCommand,  LONG     lChannel,  LPVOID   lpOutBuffer,  DWORD    dwOutBufferSize,
//   LPDWORD  lpBytesReturned);
// BOOL NET_DVR_SetDVRConfig(LONG  lUserID,  DWORD  dwCommand,LONG lChannel,  LPVOID lpInBuffer,  DWORD    dwInBufferSize);

// % include "py_hk.h"