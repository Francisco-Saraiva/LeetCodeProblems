SELECT L1.num AS "ConsecutiveNums" FROM Logs L1, Logs L2, Logs L3
WHERE L1.num = L2.num
AND L2.num = L3.num
AND L1.id + 1 = L2.id
AND L2.id + 1 = L3.id 
GROUP BY L1.num;