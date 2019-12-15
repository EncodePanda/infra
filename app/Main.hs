module Main where

import InfraUI
import Brick.Main


main :: IO ()
main = defaultMain ourApp 10 >>= putStrLn . show
