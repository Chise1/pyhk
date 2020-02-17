#define BOOL int
    typedef unsigned int DWORD;
    typedef unsigned short WORD;
    typedef unsigned short USHORT;
    typedef short SHORT;
    typedef int LONG;
    typedef unsigned char BYTE;
    typedef unsigned int UINT;
    typedef void *LPVOID;
    typedef void *HANDLE;
    typedef unsigned int *LPDWORD;
    typedef unsigned long long UINT64;
    typedef signed long long INT64;
    typedef unsigned int HWND;
    #define NET_DVR_API extern "C"
typedef unsigned int COLORKEY;
typedef unsigned int COLORREF;

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


#ifndef __HWND_defined
#define __HWND_defined
#endif

#ifndef __HDC_defined
#define __HDC_defined
#if defined(__linux__)
typedef struct __DC
{
    void *surface; //SDL Surface
    HWND hWnd;     //HDC window handle
} DC,*HDC;
#else
typedef void *HDC;
#endif
#endif
