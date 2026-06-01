class Solution:
    def romanToInt(self, s: str) -> int:
        letter_dict = {
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000,
        }

        total = 0
        i = 0

        while i < len(s):
            let1 = s[i]
            let2 = s[i+1] if (i+1) < len(s) else "I"

            let1_val = letter_dict[let1]
            let2_val = letter_dict[let2]

            if let1_val >= let2_val:
                total += let1_val
                i += 1
            else:
                total += let2_val - let1_val
                i += 2

        return total