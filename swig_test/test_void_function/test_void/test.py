import test_void
print(test_void.__doc__)
x=test_void.VoidStruct()
x.a=10
print(test_void.get_void_value(x))