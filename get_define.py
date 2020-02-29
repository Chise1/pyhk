import re
with open('hcn_define.h','r') as f:
    with open('define.py' , 'w') as w:
        for i in f.readlines():
            s=re.sub(' +',' ',i)
            print(s.split(' '))
            name=s.split(' ')[1]
            value="".join(s.split(' ')[2:])
            print(value)
            w.write(name+"="+value+"\n")