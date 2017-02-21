module GameOfLife.Core.Game
( Cell
, next
) where

import Data.List

type Cell = (Int, Int)

next :: [Cell] -> [Cell]
next cells = map head . filter viable . grouped $ cells
  where
    viable [_,_,_] = True
    viable [c,_] = c `elem` cells
    viable _ = False
    grouped = group . sort . concatMap neighboars
    neighboars (x,y) = [ (x+x', y+y') | x' <- [-1..1], y' <- [-1..1], (x',y') /= (0,0) ]
