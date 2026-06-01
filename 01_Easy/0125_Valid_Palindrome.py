class Solution:
    def isPalindrome(self, s: str) -> bool:
        s = s.lower()      # convert all to lowercase

        for char in s:
            # Remove all non-alphanumeric characters
            if not((ord(char) >= 48 and ord(char) <= 57) or (ord(char) >= 97 and ord(char) <= 122)):
                s = s.replace(char, "")
        
        rev_s = s[::-1] # Compute the reverse string
        return  (s == rev_s) # Check if they are the same or not