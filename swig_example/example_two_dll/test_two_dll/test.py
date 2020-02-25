import dll_one
dll_one.test()
import dll_two
dll_two.test()
x=dll_two.TEST_STRUCT()
x.a=1
x.b=2
dll_one.modify_dll_two_dll(10,x)
print(x.b)
