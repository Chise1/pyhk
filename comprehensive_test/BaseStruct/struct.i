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
    DWORD dwYear;   //��
    DWORD dwMonth;  //��
    DWORD dwDay;    //��
    DWORD dwHour;   //ʱ
    DWORD dwMinute; //��
    DWORD dwSecond; //��
} NET_DVR_TIME, *LPNET_DVR_TIME;