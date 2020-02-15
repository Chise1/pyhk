%module base
%header %{
#include "base.h"
%}
%import ""
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