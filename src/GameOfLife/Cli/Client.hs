module GameOfLife.Cli.Client
( main
) where

import System.Console.ANSI
import qualified GameOfLife.Core.Game as Game

type Canvas = (Int, Int)

main :: IO ()
main = draw (10,10) . Game.next . Game.next $ blinker

draw :: Canvas -> [Game.Cell] -> IO ()
draw (height, width) cells = mapM_ putStrLn rows
  where
    rows = map cols [0..height]
    cols row = map (\x -> drawCell (x,row)) [0..width]
    drawCell cell = if cell `elem` cells then 'O' else '-'

blinker = [(1,0), (1,1), (1,2)]
