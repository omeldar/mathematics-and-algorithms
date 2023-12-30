module Main where

import qualified Sam (squareandmultiply)

main :: IO ()
main = do
  print $ Sam.squareandmultiply 252533 18168396 33554393
