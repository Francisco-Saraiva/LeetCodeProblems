class Solution:
    def convertToTitle(self, columnNumber: int) -> str:
        letter_list = []
        exponent = 0
        while columnNumber > 0:
            columnNumber -= 1  # Shift to account not having a 0 in the number system
            num_letter = columnNumber % 26
            letter_list.append(chr(num_letter+65))  # 0->A; 1->B;...

            columnNumber = columnNumber // 26
        
        # Reverse the list to get the correct order and join to form the final string
        letter_list.reverse()
        return ''.join(letter_list)

