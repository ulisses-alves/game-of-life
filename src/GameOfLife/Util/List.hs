module GameOfLife.Util.List
( splitEvery
) where

splitEvery :: (Integral b) => b -> [a] -> [[a]]
splitEvery _ [] = []
splitEvery count xs = first : splitEvery count second
  where
    (first, second) = splitAt (fromIntegral count) xs
