class Solution:
    def generate(self, numRows: int) -> list[list[int]]:
        # Base case
        if numRows == 1:
            return [[1]]

        # Get the previous row
        triangle = self.generate(numRows-1)
        previous_row = triangle[-1]

        # Build the current row based on the previous one
        current_row = [1] * numRows
        for i in range(1,numRows-1):
            current_row[i] = previous_row[i-1] + previous_row[i]
        
        triangle.append(current_row)
        return triangle
        
            