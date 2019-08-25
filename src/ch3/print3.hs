module Print3 where

greeting :: String
greeting = "hello" ++ " world!"

hello :: String
hello = "hello"

world :: String
world = "world!"

main :: IO ()
main = do
    putStrLn greeting
    putStrLn second_greeting
    where second_greeting = concat [hello, " ", world]