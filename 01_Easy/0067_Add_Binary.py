class Solution:
    def addBinary(self, a: str, b: str) -> str:
        idx = -1
        carry_over = 0
        res = []
        max_length = max(len(a), len(b))

        while max_length > 0 or carry_over:
            a_int = int(a[idx]) if -idx <= len(a) else 0
            b_int = int(b[idx]) if -idx <= len(b) else 0

            digit_sum = a_int + b_int + carry_over
            res.insert(0, str(digit_sum % 2))
            carry_over = digit_sum // 2

            idx -= 1
            max_length -= 1

        return ''.join(res)