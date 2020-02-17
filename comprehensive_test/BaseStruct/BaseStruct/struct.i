%module(package="BaseStruct") BaseStruct
%header %{
#include "base.h"
%}
// %include "base_define.i"

%inline%{ 
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

int add(int a,int b){
    return a+b;
}
%}
 struct POINTER
{
    float x;
    float y;
};
struct VECTOR{
    float x;
    float y;
    float vector_length;
};
 struct NET_DVR_TIME
{
    DWORD dwYear;   //??
    DWORD dwMonth;  //??
    DWORD dwDay;    //??
    DWORD dwHour;   //?
    DWORD dwMinute; //??
    DWORD dwSecond; //??
} ;