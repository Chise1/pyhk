#ifndef _WINDOWS_
    #if (defined(_WIN32) || defined(_WIN64))
        #include <winsock2.h>
        #include <windows.h>
    #endif
#endif

#if defined(_WIN64)
    #define OS_WINDOWS64    1
#endif

#if defined(__LP64__)
    #define OS_POSIX64    1
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

#if (defined(_WIN32)) //windows
    #define NET_DVR_API  extern "C" __declspec(dllimport)
    typedef  unsigned __int64   UINT64;
    typedef  signed   __int64   INT64;
#elif defined(__linux__) || defined(__APPLE__) //linux
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

    #ifndef TRUE
        #define TRUE  1
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
    typedef unsigned int   COLORKEY;
    typedef unsigned int   COLORREF;

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
                void*   surface;        //SDL Surface
                HWND    hWnd;           //HDC window handle
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

typedef struct
{
    float x;
    float y;
}POINTER,*LPPOINTER;
typedef struct{
    float x;
    float y;
    float vector_length;
}VECTOR;
typedef struct
{
    DWORD dwYear;   //年
    DWORD dwMonth;  //月
    DWORD dwDay;    //日
    DWORD dwHour;   //时
    DWORD dwMinute; //分
    DWORD dwSecond; //秒
} NET_DVR_TIME, *LPNET_DVR_TIME;
typedef int (CALLBACK *callback) (POINTER x,  POINTER y , VECTOR * vector_length);

NET_DVR_API void callback_get_result(POINTER x, POINTER y,callback fun,VECTOR *vector_length);
NET_DVR_API void get_length(POINTER a,POINTER b,float *result);
NET_DVR_API BOOL test_init();
