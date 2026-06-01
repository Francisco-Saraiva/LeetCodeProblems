class Solution:
    def singleNumber(self, nums: list[int]) -> int:
        odd_nums = set()
        for num in nums:
            if num in odd_nums:
                odd_nums.discard(num)
            else:
                odd_nums.add(num)
        
        # Will only have 1 left, so it will always be correct
        return odd_nums.pop()