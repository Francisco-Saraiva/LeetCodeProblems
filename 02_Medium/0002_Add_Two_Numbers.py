from typing import Optional

class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode])-> Optional[ListNode]:
        # Create the output list
        l3 = ListNode(val=0)  # dummy head

        # Current will traverse the lists l1 and l2
        current = l3

        carry_over = 0
        while l1 or l2 or carry_over:  # Check if there is anything to sum

            # Get the current values
            val1 = l1.val if l1 else 0  # if there is no value use 0
            val2 = l2.val if l2 else 0  # same thing here

            # Calculate the current digit sum
            sum_ = val1 + val2 + carry_over
            carry_over = sum_ // 10
            sum_ = sum_ % 10  


            # Update the current value; move to the next
            current.next = ListNode(sum_)
            current = current.next

            # Move to the next iteration
            l1 = l1.next if l1 else None
            l2 = l2.next if l2 else None
        
        return l3.next