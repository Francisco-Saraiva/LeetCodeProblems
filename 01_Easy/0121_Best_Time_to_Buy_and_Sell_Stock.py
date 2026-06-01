class Solution:
        # buy_day = 0
        # total_max = 0
        # day_max = 0

        # while buy_day < len(prices) - 1:  # TOO SLOW, O(n^2)
        #     for sell_day in range(buy_day+1, len(prices)):
        #         delta = prices[sell_day] - prices[buy_day]
        #         if delta > day_max:
        #             day_max = delta

            
        #     if day_max > total_max:
        #         total_max = day_max
        #     buy_day += 1
        
        # return total_max
    def maxProfit(self, prices: list[int]) -> int:
        min_seen_price = 10_000 # due to problem statement
        max_profit = 0

        for price in prices:
            if price < min_seen_price:
                min_seen_price = price
            else:
                profit = price - min_seen_price
                if profit > max_profit:
                    max_profit = profit

        return max_profit 