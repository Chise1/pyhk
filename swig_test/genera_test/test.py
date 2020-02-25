import swig_example
x=swig_example.TestPoint()
void_p=swig_example.get_void_pointer()
print(void_p)
print(swig_example.sizeof_TestPoint)
# swig_example.memcpy(void_p,x,)