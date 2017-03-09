module GameOfLife.Cli.Drawing
( CanvasSize
, draw
) where

import qualified GameOfLife.Core.Game as Game

type CanvasSize = (Int, Int)

draw :: CanvasSize -> [Game.Cell] -> IO ()
draw (height, width) cells = mapM_ putStrLn rows
  where
    rows = map cols [0..height]
    cols y = map (\x -> drawCell (x,y)) [0..width]
    drawCell cell = if cell `elem` cells then 'O' else ' '
