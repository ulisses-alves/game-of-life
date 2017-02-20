module GameOfLife.Cli.Client
( main
) where

import GameOfLife.Core.Game (Game(..), Options(..), create)

main :: IO ()
main = do
    print c
    mapM_ print g
    return ()
  where
    Game {grid=g, cycles=c} = create Options {height=10, width=5}
