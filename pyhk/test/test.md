需要测试的项目
- tagInitInfo(INITINFO) //code 64
- BOOL NET_DVR_Init();
-BOOL NET_DVR_SetConnectTime(  DWORD   dwWaitTime,  DWORD   dwTryTimes);
需要测试在c里面生成的线程会不会阻塞python的GIL