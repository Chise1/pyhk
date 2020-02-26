%module(package="pyhk",directors="1") pyhk
%feature("autodoc","2");
%{
    #include "HCNetSDK.h"
    #include "pyhk.h"
%}
#define __stdcall 
#define CALLBACK  
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
typedef struct tagNET_DVR_SETUPALARM_PARAM
{
    DWORD dwSize;
    BYTE  byLevel; //�������ȼ���0-һ�ȼ����ߣ���1-���ȼ����У���2-���ȼ����ͣ�
    BYTE  byAlarmInfoType; //�ϴ�������Ϣ���ͣ�ץ�Ļ�֧�֣���0-�ϱ�����Ϣ��NET_DVR_PLATE_RESULT����1-�±�����Ϣ(NET_ITS_PLATE_RESULT)2012-9-28
    BYTE  byRetAlarmTypeV40; //0--����NET_DVR_ALARMINFO_V30��NET_DVR_ALARMINFO, 1--�豸֧��NET_DVR_ALARMINFO_V40�򷵻�NET_DVR_ALARMINFO_V40����֧���򷵻�NET_DVR_ALARMINFO_V30��NET_DVR_ALARMINFO
    BYTE  byRetDevInfoVersion; //CVR�ϴ�������Ϣ�ص��ṹ��汾�� 0-COMM_ALARM_DEVICE�� 1-COMM_ALARM_DEVICE_V40
    BYTE  byRetVQDAlarmType; //VQD�����ϴ����ͣ�0-�ϴ�������NET_DVR_VQD_DIAGNOSE_INFO��1-�ϴ�����NET_DVR_VQD_ALARM
    //1-��ʾ������ⱨ����չ(INTER_FACE_DETECTION),0-��ʾԭ��֧�ֽṹ(INTER_FACESNAP_RESULT)
    BYTE  byFaceAlarmDetection;
    //Bit0- ��ʾ���������Ƿ��ϴ�ͼƬ: 0-�ϴ���1-���ϴ�
    //Bit1- ��ʾ���������ϴ�ȷ�ϻ��ƣ�0-��������1-����
    //Bit6- ��ʾ�״��ⱨ��(eventType:radarDetection)�Ƿ���ʵʱ�ϴ���0-��������1-����������web���ʵʱ��ʾ�״�Ŀ��켣��
    BYTE  bySupport;
    //������������ 
    //bit0-���Ƽ�⣨IPC�� ��0-��������1-������
    //bit1-����ͳ�ƣ�IPC��  ��0-��������1-������
    //bit2-�ȶ�ͼͳ�ƣ�IPC�� ��0-��������1-������
    //bit3-����ץ�ģ�IPC�� ��0-��������1-������
    //bit4-�����Աȣ�IPC�� ��0-��������1-������
    BYTE  byBrokenNetHttp;
    WORD  wTaskNo;    //�������� �� (�ϴ�����NET_DVR_VEHICLE_RECOG_RESULT�е��ֶ�dwTaskNo��Ӧ ͬʱ �·�����ṹ NET_DVR_VEHICLE_RECOG_COND�е��ֶ�dwTaskNo��Ӧ)
    BYTE  byDeployType;    //�������ͣ�0-�ͻ��˲�����1-ʵʱ����
    BYTE  byRes1[3];
    BYTE  byAlarmTypeURL;//bit0-��ʾ����ץ�ı����ϴ���INTER_FACESNAP_RESULT����0-��ʾ�����ƴ��䣬1-��ʾURL���䣨�豸֧�ֵ�����£��豸֧���������ݾ��屨���������ж�,ͬʱ�豸��Ҫ֧��URL����ط��񣬵�ǰ�ǡ��ƴ洢����
    //bit1-��ʾEVENT_JSON��ͼƬ���ݳ������ͣ�0-��ʾ�����ƴ��䣬1-��ʾURL���䣨�豸֧�ֵ�����£��豸֧���������ݾ��屨���������жϣ�
    //bit2 - �����ȶ�(��������ΪCOMM_SNAP_MATCH_ALARM)��ͼƬ�����ϴ����ͣ�0 - �����ƴ��䣬1 - URL����
    //bit3 - ��Ϊ����(��������ΪCOMM_ALARM_RULE)��ͼƬ�����ϴ����ͣ�0 - �����ƴ��䣬1 - URL���䣬���ֶ��豸�Ƿ�֧�֣���Ӧ��Ӳ����������<isSupportBehaviorUploadByCloudStorageURL>�ڵ��Ƿ񷵻���Ϊtrue
    BYTE  byCustomCtrl;//Bit0- ��ʾ֧�ָ���ʻ������ͼ�ϴ�: 0-���ϴ�,1-�ϴ�
}NET_DVR_SETUPALARM_PARAM, * LPNET_DVR_SETUPALARM_PARAM;
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
%feature("director")  MessageCallback_31Op;

%include "pyhk.h"