class Solution:
    # Brute Force Approach: O(n^3) time complexity, O(1) space complexity
    def countSubstrings(self, s: str) -> int:

        ptr_start = 0
        ptr_end = 1
        substr_size = 1
        string_length = len(s)

        num_palindromes = 0

        while substr_size <= string_length:
            ptr_end = ptr_start + substr_size

            curr_substr = s[ptr_start:ptr_end]
            if curr_substr == curr_substr[::-1]:
                num_palindromes += 1
            
            ptr_start += 1

            if ptr_start + substr_size > string_length:
                substr_size += 1
                ptr_start = 0
        
        return num_palindromes