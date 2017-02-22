module GameOfLife.Cli.Client
( main
) where

import Control.Concurrent
import Control.Monad
import qualified System.Console.ANSI as Console
import qualified GameOfLife.Cli.Drawing as Drawing
import qualified GameOfLife.Core.Game as Game

main :: IO ()
main = refresh . Game.next $ blinker
  where
    refresh previousGame = do
        Console.clearScreen
        Drawing.draw (10,10) game
        threadDelay 500000
        refresh game
      where
        game = Game.next previousGame

blinker = [(1,0), (1,1), (1,2)]
toad = [(3,0), (1,0), (0,1), (3,1), (0,2), (3,2), (1,3)]
