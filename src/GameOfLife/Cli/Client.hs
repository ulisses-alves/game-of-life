module GameOfLife.Cli.Client
( main
) where

import Control.Concurrent
import Control.Monad
import System.Environment
import qualified System.Console.ANSI as Console
import qualified System.Console.Terminal.Size as TS
import qualified GameOfLife.Cli.Drawing as Drawing
import qualified GameOfLife.Core.Game as Game
import qualified GameOfLife.Core.Patterns as Patterns

main :: IO ()
main = do
    args <- getArgs
    termSize <- TS.size
    let Just TS.Window {TS.height=h, TS.width=w} = termSize in begin h w . head $ args
  where
    begin height width pattern = render height width . Patterns.get $ pattern
    render height width previousGame = do
        Console.clearScreen
        Drawing.draw (height-2,width-2) game
        threadDelay 500000
        render height width game
      where
        game = Game.next previousGame
