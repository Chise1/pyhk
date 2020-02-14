%include "base_define.i"
//注册结构体
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

typedef struct
{
    BYTE sSerialNumber[SERIALNO_LEN]; //序列号
    BYTE byAlarmInPortNum;            //报警输入个数
    BYTE byAlarmOutPortNum;           //报警输出个数
    BYTE byDiskNum;                   //硬盘个数
    BYTE byDVRType;                   //设备类型, 1:DVR 2:ATM DVR 3:DVS ......
    BYTE byChanNum;                   //模拟通道个数
    BYTE byStartChan;                 //起始通道号,例如DVS-1,DVR - 1
    BYTE byAudioChanNum;              //语音通道数
    BYTE byIPChanNum;                 //最大数字通道个数，低位
    BYTE byZeroChanNum;               //零通道编码个数 //2010-01-16
    BYTE byMainProto;                 //主码流传输协议类型 0-private, 1-rtsp,2-同时支持private和rtsp
    BYTE bySubProto;                  //子码流传输协议类型0-private, 1-rtsp,2-同时支持private和rtsp
    BYTE bySupport;                   //能力，位与结果为0表示不支持，1表示支持，
    BYTE bySupport1; 
    BYTE bySupport2; 
    WORD wDevType;   //设备型号
    BYTE bySupport3; 
    BYTE byMultiStreamProto; //是否支持多码流,按位表示,0-不支持,1-支持,bit1-码流3,bit2-码流4,bit7-主码流，bit-8子码流
    BYTE byStartDChan;       //起始数字通道号,0表示无效
    BYTE byStartDTalkChan;   //起始数字对讲通道号，区别于模拟对讲通道号，0表示无效
    BYTE byHighDChanNum;     //数字通道个数，高位
    BYTE bySupport4;         //能力集扩展，位与结果为0表示不支持，1表示支持
   BYTE byLanguageType; // 支持语种能力,按位表示,每一位0-不支持,1-支持
    BYTE byVoiceInChanNum;     //音频输入通道数
    BYTE byStartVoiceInChanNo; //音频输入起始通道号 0表示无效
    BYTE bySupport5;           //按位表示,0-不支持,1-支持,bit0-支持多码流
    //bySupport5 &0x01表示支持wEventTypeEx ,兼容dwEventType 的事件类型（支持行为事件扩展）--先占住，防止冲突
    //bySupport5 &0x04表示是否支持使用扩展的场景模式接口
    /*
       bySupport5 &0x08 设备返回该值表示是否支持计划录像类型V40接口协议(DVR_SET_RECORDCFG_V40/ DVR_GET_RECORDCFG_V40)(在该协议中设备支持类型类型13的配置)
       之前的部分发布的设备，支持录像类型13，则配置录像类型13。如果不支持，统一转换成录像类型3兼容处理。SDK通过命令探测处理)
       bySupport5 &0x10 设备返回改值表示支持超过255个预置点
    */
    BYTE bySupport6; //能力，按位表示，0-不支持,1-支持
    //bySupport6 0x1  表示设备是否支持压缩
    //bySupport6 0x2 表示是否支持流ID方式配置流来源扩展命令，DVR_SET_STREAM_SRC_INFO_V40
    //bySupport6 0x4 表示是否支持事件搜索V40接口
    //bySupport6 0x8 表示是否支持扩展智能侦测配置命令
    //bySupport6 0x40表示图片查询结果V40扩展
    BYTE byMirrorChanNum;    //镜像通道个数，<录播主机中用于表示导播通道>
    WORD wStartMirrorChanNo; //起始镜像通道号
    BYTE bySupport7;         //能力,按位表示,0-不支持,1-支持
    // bySupport7 & 0x1  表示设备是否支持 INTER_VCA_RULECFG_V42 扩展
    // bySupport7 & 0x2  表示设备是否支持 IPC HVT 模式扩展
    // bySupport7 & 0x04  表示设备是否支持 返回锁定时间
    // bySupport7 & 0x08  表示设置云台PTZ位置时，是否支持带通道号
    // bySupport7 & 0x10  表示设备是否支持双系统升级备份
    // bySupport7 & 0x20  表示设备是否支持 OSD字符叠加 V50
    // bySupport7 & 0x40  表示设备是否支持 主从跟踪（从摄像机）
    // bySupport7 & 0x80  表示设备是否支持 报文加密
    BYTE byRes2; //保留
} NET_DVR_DEVICEINFO_V30, *LPNET_DVR_DEVICEINFO_V30;