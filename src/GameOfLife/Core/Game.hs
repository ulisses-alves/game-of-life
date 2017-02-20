module GameOfLife.Core.Game
( Options(..)
, Game(..)
, create
) where

import Numeric.Natural (Natural(..))

data Options = Options {
  height :: Natural
, width :: Natural
} deriving (Show)

data Cell = Dead | Alive deriving (Show)

data Game = Game {
  grid :: [[Cell]]
, cycles :: Natural
} deriving (Show)

create :: Options -> Game
create Options {height=h, width=w} = Game {grid=grid, cycles=0}
  where
    grid = replicate (fromIntegral h) . replicate (fromIntegral w) $ Dead
