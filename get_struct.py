"""
get struct from .h
"""
import re
l_left = []
l_right = []


def get_struct(fileName: str):
    f = None
    with open(fileName, 'r', encoding='utf8') as fr:
        f = fr.read()
        f = str(f)
    f = re.sub(r'\\ *?\n', '', f, count=0, flags=re.M)
    f = re.sub(r'/\*.*?\*/', '', f, count=0, flags=re.M)
    # f=re.sub(r'/\*(.|[\r\n])*?\*/','',f,count=0,flags=re.M)
    f = re.sub(r'//.*?\n', '\n', f, count=0, flags=re.M)
    f = re.sub(r'^ *\n', '', f, count=0, flags=re.I)
    f2=""
    f2_strcut=[]
    flags = []
    count = 0
    k_flag=0
    k_
    for i in range(len(f)):
        
        if f[i:i+14] == 'typedef struct':
            
            flags.append((i,count,'typedef struct'))
            count+=1
            i += 14
        elif f[i:i+12] == "typedef enum":
            flags.append((i,count,"typedef enum))
            count+=1
            i += 12
        elif f[i:i+13] == "typedef union":
            flags.append((i,count,"typedef union"))
            count+=1
            i += 13
        elif f[i:i+6] == 'struct':
            flags.append((i,count,'struct'))
            count+=1
            i += 6
        elif f[i:i+4] == "enum":
            flags.append((i,count,"enum"))
            count+=1
            i += 4
        elif f[i:i+5] == "union":
            flags.append((i,count,"union"))
            count+=1
            i += 5

        if f[i:i+14]=='typedef struct' or f[i:i+12]=="typedef enum" or f[i:i+13]=="typedef union" or f[i:i+6]=='struct' or f[i:i+4]=="enum" or f[i:i+5]=="union" :
            count+=1
        if f[i]=="}":
            while True:
                i+=1
                if f[i]==";"
                break

            r_s=f[flags[-1][0]:i+1]
            f2+=r_s
            name=r_s.split(flags[-1][2])[1]
            if len(name.split("{")[0].strip())!=0:
                name=name.split("{")[0].strip()
            else:
                name=name.split("}")[-1].split(",")[0].strip()
                
            f2_strcut.append(r_s.)
            count-=1


        #     flags.append(i)
        #     if
        elif f[i] == "}":
            count -= 1
        if count < 0:
            print(f[i:i+40])
            raise Exception("找到了")

    with open('h_check.h', 'w',) as fw:
        fw.write(f)


def get_struct_test(f: str):
    f = re.sub(r'/\*(.|[\r\n])*?\*/', '', f, count=0, flags=re.M)
    print(f)


f = """
#define DVR_VEHICLE_CONTROL_LIST   0x1 
    

/*************************************************
回放时播放控制命令宏定义 
NET_DVR_PlayBackControl
NET_DVR_PlayControlLocDisplay
NET_DVR_DecPlayBackCtrl的宏定义
具体支持查看函数说明和代码
**************************************************/    
#define NET_DVR_PLAYSTART        1
#define NET_DVR_PLAYSTOP        2
#define NET_DVR_PLAYPAUSE        3
"""


get_struct("HCNetSDK.h")
# get_struct_test(f)
