class Solution:
    def mySqrt(self, x: int) -> int:
        result = 0
        current_num = 0
        while True:
            result = current_num * current_num
            if result > x:
                return current_num - 1
                
            current_num += 1