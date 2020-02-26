#include <HCNetSDK.h>
struct MessageCallback_31Op {
	virtual  void MessageCallback_31(LONG lCommand, NET_DVR_ALARMER* pAlarmer, char* pAlarmInfo, DWORD dwBufLen, void* pUser) = 0;
	virtual ~MessageCallback_31Op() {}
};

void close_jt();
int start_jt(char* IP, char* Username, char* Password, MessageCallback_31Op* fMessageCallBack);