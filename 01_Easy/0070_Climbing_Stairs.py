from math import ceil, sqrt

GOLDEN_RATIO = (1 + sqrt(5)) / 2

class Solution:
    # def climbStairs(self, n: int) -> int:  TIMED OUT

    #     # Base case
    #     if n == 1:
    #         return 1
    #     elif n == 2:
    #         return 2
        
    #     # Recursion
    #     next_num = self.climbStairs(n-1) + self.climbStairs(n-2)

    #     return next_num

    # def climbStairs(self, n:int) -> int: RECURSION W/ GOLDEN RATIO
    #     # Base case
    #     if n == 1:
    #         return 1

    #     # Compute the nth fibonacci number
    #     fib = GOLDEN_RATIO * self.climbStairs(n-1)

    #     return round(fib)

    def climbStairs(self, n:int) -> int:  # IN ONE LOOP
        # Base cases
        if n == 0 or n == 1:
            return 1

        prev = 1; curr = 1
        for i in range(2,n+1):
            dummy = curr
            curr += prev
            prev = dummy
        
        return curr
