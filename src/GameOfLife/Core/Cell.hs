module GameOfLife.Core.Cell
( Cell(..)
) where

import System.Random (Random(..))

data Cell = Dead | Alive deriving (Show, Enum, Bounded)

instance Random Cell where
    random = randomR (minBound :: Cell, maxBound :: Cell)
    randomR (a, b) g = (toEnum r, g')
      where
        (r, g') = randomR (fromEnum a, fromEnum b) g
