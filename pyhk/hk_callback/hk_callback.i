%module(directors="1",package="hk_callback") hk_callback
    // %{
    //     #include "HCNetSDK.h"
    // %}
%include  "../hk_struct/hk_struct.i"
%feature("autodoc","2");
%feature("director")MSGCallBackOp;
%inline%{
struct MSGCallBackOp{
    virtual  void MSGCallBack(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void* pUser)=0;
    virtual ~MSGCallBackOp(){}};
%}
%{
static MSGCallBackOp *MSGCallBackOp_ptr=NULL;
static void MSGCallBack_helper(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void* pUser){
    return MSGCallBackOp_ptr->MSGCallBack(lCommand, pAlarmer, pAlarmInfo, dwBufLen, pUser);}
%}