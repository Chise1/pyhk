%include "base_define.i"
%include "struct.i"
//回调函数的抽象集合
%feature("director") CallbackStruct; //启动导演功能，注册一个可以被python继承的类
%inline%{
    struct CallbackStruct
    {
        //NET_DVR_SetExceptionCallBack_V30的回调函数
        //异常、重连等消息的回调函数。
        virtual void fExceptionCallBack(DWORD dwType, LONG lUserID, LONG lHandle, void *pUser) = 0;
        virtual ~CallbackStruct() {}
    };
%}
%{
    //静态回调函数类
    static CallbackStruct *C_callback = NULL;
    static void fExceptionCallBack_helper(DWORD dwType, LONG lUserID, LONG lHandle, void *pUser)
    {
        return C_callback->fExceptionCallBack(dwType, lUserID, lHandle, pUser);
    }
%}
%inline%{//封装成新的函数
        NET_DVR_API __stdcall    BOOL NET_DVR_SetExceptionCallBack_V30_wrapper(UINT reserved1, void* reserved2, CallbackStruct *cbExceptionCallBack, void *pUser)
            {
                C_callback = cbExceptionCallBack;
BOOL result = NET_DVR_SetExceptionCallBack_V30(reserved1, reserved2, &fExceptionCallBack_helper, pUser);
cbExceptionCallBack = NULL;
return result;
}
%}