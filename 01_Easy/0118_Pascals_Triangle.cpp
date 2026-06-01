#include <vector>

using namespace std;

class Solution {
public:
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
};