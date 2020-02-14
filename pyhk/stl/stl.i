%module(package="stl") stl
%include "std_string.i"
%include "std_vector.i"
%header%{
    #include "stl.h"
}
// %{
//     using namespace std;
//     vector<string> vector_int2str(vector<int> input);
// %}
namespace std{
    %template(StringVector) vector<string>;
    %template(IntVector) vector<int>;
}

%include "stl.h"