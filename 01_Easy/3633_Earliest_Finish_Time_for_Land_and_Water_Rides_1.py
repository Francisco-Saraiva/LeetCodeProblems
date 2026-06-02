class Solution:
    def earliestFinishTime(self, landStartTime: list[int], landDuration: list[int], waterStartTime: list[int], waterDuration: list[int]) -> int:
        min_time = 100_000_000

        for i in range(len(landStartTime)):
            for k in range(len(waterStartTime)):
                # Try land --> water first
                ride_time = landStartTime[i] + landDuration[i]

                if ride_time < waterStartTime[k]:
                    ride_time = waterStartTime[k]
                
                ride_time += waterDuration[k]

                if ride_time < min_time:
                    min_time = ride_time
                
                # Now try water --> land
                ride_time = waterStartTime[k] + waterDuration[k]

                if ride_time < landStartTime[i]:
                    ride_time = landStartTime[i]

                ride_time += landDuration[i]

                if ride_time < min_time:
                    min_time = ride_time
        
        return min_time