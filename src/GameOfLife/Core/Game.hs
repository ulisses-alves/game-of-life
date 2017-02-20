module GameOfLife.Core.Game
( Options(..)
, Game(..)
, create
) where

import Numeric.Natural
import qualified System.Random as Random
import GameOfLife.Util.List (splitEvery)
import GameOfLife.Core.Cell (Cell(..))

data Options = Options {
  height :: Natural
, width :: Natural
, gen :: Random.StdGen
} deriving (Show)

data Game = Game {
  grid :: [[Cell]]
, cycles :: Natural
} deriving (Show)

create :: Options -> Game
create Options {height=h, width=w, gen=g} = Game {grid=grid, cycles=0}
  where
    grid = take (fromIntegral h) . splitEvery w $ cells
    cells = Random.randoms g
