import math

class Solution:
    def minPairSum(self, nums: List[int]) -> int:
        # Sort the list
        nums.sort()

        max_sum = -math.inf
        for i in range(len(nums)//2 + 1):
            # Sum the first and last elements
            sum_ = nums[i] + nums[-(i+1)]
            max_sum = sum_ if sum_ > max_sum else max_sum
        
        return max_sum