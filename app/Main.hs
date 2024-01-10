module Main where

import qualified SquareAndMultiply (squareandmultiply)
import qualified ExtendedEuclidean (extendedeuclidean)

main :: IO ()
main = do
  -- Square and Multiply
  print $ SquareAndMultiply.squareandmultiply 252533 18168396 33554393

  -- Extended Euclidean Algorithm
  print $ ExtendedEuclidean.extendedeuclidean 2 19
  print $ ExtendedEuclidean.extendedeuclidean 2 0
  print $ ExtendedEuclidean.extendedeuclidean 0 2
  print $ ExtendedEuclidean.extendedeuclidean 76945 578
  -- Chinese Remainder Theorem
