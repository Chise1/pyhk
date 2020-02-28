from .hk_fun import MessageCallbackOp
def message_callback(func):
    class MsgCbk(MessageCallbackOp):
        def __init__(self):
            MessageCallbackOp.__init__(self)
        def MessageCallback(self, lCommand: "LONG", pAlarmer: "NET_DVR_ALARMER *", pAlarmInfo: "char *", dwBufLen: "DWORD", pUser: "void *") -> "void":
            return func(lCommand,pAlarmer,pAlarmInfo,dwBufLen,pUser)
    return MsgCbk()
