class Solution:
    def twoSum(self, nums: list[int], target: int) -> list[int]:
        length = len(nums)
        start_idx = 0
        for i in range(length):
            num = nums[i]
            leftover = target - num
            for j in range(i+1, length):
                if nums[j] == leftover:
                    return [i, j]