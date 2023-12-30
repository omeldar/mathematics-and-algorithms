module Main where

import qualified Sam (squareandmultiply)

main :: IO ()
main = do
  print $ Sam.squareandmultiply 5 21 11
