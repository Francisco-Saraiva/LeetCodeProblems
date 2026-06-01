using namespace std;
#include <vector>

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        int curr_num;
        int search_num;
        vector<int> output = {-1, -1};

        for (int i=0; i < nums.size(); i++){
            curr_num = nums.at(i);
            for (int j = i+1; j < nums.size(); j++){
                search_num = target - curr_num;
                if (nums.at(j) == search_num){
                    output = {i, j};
                }
            }
        }
        return output;
    }
};