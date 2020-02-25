
struct
        {
            DWORD    dwAlarmInputNo;        
            DWORD    dwTrigerAlarmOutNum;    
            DWORD    dwTrigerRecordChanNum;    
        }_struIOAlarm;    
        struct
        {
            DWORD    dwAlarmChanNum;    
        }_struAlarmChannel;    
        struct
        {
            DWORD    dwAlarmHardDiskNum;    
        }_struAlarmHardDisk;    
        struct
        {
            BYTE       bySubAlarmType;  
            BYTE       byRes1[3]; 
            NET_DVR_TIME_EX  struRecordEndTime; 
        }_struRecordingHost;  
        struct
        {
            float	       fVoltageValue;
            BYTE       byVoltageAlarmType;  
            BYTE       byRes1[123]; 
        }_struVoltageInstable;  

typedef struct tagNET_DVR_ALARMINFO_FIXED_HEADER
{
    DWORD dwAlarmType;
    NET_DVR_TIME_EX struAlarmTime;    
    union
    {
        BYTE    byUnionLen[116];  
        
    }uStruAlarm;
    DWORD*  pRes;    
    BYTE    byTimeDiffFlag;      
    char    cTimeDifferenceH;         
    char    cTimeDifferenceM;      	
    BYTE    byRes2[5]; 
}NET_DVR_ALRAM_FIXED_HEADER, *LPNET_DVR_ALARM_FIXED_HEADER;