%module(directors="1") swig_test

%{
int binary_op(int a, int b, int (*op)(int, int)) {
  return op(a, b);
}
%}

%feature("director") BinaryOp;

%inline %{
struct BinaryOp {
  virtual int handle(int a, int b) = 0;
  virtual ~BinaryOp() {}
};
%}

%{
static BinaryOp *handler_ptr = NULL;
static int handler_helper(int a, int b) {
  // Make the call up to the target language when handler_ptr
  // is an instance of a target language director class
  return handler_ptr->handle(a, b);
}
// If desired, handler_ptr above could be changed to a thread-local variable in order to make thread-safe
%}

%inline %{
int binary_op_wrapper(int a, int b, BinaryOp *handler) {
  handler_ptr = handler;
  int result = binary_op(a, b, &handler_helper);
  handler = NULL;
  return result;
}
%}