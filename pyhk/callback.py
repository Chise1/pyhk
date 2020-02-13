import pyhk

# PythonBinaryOp class is defined and derived from C++ class BinaryOp
class fExceptionCallBack(pyhk.CallbackStruct):

    # Define Python class 'constructor'
    def __init__(self):
        # Call C++ base class constructor
        pyhk.CallbackStruct.__init__(self)
    # Override C++ method: virtual int handle(int a, int b) = 0;
    def fExceptionCallBack(self,dwType, lUserID, lHandle, pUser):
        # Return the product
        print("fExceptionCallBack函数")

#使用方法如下：
# For this to work from Python, an instance of the PythonBinaryOp class is created and then passed to binary_op_wrapper. The net result is the binary_op function will in turn be called which will call handler_helper which will call the virtual handle method, that is, the Python method handle in the PythonBinaryOp class. The result will be the product of 10 and 20 and make its way back to Python and hence 200 will be printed with the following code:
# handler = fExceptionCallBack()
# result = pyhk.NET_DVR_SetExceptionCallBack_V30_wrapper(10, 20, handler)
# print(result)