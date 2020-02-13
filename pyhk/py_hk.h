#include "HCNetSDK.h"


void test(LPNET_DVR_TIME x);
struct CallbackStruct
    {
        //NET_DVR_SetExceptionCallBack_V30的回调函数
        //异常、重连等消息的回调函数。
        virtual void fExceptionCallBack(DWORD dwType, LONG lUserID, LONG lHandle, void *pUser) = 0;
        
        
        virtual ~CallbackStruct() {}
    };