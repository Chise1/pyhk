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
