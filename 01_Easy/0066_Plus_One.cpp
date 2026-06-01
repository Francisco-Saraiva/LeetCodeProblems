#include <vector>

using namespace std;

class Solution {
public:
    vector<int> plusOne(vector<int>& digits) {

        int input_size = digits.size();
        // create output vector
        vector<int> result(input_size);

        int carry_over = 1; // This is the "plusOne part"
        int digit;
        for (int i = input_size - 1; i >= 0; i--){
            // sum calculation
            digit = carry_over + digits.at(i);
            
            // calculate carry over and update the digit
            carry_over = digit / 10;
            digit = digit % 10;

            // store the digit in the output vector
            result.at(i) = digit;
        }

        // Add the carry over to the beginning of the number
        // Will always work in this simplistic way if the carry over is 9 or less; otherwise, we need to count the digits
        if (carry_over != 0){
            result.resize(input_size + 1);
            result.at(0) = carry_over;
        }

        return result;
    }
};