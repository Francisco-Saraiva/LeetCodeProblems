#include <vector>

using namespace std;

// I tried to solve this problem using the formula for the elements of Pascal's triangle, which is n! / (k! * (n-k)!). 
// However, this approach causes overflows with the factorial function, even when using 'long long int' as the return type. 
// Therefore, I decided to use the same recursive approach as in problem 118 - Pascal's Triangle, and then simply return the last row of the generated triangle.

class Solution {
public:
    // // Return a 'long long int' to prevent overflows with the factorial --> STILL DOES
    // long long int factorial(int num){
    //     long long int result = 1;
    //     for (int i = 2; i <= num; i++){
    //         result = result * i; // keep multiplying the number by increasing values res=1*2*3*4*...
    //     }
    //     return result;
    // }

    // vector<int> getRow(int rowIndex) {
    //     // Result row; start them on 1 to make less calculations
    //     vector<int> row(rowIndex + 1, 1);
    //     long long int element;

    //     for (int k=1; k < rowIndex; k++){
    //         // Full expression
    //         element = factorial(rowIndex) / (factorial(k) * factorial(rowIndex - k));

    //         // Cast it back into int to match the datatype of the vector
    //         row.at(k) = static_cast<int>(element);
    //     }
    //     return row;
    // }

    // CODE FROM PROBLEM 118 - PASCAL'S TRIANGLE
    vector<vector<int>> generate(int numRows) {
        // Base case
        if (numRows == 1){
            return vector<vector<int>> {{1}};
        }

        // ------------- Recursion Steps ----------------
        // Get the previous triangle
        vector<vector<int>> triangle = this->generate(numRows - 1);

        // Get the last generated row
        vector<int> previous_row = triangle.at(numRows - 2);

        // Generate the next row based on the previous row
        vector<int> next_row(numRows, 1);
        for (int i=1; i < numRows-1; i++){
            next_row.at(i) = previous_row.at(i-1) + previous_row.at(i);
        }

        // Add it to the triangle
        triangle.insert(triangle.end(), next_row);

        // Return the triangle
        return triangle;
    }


    vector<int> getRow(int rowIndex) {
        // First generate the triangle for this row
        vector<vector<int>> triangle = this->generate(rowIndex+1);

        // Get the last row and return it
        return triangle.at(triangle.size()-1);
    }

};