module Ch3Exercises where

-- 1) Reading syntax
-- a) concat [[1, 2, 3], [4, 5, 6]]
-- Correct
a1a = concat [[1, 2, 3], [4, 5, 6]]

-- b) ++ [1, 2, 3] [4, 5, 6]
-- (++)
a1b = (++) [1, 2, 3] [4, 5, 6]

-- c) (++) "hello" " world!"
-- Correct
a1c = (++) "hello" " world!"

-- d) ["hello" ++ " world!"]
-- Surprisingly correct: [a] creates a list of a, and in this case, a is a
-- string
a1d = ["hello" ++ " world!"]

-- e) 4 !! "hello"
-- Correct, though uses unsafe (!!)
-- Correction: wrong, as (!!) :: [a] -> Int -> a, so list is first argument
-- a1e = 4 !! "hello"
a1e = "hello" !! 4

-- f) (!!) "hello" 4
-- (!!) :: [a] -> Int -> a
-- Arguments need to be swapped
-- Wrong: type signature shows all arguments are in order
-- a1f = (!!) 4 "hello"
a1f = (!!) "hello" 4

-- g) take "4 lovely"
-- take :: Int -> [a] -> [a]
-- First argument needs to be an Int
-- True fix: take 4 "lovely"
a1g = (`take` "4 lovely")

-- h) take 3 "awesome"
-- Correct
a1h = take 3 "awesome"

-- 2) Mix and match
q2a = concat [[1 * 6], [2 * 6], [3 * 6]]
q2b = "rain" ++ drop 2 "elbow"
q2c = 10 * head [1, 2, 3]
q2d = (take 3 "Julie") ++ (tail "yes")
q2e = concat [tail [1, 2, 3],
              tail [4, 5, 6],
              tail [7, 8, 9]]

a2a = "Jules"
a2b = [2,3,5,6,8,9]
a2c = "rainbow"
a2d = [6,12,18]
a2e = 10

m1 = q2a == a2d
m2 = q2b == a2c
m3 = q2c == a2e
m4 = q2d == a2a
m5 = q2e == a2b

-- 3) Building functions
given3a = "Curry is awesome"
return3a = "Curry is awesome!"
function3a = (++ "!")
a3a = function3a given3a == return3a

given3b = "Curry is awesome!"
return3b = "y"
-- function3b = (!! 4)
-- Doesn't work, because (!!) returns an element of the input list,
-- and since the input list here is :: String, a return element :: Char,
-- while the answer wants "y" :: [Char]
function3b str = [str !! 4]
a3b = function3b given3b == return3b

given3c = "Curry is awesome!"
return3c = "awesome!"
-- function3c = drop 8
-- Miscounted
function3c = drop 9
a3c = function3c given3c == return3c

-- 4) Rewrite into source file
-- Mostly done. One rquirement is that the functions use variables

function4a str = str ++ "!"
function4b = function3b
function4c str = drop 9 str

-- 5) Write a function of type String -> Char which returns the third character
-- in a String
thirdLetter :: String -> Char 
thirdLetter str = str !! 2
a5a = thirdLetter "Curry is awesome" == 'r'

-- 6) Now change that function so the string operated on is always the same and
-- the variable represents the number of the letter you want to return
letterIndex :: Int -> Char
letterIndex int = "Curry is awesome!" !! int

-- 7) Create a function to turn "Curry is awesome" into "awesome is Curry" using
-- only drop and take.
-- This only needs to work for this input
-- reverseWords :: no idea
-- reverseWords str = do

reverseWords str = trimTrailingSpace $ concat $ insertSpaces $ rvrs $ splitSentenceOnSpace $ trimLeadingSpace str
    where trimLeadingSpace :: String -> String
          trimLeadingSpace (c:cs)
              | c == ' ' = trimLeadingSpace cs
              | otherwise = c:cs
          splitSentenceOnSpace (c:cs) = splitOnSpace [c] cs
              where splitOnSpace :: String -> String -> [String]
                    splitOnSpace w (c:cs)
                        | w == " " = splitOnSpace [c] cs
                        | c == ' ' = ([w] ++) $ splitOnSpace (take 1 cs) (drop 1 cs)
                        | otherwise = splitOnSpace (w ++ [c]) cs
                    splitOnSpace " " _  = []
                    splitOnSpace ""  _  = []
                    splitOnSpace w   "" = [w]
          splitSentenceOnSpace [] = []
          rvrs :: [a] -> [a]
          rvrs (x:xs) = rvrs xs ++ [x]
          rvrs [] = []
          insertSpaces :: [String] -> [String]
          insertSpaces (x:xs) = x : " " : insertSpaces xs
          insertSpaces _ = [""]
          trimTrailingSpace :: String -> String
          trimTrailingSpace str = rvrs $ trimLeadingSpace $ rvrs str

theTruth = reverseWords "written ever I've code Haskell ugliest the of some be to going probably is This"

rvrs :: String -> String
rvrs str = (drop 9 str) ++ " " ++ (take 2 $ drop 6 str) ++ " " ++ (take 5 str)

main :: IO ()
main = print $ rvrs "Curry is awesome"