module GameOfLife.Cli.Client
( main
) where

import qualified System.Random as Random
import qualified GameOfLife.Core.Game as Game
import qualified GameOfLife.Core.Options as Opt

main :: IO ()
main = do
    stdGen <- Random.getStdGen
    let game = Game.create Opt.Options {Opt.height = 10, Opt.width = 5, Opt.gen = stdGen}
    mapM_ print game
    return ()
