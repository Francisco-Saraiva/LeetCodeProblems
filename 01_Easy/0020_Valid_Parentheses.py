class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        for char in s:
            if self.isOpening(char):
                stack.append(char)
            else:
                if not stack or not(self.isPair(stack[-1], char)):  # if stack is empy OR no match
                    return False
                else:
                    stack.pop(-1)
        if stack:
            return False
        else:
            return True

    def isOpening(self, char:str) -> bool:
        return char in "({["

    def isPair(self, open_char:str, close_char:str) -> bool:
        pairs = {"(": ")", "{": "}", "[": "]"}
        return pairs.get(open_char) == close_char