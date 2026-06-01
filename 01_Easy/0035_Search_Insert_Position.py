class Solution:
    def searchInsert(self, nums: list[int], target: int) -> int:
        
        length = len(nums)

        # Edge cases
        if target <= nums[0]:
            return 0
        elif target > nums[-1]:
            return length
        elif target == nums[-1]:
            return length - 1 
        
        # Main loop
        for i in range(1, length):
            if target <= nums[i]:
                return i 