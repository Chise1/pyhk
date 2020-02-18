%module(package="hk_function") hk_function
%header%{
    #include "HCNetSDK.h"
using namsespace std;
}
#define version 0.1
void version(){
        cout>>version>>endl;
}
