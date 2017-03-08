module GameOfLife.Core.Patterns
( blinker
, toad
, get
) where

import GameOfLife.Core.Game (Cell)

blinker :: [Cell]
blinker = [(1,0), (1,1), (1,2)]

glider :: [Cell]
glider = [(0,1),(1,2),(2,0),(2,1),(2,2)]

toad :: [Cell]
toad = [(3,0), (1,0), (0,1), (3,1), (0,2), (3,2), (1,3)]

get :: String -> [Cell]
get name = case name of
    "blinker" -> blinker
    "glider"  -> glider
    "toad"    -> toad
