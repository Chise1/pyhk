import pyhk
ip = str('192.168.1.64')  #摄像头IP地址，要和本机IP在同一局域网
name = str('admin')       #管理员用户名
pw = str('12345678')      #管理员密码
pyhk.init(ip, name, pw)