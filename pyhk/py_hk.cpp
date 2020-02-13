//HKIPcamera.cpp
#include <iostream>
#include <time.h>
#include <cstdio>
#include <cstring>
#include <list>
#include "HCNetSDK.h"
#include <unistd.h>
#include <pthread.h>
using namespace std;


void test(LPNET_DVR_TIME x){
    x->dwHour=10;
}

void init(char* ip, char* usr, char* password){
// pthread_t hThread;
cout << "IP:" << ip << "    UserName:" << usr << "    PassWord:" << password << endl;
NET_DVR_Init();
NET_DVR_SetConnectTime(2000, 1);
NET_DVR_SetReconnect(10000, true);
// pthread_mutex_init(&g_cs_frameList, NULL);
//hThread = ::CreateThread(NULL, 0, ReadCamera, NULL, 0, 0);
// pthread_create(&hThread, NULL, ReadCamera, NULL);
}

void release(){
NET_DVR_Cleanup();
}
