"""
test callback 
"""
import swig_test as example



# PythonBinaryOp class is defined and derived from C++ class BinaryOp
class PythonBinaryOp(example.BinaryOp):

    # Define Python class 'constructor'
    def __init__(self):
        # Call C++ base class constructor
        example.BinaryOp.__init__(self)

    # Override C++ method: virtual int handle(int a, int b) = 0;
    def handle(self, a, b):
        # Return the product
        return a * b
handler = PythonBinaryOp()
result = example.binary_op_wrapper(10, 20, handler)
print(result)