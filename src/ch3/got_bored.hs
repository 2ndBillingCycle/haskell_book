{- a simple version of reduce -}
module SimpleReduce where

reduce :: (a -> a -> a) -> [a] -> Maybe a
reduce f (a:(b:xs)) = reduce f $ f a b : xs
reduce f [a] = Just a
reduce f [] = Nothing