import stl
# 测试cector
data = stl.vector_int2str([1, 2, 3])#Python层获取返回值时，却是tuple类型。传入时，也可直接使用list或tuple等类型。
print(data)  # ('1', '2', '3')
isinstance(data, tuple)  # True
stl.vector_int2str()