"""
get struct from .h
"""
import re
l_left=[]
l_right=[]
def get_struct(fileName:str):
    f=None
    with open(fileName,'r') as fr:
        f=fr.read()
        f=str(f)
    f=re.sub(r'\\ *?\n','',f,count=0,flags=re.M)
    f=re.sub(r'/\*.*?\*/','',f,count=0,flags=re.M)
    f=re.sub(r'//.*?\n','',f,count=0,flags=re.M)
    f=re.sub(r'/\*.*?\*/','',f,count=0,flags=re.M)
    with open('h_check.h','w',) as fw:
        fw.write(f)




get_struct("HCNetSDK.h")