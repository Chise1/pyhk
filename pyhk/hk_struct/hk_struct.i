%module(package="hk_struct") hk_struct
%feature("autodoc","2");
%{
#ifndef _WINDOWS_
 #if (defined(_WIN32) || defined(_WIN64))
 #include <winsock2.h>
 #include <windows.h> 
 #endif
#endif
#if defined(_WIN64)
#define OS_WINDOWS64 1
#endif
#if defined(__LP64__)
#define OS_POSIX64 1 
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
#if (defined(_WIN32)) 
#define NET_DVR_API  extern "C" __declspec(dllimport)
typedef unsigned __int64 UINT64;
typedef signed __int64 INT64;
#elif defined(__linux__) || defined(__APPLE__) 
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
 #ifndef __HDC_defined
#define __HDC_defined
 #if defined(__linux__)
typedef struct __DC
 {
 void* surface;
HWND hWnd;
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
%}
%inline%{
#define SERIALNO_LEN           48     
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
%}