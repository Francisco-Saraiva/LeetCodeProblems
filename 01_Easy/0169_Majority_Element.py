class Solution:
    def majorityElement(self, nums: list[int]) -> int:
        max_elems = len(nums) // 2
        
        counts = {}
        
        for num in nums:
            counts[num] = counts.get(num, 0) + 1
            
            if counts[num] > max_elems:
                return num

    # This is the implementation of the Boyer-Moore Voting Algorithm
    # It is more efficient in terms of space complexity, as it only uses O(1) space.  
     
    # def majorityElement(self, nums: List[int]) -> int:
    #     candidate = None
    #     count = 0
        
    #     for num in nums:
    #         if count == 0:
    #             candidate = num          # Set new candidate
            
    #         if num == candidate:
    #             count += 1
    #         else:
    #             count -= 1
        
    #     return candidate