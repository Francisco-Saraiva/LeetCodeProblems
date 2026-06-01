#include <cmath>
using namespace std;

class Solution {
public:
    bool isPalindrome(int x) {

        // Edge Cases
        if (x < 0){
            return false;
        } else if(x == 0) {
            return true;
        }
        

        // Variable declaration
        int digit;
        int long reverse = 0;
        int x_orig = x;
        
        // Count the number of digits
        int total_digits = floor(log10(x));
        int exponent = total_digits;

        // Number inversion
        while(exponent >= 0){
            digit = x % 10;
            x = x / 10;
            reverse = reverse + digit * pow(10, exponent);
            exponent--;
        }

        // True if they are the same; False otherwise
        return (x_orig == reverse);
    }
};