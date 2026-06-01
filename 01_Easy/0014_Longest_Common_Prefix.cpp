#include <string>
#include <vector>

using namespace std;

class Solution {
public:
    string longestCommonPrefix(vector<string>& strs) {
        string common_prefix = "";
        string test_prefix = "";
        string curr_prefix = "";

        string comparing_string = strs.at(0);
        //char next_char = comparing_string.at(0);
        bool flag = false;
        for (int i = 1; i <= comparing_string.length(); i++){
            test_prefix = comparing_string.substr(0, i);

            for (int j = 1; j < strs.size(); j++){
                curr_prefix = strs.at(j).substr(0, i);

                flag = (curr_prefix != test_prefix);
                if (flag) {break;}
            }
            if (flag) {break;}
            common_prefix = test_prefix;
        }
        return common_prefix;
    }
        //std::cout << test_prefix << '\n';
};