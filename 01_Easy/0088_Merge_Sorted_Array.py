class Solution:
    def merge(self, nums1: list[int], m: int, nums2: list[int], n: int) -> None:

        idx2 = 0

        # Edge case: nums1 initially empty
        if m == 0:
            nums1[:] = nums2
        else:
            i = 0
            while idx2 < n and i < m:
                if nums2[idx2] < nums1[i]:
                    # shift nums1 right
                    nums1[i+1:m+1] = nums1[i:m]
                    nums1[i] = nums2[idx2]

                    idx2 += 1
                    m += 1
                i += 1

            # append remaining nums2 elements if any
            if idx2 < n:
                nums1[m:m + (n - idx2)] = nums2[idx2:]