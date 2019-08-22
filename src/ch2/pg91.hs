{- Equivalent expressions -}
module EquivalentExpressions where

q1 = 1 + 1 == 2
a1 = q1 == True 

q2 = 10 ^ 2 == 10 + 9 * 10
a2 = q2 == True 
-- 10^2 = 10*10 = (1+9)*10 = 1*10 + 9*10 = 10 + 9 * 10

q3 = 400 - 37 == (-) 37 400
a3 = q3 == False 
-- (-) 37 400 = subtract 37 400 = 37 `subtract` 400

-- q4 = (100 `div` 3) == (100 / 3)
-- a4 = q4 == False 
-- div does integral division while (/) does fractional, and rem 100 3 != 0
-- I realized (!=) isn't right ((/=) is what I'm looking for) but I can simply define it:
-- (!=) a b = not (a == b)
-- or:
(!=) = (/=)
test = True != False

q5 = 2 * 5 + 18 == 2 * (5 + 18)
a5 = q5 != True