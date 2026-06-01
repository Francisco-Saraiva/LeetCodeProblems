class Solution:
    def longestCommonPrefix(self, strs: list[str]) -> str:

        # Sort the array by word size
        strs.sort(key=len)

        common_prefix = ""
        longest_prefix = ""

        # Edge cases
        if len(strs) == 1:
            return strs[0]
        if len(strs) == 0:
            return ""

        # Main loops
        for j in range(len(strs[0])):
            common_prefix = strs[0][0:j+1]
            for i in range(1, len(strs)):
                prefix = strs[i][0:j+1]
                if prefix != common_prefix:
                    return longest_prefix
            longest_prefix = strs[0][0:j+1]

        return longest_prefix