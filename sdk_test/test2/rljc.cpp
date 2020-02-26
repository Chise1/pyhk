/*#include <stdio.h>
#include <iostream>
#include "HCNetSDK.h"
#pragma warning(disable:4996)
using namespace std;

//时间解析宏定义
#define GET_YEAR(_time_)      (((_time_)>>26) + 2000)
#define GET_MONTH(_time_)     (((_time_)>>22) & 15)
#define GET_DAY(_time_)       (((_time_)>>17) & 31)
#define GET_HOUR(_time_)      (((_time_)>>12) & 31)
#define GET_MINUTE(_time_)    (((_time_)>>6)  & 63)
#define GET_SECOND(_time_)    (((_time_)>>0)  & 63)
BOOL CALLBACK MessageCallback_31(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void* pUser)
{
	switch (lCommand)
	{
	case COMM_ALARM_FACE_DETECTION: //人脸侦测报警信息
	{
		NET_DVR_FACE_DETECTION struFaceDetectionAlarm = { 0 };
		memcpy(&struFaceDetectionAlarm, pAlarmInfo, sizeof(NET_DVR_FACE_DETECTION));

		NET_DVR_TIME struAbsTime = { 0 };
		struAbsTime.dwYear = GET_YEAR(struFaceDetectionAlarm.dwAbsTime);
		struAbsTime.dwMonth = GET_MONTH(struFaceDetectionAlarm.dwAbsTime);
		struAbsTime.dwDay = GET_DAY(struFaceDetectionAlarm.dwAbsTime);
		struAbsTime.dwHour = GET_HOUR(struFaceDetectionAlarm.dwAbsTime);
		struAbsTime.dwMinute = GET_MINUTE(struFaceDetectionAlarm.dwAbsTime);
		struAbsTime.dwSecond = GET_SECOND(struFaceDetectionAlarm.dwAbsTime);

		//保存抓拍场景图片
		if (struFaceDetectionAlarm.dwBackgroundPicLen > 0 && struFaceDetectionAlarm.pBackgroundPicpBuffer != NULL)
		{
			char cFilename[256] = { 0 };
			HANDLE hFile;
			DWORD dwReturn;

			char chTime[128];
			sprintf(chTime, "%4.4d%2.2d%2.2d%2.2d%2.2d%2.2d", struAbsTime.dwYear, struAbsTime.dwMonth, struAbsTime.dwDay, struAbsTime.dwHour, struAbsTime.dwMinute, struAbsTime.dwSecond);

			sprintf(cFilename, "FaceDetectionBackPic[%s][%s].jpg", struFaceDetectionAlarm.struDevInfo.struDevIP.sIpV4, chTime);

			hFile = CreateFile(cFilename, GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
			if (hFile == INVALID_HANDLE_VALUE)
			{
				break;
			}
			WriteFile(hFile, struFaceDetectionAlarm.pBackgroundPicpBuffer, struFaceDetectionAlarm.dwBackgroundPicLen, &dwReturn, NULL);
			CloseHandle(hFile);
			hFile = INVALID_HANDLE_VALUE;
		}

		printf("人脸侦测报警[0x%x]: Abs[%4.4d%2.2d%2.2d%2.2d%2.2d%2.2d] Dev[ip:%s,port:%d,ivmsChan:%d] \n", \
			lCommand, struAbsTime.dwYear, struAbsTime.dwMonth, struAbsTime.dwDay, struAbsTime.dwHour, \
			struAbsTime.dwMinute, struAbsTime.dwSecond, struFaceDetectionAlarm.struDevInfo.struDevIP.sIpV4, \
			struFaceDetectionAlarm.struDevInfo.wPort, struFaceDetectionAlarm.struDevInfo.byIvmsChannel);
	}
	case COMM_UPLOAD_FACESNAP_RESULT: //人脸抓拍报警信息
	{
		NET_VCA_FACESNAP_RESULT struFaceSnap = { 0 };
		memcpy(&struFaceSnap, pAlarmInfo, sizeof(NET_VCA_FACESNAP_RESULT));

		NET_DVR_TIME struAbsTime = { 0 };
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
			char cFilename[256] = { 0 };

			HANDLE hFile;
			DWORD dwReturn;

			char chTime[128];
			sprintf(chTime, "%4.4d%2.2d%2.2d%2.2d%2.2d%2.2d", struAbsTime.dwYear, struAbsTime.dwMonth, struAbsTime.dwDay, struAbsTime.dwHour, struAbsTime.dwMinute, struAbsTime.dwSecond);

			sprintf(cFilename, "FaceSnapBackPic[%s][%s].jpg", struFaceSnap.struDevInfo.struDevIP.sIpV4, chTime);

			hFile = CreateFile(cFilename, GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
			if (hFile == INVALID_HANDLE_VALUE)
			{
				printf("error???");
				break;
			}
			WriteFile(hFile, struFaceSnap.pBuffer2, struFaceSnap.dwBackgroundPicLen, &dwReturn, NULL);
			CloseHandle(hFile);
			hFile = INVALID_HANDLE_VALUE;
			//cout << "抓拍时间：" << struFaceSnap.dwRelativeTime << "\n";
			//cout << "人脸ID：" << struFaceSnap.dwFacePicID << "\n";
			//cout << "人脸评分：" << struFaceSnap.dwFaceScore << "\n";

		}
		else {
			//cout << "无法保存" << "\n";
		}
		printf("人脸抓拍报警[0x%x]: Abs[%4.4d%2.2d%2.2d%2.2d%2.2d%2.2d] Dev[ip:%s,port:%d,ivmsChan:%d] \n", \
			lCommand, struAbsTime.dwYear, struAbsTime.dwMonth, struAbsTime.dwDay, struAbsTime.dwHour, \
			struAbsTime.dwMinute, struAbsTime.dwSecond, struFaceSnap.struDevInfo.struDevIP.sIpV4, \
			struFaceSnap.struDevInfo.wPort, struFaceSnap.struDevInfo.byIvmsChannel);
	}
	break;
	default:
		printf("其他报警，报警信息类型: 0x%x\n", lCommand);
		break;
	}

	return TRUE;
}
BOOL CALLBACK MessageCallback_64(LONG lCommand, NET_DVR_ALARMER *pAlarmer, char *pAlarmInfo, DWORD dwBufLen, void* pUser)
{
	switch (lCommand)
	{
	case COMM_ALARM_FACE_DETECTION: //人脸侦测报警信息
	{
		NET_DVR_FACE_DETECTION struFaceDetectionAlarm = { 0 };
		memcpy(&struFaceDetectionAlarm, pAlarmInfo, sizeof(NET_DVR_FACE_DETECTION));

		NET_DVR_TIME struAbsTime = { 0 };
		struAbsTime.dwYear = GET_YEAR(struFaceDetectionAlarm.dwAbsTime);
		struAbsTime.dwMonth = GET_MONTH(struFaceDetectionAlarm.dwAbsTime);
		struAbsTime.dwDay = GET_DAY(struFaceDetectionAlarm.dwAbsTime);
		struAbsTime.dwHour = GET_HOUR(struFaceDetectionAlarm.dwAbsTime);
		struAbsTime.dwMinute = GET_MINUTE(struFaceDetectionAlarm.dwAbsTime);
		struAbsTime.dwSecond = GET_SECOND(struFaceDetectionAlarm.dwAbsTime);

		//保存抓拍场景图片
		if (struFaceDetectionAlarm.dwBackgroundPicLen > 0 && struFaceDetectionAlarm.pBackgroundPicpBuffer != NULL)
		{
			char cFilename[256] = { 0 };
			HANDLE hFile;
			DWORD dwReturn;

			char chTime[128];
			sprintf(chTime, "%4.4d%2.2d%2.2d%2.2d%2.2d%2.2d", struAbsTime.dwYear, struAbsTime.dwMonth, struAbsTime.dwDay, struAbsTime.dwHour, struAbsTime.dwMinute, struAbsTime.dwSecond);

			sprintf(cFilename, "FaceDetectionBackPic[%s][%s].jpg", struFaceDetectionAlarm.struDevInfo.struDevIP.sIpV4, chTime);

			hFile = CreateFile(cFilename, GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
			if (hFile == INVALID_HANDLE_VALUE)
			{
				break;
			}
			WriteFile(hFile, struFaceDetectionAlarm.pBackgroundPicpBuffer, struFaceDetectionAlarm.dwBackgroundPicLen, &dwReturn, NULL);
			CloseHandle(hFile);
			hFile = INVALID_HANDLE_VALUE;
		}

		printf("人脸侦测报警[0x%x]: Abs[%4.4d%2.2d%2.2d%2.2d%2.2d%2.2d] Dev[ip:%s,port:%d,ivmsChan:%d] \n", \
			lCommand, struAbsTime.dwYear, struAbsTime.dwMonth, struAbsTime.dwDay, struAbsTime.dwHour, \
			struAbsTime.dwMinute, struAbsTime.dwSecond, struFaceDetectionAlarm.struDevInfo.struDevIP.sIpV4, \
			struFaceDetectionAlarm.struDevInfo.wPort, struFaceDetectionAlarm.struDevInfo.byIvmsChannel);
	}
	case COMM_UPLOAD_FACESNAP_RESULT: //人脸抓拍报警信息
	{
		NET_VCA_FACESNAP_RESULT struFaceSnap = { 0 };
		memcpy(&struFaceSnap, pAlarmInfo, sizeof(NET_VCA_FACESNAP_RESULT));

		NET_DVR_TIME struAbsTime = { 0 };
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
			char cFilename[256] = { 0 };

			HANDLE hFile;
			DWORD dwReturn;

			char chTime[128];
			sprintf(chTime, "%4.4d%2.2d%2.2d%2.2d%2.2d%2.2d", struAbsTime.dwYear, struAbsTime.dwMonth, struAbsTime.dwDay, struAbsTime.dwHour, struAbsTime.dwMinute, struAbsTime.dwSecond);

			sprintf(cFilename, "FaceSnapBackPic[%s][%s].jpg", struFaceSnap.struDevInfo.struDevIP.sIpV4, chTime);

			hFile = CreateFile(cFilename, GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
			if (hFile == INVALID_HANDLE_VALUE)
			{
				printf("error???");
				break;
			}
			WriteFile(hFile, struFaceSnap.pBuffer2, struFaceSnap.dwBackgroundPicLen, &dwReturn, NULL);
			CloseHandle(hFile);
			hFile = INVALID_HANDLE_VALUE;
			//cout << "抓拍时间：" << struFaceSnap.dwRelativeTime << "\n";
			//cout << "人脸ID：" << struFaceSnap.dwFacePicID << "\n";
			//cout << "人脸评分：" << struFaceSnap.dwFaceScore << "\n";

		}
		else {
			//cout << "无法保存" << "\n";
		}
		printf("人脸抓拍报警[0x%x]: Abs[%4.4d%2.2d%2.2d%2.2d%2.2d%2.2d] Dev[ip:%s,port:%d,ivmsChan:%d] \n", \
			lCommand, struAbsTime.dwYear, struAbsTime.dwMonth, struAbsTime.dwDay, struAbsTime.dwHour, \
			struAbsTime.dwMinute, struAbsTime.dwSecond, struFaceSnap.struDevInfo.struDevIP.sIpV4, \
			struFaceSnap.struDevInfo.wPort, struFaceSnap.struDevInfo.byIvmsChannel);
	}
	break;
	default:
		printf("其他报警，报警信息类型: 0x%x\n", lCommand);
		break;
	}

	return TRUE;
}
LONG init(std::string IP,std::string Username,std::string Password) {
	// 注册设备
	LONG lUserID;

	//登录参数，包括设备地址、登录用户、密码等
	NET_DVR_USER_LOGIN_INFO struLoginInfo = { 0 };
	struLoginInfo.bUseAsynLogin = 0; //同步登录方式
	strcpy(struLoginInfo.sDeviceAddress, IP.data()); //设备IP地址
	struLoginInfo.wPort = 8000; //设备服务端口
	strcpy(struLoginInfo.sUserName, Username.data()); //设备登录用户名
	strcpy(struLoginInfo.sPassword, Password.data()); //设备登录密码

	//设备信息, 输出参数
	NET_DVR_DEVICEINFO_V40 struDeviceInfoV40 = { 0 };

	lUserID = NET_DVR_Login_V40(&struLoginInfo, &struDeviceInfoV40);
	if (lUserID < 0)
	{
		printf( "登录失败:%s\n", IP.data());
		return 0;

	}
	else {
	printf("登录成功:%s\n", IP.data());
		return lUserID;
	}
}
int main() {
	//---------------------------------------
	// 初始化
	NET_DVR_Init();
	//设置连接时间与重连时间
	NET_DVR_SetConnectTime(2000, 1);
	NET_DVR_SetReconnect(10000, true);

	const int NUMBER = 2;
	//---------------------------------------
	// 注册设备
	LONG lUserID[NUMBER];

	//lUserID[0] = init("192.168.1.32", "admin", "admin1234");
	lUserID[0] = init("192.168.1.31", "admin", "ADMIN1234");
	//lUserID[2] = init("192.168.1.33", "admin", "ADMIN1234");
	lUserID[1] = init("192.168.1.64", "admin", "ADMIN1234");
	for (int i = 0; i < NUMBER; i++) {
		if (lUserID[i] < 0)
		{
			printf("Login failed, error code: %d\n", NET_DVR_GetLastError());
			NET_DVR_Cleanup();
			return 0;
		}
		else {

		}
	}
	//设置报警回调函数
	NET_DVR_SetDVRMessageCallBack_V31(MessageCallback_31,&lUserID[0]);
	NET_DVR_SetDVRMessageCallBack_V31(MessageCallback_64, &lUserID[1]);
	//NET_DVR_SetDVRMessageCallBack_V31(MessageCallback, &lUserID[1]);
	cout << "开始";
	//启用布防
	LONG lHandle[NUMBER];
	NET_DVR_SETUPALARM_PARAM  struAlarmParam_31 = { 0 };
	struAlarmParam_31.dwSize = sizeof(struAlarmParam_31);
	struAlarmParam_31.byFaceAlarmDetection = 1; //人脸侦测报警，设备支持人脸侦测功能的前提下，上传COMM_ALARM_FACE_DETECTION类型报警信息
	NET_DVR_SETUPALARM_PARAM  struAlarmParam_64 = { 0 };
	struAlarmParam_64.dwSize = sizeof(struAlarmParam_64);
	struAlarmParam_64.byFaceAlarmDetection = 1; //人脸侦测报警，设备支持人脸侦测功能的前提下，上传COMM_ALARM_FACE_DETECTION类型报警信息


	//其他报警布防参数不需要设置，不支持
	lHandle[0] = NET_DVR_SetupAlarmChan_V41(lUserID[0], &struAlarmParam_31);
	lHandle[1]= NET_DVR_SetupAlarmChan_V41(lUserID[1], &struAlarmParam_64);
	for (int i = 0; i < NUMBER; i++) {
		if (lHandle < 0)
		{
			printf("NET_DVR_SetupAlarmChan_V41 error, %d\n", NET_DVR_GetLastError());
			NET_DVR_Logout(lUserID[i]);
			NET_DVR_Cleanup();
			return 0;
		}
	}

	Sleep(5000000); //等待过程中，如果设备上传报警信息，在报警回调函数里面接收和处理报警信息
	for (int i = 0; i < NUMBER; i++) {
		//撤销布防上传通道
		if (!NET_DVR_CloseAlarmChan_V30(lHandle[i]))
		{
			printf("NET_DVR_CloseAlarmChan_V30 error, %d\n", NET_DVR_GetLastError());
			NET_DVR_Logout(lUserID[i]);
			NET_DVR_Cleanup();
			return 0;
		}

		//注销用户
		//NET_DVR_Logout(lUserID[i]);
	}
	//释放SDK资源
	NET_DVR_Cleanup();
	return 0;
}
*/
