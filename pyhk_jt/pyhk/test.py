import pyhk
class CB(pyhk.MessageCallback_31Op):
    def __init__(self):
        pyhk.MessageCallback_31Op.__init__(self)
    def MessageCallback_31(self,lCommand, pAlarmer, pAlarmInfo , dwBufLen, pUser):
        print("回调成功")
        #MessageCallback_31(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void *pUser)
        print("信息：",hex(lCommand))
        print(pAlarmer)
        return 0
cb=CB()
pyhk.start_jt("192.168.10.35","admin","admin1234",cb)
import time
time.sleep(100)
pyhk.close_jt()