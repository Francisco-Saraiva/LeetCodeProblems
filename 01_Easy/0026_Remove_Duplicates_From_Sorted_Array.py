class Solution:
    def removeDuplicates(self, nums: list[int]) -> int:
        # Remove duplicates from list
        nums[:] = list(set(nums[:]))

        # In-place sort
        nums.sort()

        # Return the element count
        return len(nums)