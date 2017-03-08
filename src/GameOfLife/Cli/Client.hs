module GameOfLife.Cli.Client
( main
) where

import Control.Concurrent
import Control.Monad
import System.Environment
import qualified System.Console.ANSI as Console
import qualified GameOfLife.Cli.Drawing as Drawing
import qualified GameOfLife.Core.Game as Game
import qualified GameOfLife.Core.Patterns as Patterns

main :: IO ()
main = do
    args <- getArgs
    refresh . Game.next . Patterns.get . head $ args
  where
    refresh previousGame = do
        Console.clearScreen
        Drawing.draw (40,40) game
        threadDelay 500000
        refresh game
      where
        game = Game.next previousGame
