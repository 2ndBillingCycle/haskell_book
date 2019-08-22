{- Parenthesisation -}
module Parenthesisation where

q1 = 2 + 2 * 3 - 1
a1 = (2 + (2 * 3)) - 1

q2 = (^) 10 $ 1 + 1
a2 = ((^) 10) $ (1 + 1)

q3 = 2 ^ 2 * 4 ^ 5 + 1
a3 = ((2 ^ 2) * (4 ^ 5)) + 1