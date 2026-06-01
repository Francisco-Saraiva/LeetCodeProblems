class Solution:
    def removeElement(self, nums: list[int], val: int) -> int:
        nums[:] = [num for num in nums if num != val]
        return len(nums)