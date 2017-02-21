module GameOfLife.Core.Game
( Game
, create
) where

import Numeric.Natural
import qualified System.Random as Rnd
import qualified GameOfLife.Core.Options as Opt;
import qualified GameOfLife.Util.List as List
import GameOfLife.Core.Cell (Cell(..))

type Game = [[Cell]]

create :: Opt.Options -> Game
create Opt.Options {Opt.height=h, Opt.width=w, Opt.gen=g} = grid
  where
    grid = take (fromIntegral h) . List.splitEvery w $ cells
    cells = Rnd.randoms g
