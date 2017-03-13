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
    case termSize of
        Nothing -> putStrLn "Failed to get terminal size"
        Just TS.Window {TS.height=h, TS.width=w} -> startGame (h,w) . head $ args

startGame :: (Int, Int) -> String -> IO ()
startGame (height, width) pattern = renderRec . Patterns.get $ pattern
  where
    renderRec cells = do
        Console.clearScreen
        Drawing.draw (height-2, width-2) cells
        threadDelay 300000
        renderRec . Game.next $ cells
