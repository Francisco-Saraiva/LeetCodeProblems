class Solution:
    def plusOne(self, digits: list[int]) -> list[int]:
        carry_over = 1
        idx = -1
        size = len(digits)
        while carry_over > 0 and abs(idx) <= size:
            if digits[idx] < 9:
                digits[idx] += 1
                carry_over = 0
            else:
                digits[idx] = 0
            idx -= 1
        
        if carry_over > 0:
            digits.insert(0, 1)
        
        return digits