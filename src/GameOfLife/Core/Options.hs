module GameOfLife.Core.Options
( Options(..)
) where

import Numeric.Natural
import qualified System.Random as Rnd

data Options = Options {
  height :: Natural
, width :: Natural
, gen :: Rnd.StdGen
} deriving (Show)
