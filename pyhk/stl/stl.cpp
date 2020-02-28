#include <string>
#include <vector>

using namespace std;

vector<string> vector_int2str(vector<int> input) {
    vector<string> result;
    for (vector<int>::const_iterator it = input.begin();
        it != input.end();
        ++it) {
        result.push_back(to_string(*it));
    }
    return result;
}