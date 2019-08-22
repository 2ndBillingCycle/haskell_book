{- More fun with functions -}
module MoreFunWithFunctions where

z = 7
y = z + 8
x = y ^ 2
-- 225
waxOn = x * 5
-- 1125

-- 1)
q1a = 10 + waxOn
a1a = q1a == 1135

q1b = (+10) waxOn
a1b = q1b == 1135

q1c = (-) 15 waxOn
a1c = q1c == (-1110)

q1d = (-) waxOn 15
a1d = q1d == 1110

-- 2)
triple x = x * 3

-- 3)
q3 = triple waxOn
a3 = q3 == waxOn * 3

-- 4)
waxOnWhere = x * 5
    where z = 7
          y = z + 8
          x = y ^ 2
a4 = waxOnWhere == waxOn

-- 5)
a5 = triple waxOnWhere == triple waxOn

-- 6)
waxOff x = triple x
-- Could just be waxOff = triple

-- 7)
waxOffNew x = (x * 3) ^ 2