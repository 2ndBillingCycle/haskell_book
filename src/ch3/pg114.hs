module SyntaxErrors where

-- 1) ++ [1, 2, 3] [4, 5, 6]
-- (++) is an infix function, and needs to be wrapped in parentheses to be used
-- in prefix position
a1 = (++) [1, 2, 3] [4, 5, 6]

-- 2) '<3' ++ ' Haskell'
-- ' denotes character literals, which can only contain a single character.
-- String literals use "
a2 = "<3" ++ " Haskell"

-- 3) concat ["<3" , " Haskell"]
-- Nothing wrong
a3 = concat ["<3", " Haskell"]