#include <stdio.h>
#include <iostream>
#include <HCNetSDK.h>
#include "string.h"
#include "pyhk.h"
using namespace std;
LONG lUserID;
LONG lHandle;


#define GET_MONTH(_time_) (((_time_) >> 22) & 15)
#define GET_DAY(_time_) (((_time_) >> 17) & 31)
#define GET_HOUR(_time_) (((_time_) >> 12) & 31)
#define GET_MINUTE(_time_) (((_time_) >> 6) & 63)
#define GET_SECOND(_time_) (((_time_) >> 0) & 63)
BOOL CALLBACK MessageCallback_31(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void *pUser)
{
	cout << "调用回调函数" << endl;
	switch (lCommand)
	{
	case COMM_ALARM_FACE_DETECTION: //人脸侦测报警信息
	{
		NET_DVR_FACE_DETECTION struFaceDetectionAlarm = {0};
		memcpy(&struFaceDetectionAlarm, pAlarmInfo, sizeof(NET_DVR_FACE_DETECTION));

		NET_DVR_TIME struAbsTime = {0};
		//时间解析宏定义
#define GET_YEAR(_time_) (((_time_) >> 26) + 2000)
		struAbsTime.dwYear = GET_YEAR(struFaceDetectionAlarm.dwAbsTime);
		struAbsTime.dwMonth = GET_MONTH(struFaceDetectionAlarm.dwAbsTime);
		struAbsTime.dwDay = GET_DAY(struFaceDetectionAlarm.dwAbsTime);
		struAbsTime.dwHour = GET_HOUR(struFaceDetectionAlarm.dwAbsTime);
		struAbsTime.dwMinute = GET_MINUTE(struFaceDetectionAlarm.dwAbsTime);
		struAbsTime.dwSecond = GET_SECOND(struFaceDetectionAlarm.dwAbsTime);

		//保存抓拍场景图片
		if (struFaceDetectionAlarm.dwBackgroundPicLen > 0 && struFaceDetectionAlarm.pBackgroundPicpBuffer != NULL)
		{
			char cFilename[256] = {0};
			DWORD dwReturn;

			char chTime[128];
			sprintf(chTime, "%4.4d%2.2d%2.2d%2.2d%2.2d%2.2d", struAbsTime.dwYear, struAbsTime.dwMonth, struAbsTime.dwDay, struAbsTime.dwHour, struAbsTime.dwMinute, struAbsTime.dwSecond);

			sprintf(cFilename, "FaceDetectionBackPic[%s][%s].jpg", struFaceDetectionAlarm.struDevInfo.struDevIP.sIpV4, chTime);
		}

		printf("人脸侦测报警[0x%x]: Abs[%4.4d%2.2d%2.2d%2.2d%2.2d%2.2d] Dev[ip:%s,port:%d,ivmsChan:%d] \n",
			   lCommand, struAbsTime.dwYear, struAbsTime.dwMonth, struAbsTime.dwDay, struAbsTime.dwHour,
			   struAbsTime.dwMinute, struAbsTime.dwSecond, struFaceDetectionAlarm.struDevInfo.struDevIP.sIpV4,
			   struFaceDetectionAlarm.struDevInfo.wPort, struFaceDetectionAlarm.struDevInfo.byIvmsChannel);
	}
	case COMM_UPLOAD_FACESNAP_RESULT: //人脸抓拍报警信息
	{
		NET_VCA_FACESNAP_RESULT struFaceSnap = {0};
		memcpy(&struFaceSnap, pAlarmInfo, sizeof(NET_VCA_FACESNAP_RESULT));

		NET_DVR_TIME struAbsTime = {0};
		struAbsTime.dwYear = GET_YEAR(struFaceSnap.dwAbsTime);
		struAbsTime.dwMonth = GET_MONTH(struFaceSnap.dwAbsTime);
		struAbsTime.dwDay = GET_DAY(struFaceSnap.dwAbsTime);
		struAbsTime.dwHour = GET_HOUR(struFaceSnap.dwAbsTime);
		struAbsTime.dwMinute = GET_MINUTE(struFaceSnap.dwAbsTime);
		struAbsTime.dwSecond = GET_SECOND(struFaceSnap.dwAbsTime);

		//保存抓拍场景图片
		//cout << struFaceSnap.dwBackgroundPicLen << "\n";
		if (struFaceSnap.dwBackgroundPicLen > 0 && struFaceSnap.pBuffer2 != NULL)
		{
			char cFilename[256] = {0};

			DWORD dwReturn;

			char chTime[128];
			sprintf(chTime, "%4.4d%2.2d%2.2d%2.2d%2.2d%2.2d", struAbsTime.dwYear, struAbsTime.dwMonth, struAbsTime.dwDay, struAbsTime.dwHour, struAbsTime.dwMinute, struAbsTime.dwSecond);

			sprintf(cFilename, "FaceSnapBackPic[%s][%s].jpg", struFaceSnap.struDevInfo.struDevIP.sIpV4, chTime);

			//cout << "抓拍时间：" << struFaceSnap.dwRelativeTime << "\n";
			//cout << "人脸ID：" << struFaceSnap.dwFacePicID << "\n";
			//cout << "人脸评分：" << struFaceSnap.dwFaceScore << "\n";
		}
		else
		{
			//cout << "无法保存" << "\n";
		}
		printf("人脸抓拍报警[0x%x]: Abs[%4.4d%2.2d%2.2d%2.2d%2.2d%2.2d] Dev[ip:%s,port:%d,ivmsChan:%d] \n",
			   lCommand, struAbsTime.dwYear, struAbsTime.dwMonth, struAbsTime.dwDay, struAbsTime.dwHour,
			   struAbsTime.dwMinute, struAbsTime.dwSecond, struFaceSnap.struDevInfo.struDevIP.sIpV4,
			   struFaceSnap.struDevInfo.wPort, struFaceSnap.struDevInfo.byIvmsChannel);
	}
	break;
	default:
		printf("其他报警，报警信息类型: 0x%x\n", lCommand);
		break;
	}

	return TRUE;
}

static MessageCallback_31Op* msgcbk31_ptr = NULL;
static BOOL CALLBACK  MessageCallback_31_helper(LONG lCommand, NET_DVR_ALARMER* pAlarmer, char* pAlarmInfo, DWORD dwBufLen, void* pUser) {
	// cout<<msgcbk31_ptr->MessageCallback_31<<endl;
	// return MessageCallback_31(lCommand,pAlarmer,pAlarmInfo,dwBufLen,pUser);
	msgcbk31_ptr->MessageCallback_31(lCommand, pAlarmer, pAlarmInfo, dwBufLen, pUser);
	return TRUE;
}



void close_jt(){
	if (!NET_DVR_CloseAlarmChan_V30(lHandle))
	{
		printf("NET_DVR_CloseAlarmChan_V30 error, %d\n", NET_DVR_GetLastError());
		NET_DVR_Logout(lUserID);
		NET_DVR_Cleanup();
	}
	//注销用户
	//NET_DVR_Logout(lUserID[i]);
	//释放SDK资源
	NET_DVR_Cleanup();
}
LONG init(char *IP, char *Username, char *Password)
{
	// 注册设备
	NET_DVR_DEVICEINFO_V30 struDeviceInfo;
	lUserID = NET_DVR_Login_V30(IP, 8000, Username, Password, &struDeviceInfo);
	// //设备信息, 输出参数
	// NET_DVR_DEVICEINFO_V40 struDeviceInfoV40 = { 0 };

	// lUserID = NET_DVR_Login_V40(&struLoginInfo, &struDeviceInfoV40);
	return lUserID;
}
int start_jt(char *IP, char *Username, char *Password, MessageCallback_31Op * fMessageCallBack)
{
	
	//---------------------------------------
	// 初始化
	NET_DVR_Init();
	
	//设置连接时间与重连时间
	NET_DVR_SetConnectTime(2000, 1);
	NET_DVR_SetReconnect(10000, true);
	//---------------------------------------
	// 注册设备
	char ip[] = "192.168.10.35";
	char username[] = "admin";
	char pwd[] = "admin1234";
	init(ip,username,pwd);
	//lUserID = init(IP, Username, Password);
	//lUserID[2] = init("192.168.1.33", "admin", "ADMIN1234");
	if (lUserID < 0)
	{
		printf("Login failed, error code: %d\n", NET_DVR_GetLastError());
		NET_DVR_Cleanup();
		return 0;
	}
	else
	{
		cout<<"Login success."<<endl;
	}

	//设置报警回调函数
	cout<<"msgcbk31_ptr:"<<msgcbk31_ptr<<endl;
	msgcbk31_ptr=fMessageCallBack;
	NET_DVR_SetDVRMessageCallBack_V31(MessageCallback_31_helper,&lUserID);
	fMessageCallBack=NULL;
	cout<<"msgcbk31_ptr:"<<msgcbk31_ptr<<endl;
	cout << "start" << endl;
	//cout<<"start"<<endl;
	//启用布防
	NET_DVR_SETUPALARM_PARAM struAlarmParam= { 0 };
	struAlarmParam.dwSize = sizeof(struAlarmParam);
	struAlarmParam.byDeployType = 1;
	struAlarmParam.byLevel = 1;
	/*if (intstruAlarmParam == NULL) {
		struAlarmParam = { 0 };
		struAlarmParam.dwSize = sizeof(struAlarmParam);
		struAlarmParam.byLevel = 1;
	}
	else {
		struAlarmParam = *intstruAlarmParam;
	}*/
	// struAlarmParam.byFaceAlarmDetection = 1; //人脸侦测报警，设备支持人脸侦测功能的前提下，上传COMM_ALARM_FACE_DETECTION类型报警信息
	//其他报警布防参数不需要设置，不支持
	lHandle = NET_DVR_SetupAlarmChan_V41(lUserID, &struAlarmParam);
	if (lHandle < 0)
	{
		printf("NET_DVR_SetupAlarmChan_V41 error, %d\n", NET_DVR_GetLastError());
		NET_DVR_Logout(lUserID);
		NET_DVR_Cleanup();
		return 0;
	}
	else {
		cout << "alarm success." << endl;
	}
	return 0;
}

