module GameOfLife.Cli.Client
( main
) where

import qualified System.Random as Random
import GameOfLife.Core.Game (Game(..), Options(..), create)

main :: IO ()
main = do
    stdGen <- Random.getStdGen
    let Game {grid = g, cycles = c} = create Options {height = 10, width = 5, gen = stdGen}
    print c
    mapM_ print g
    return ()
