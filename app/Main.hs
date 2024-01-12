module Main where

import ModularArithmetic
import Data.Maybe (fromJust)

main :: IO ()
main = do
  -- Square and Multiply
  print "Square and Multiply:"
  print $ ModularArithmetic.squareandmultiply 252533 18168396 33554393
  print $ ModularArithmetic.squareandmultiply 855 2753 61
  print $ ModularArithmetic.squareandmultiply 855 2753 53

  -- Extended Euclidean Algorithm
  print "Extended Euclidean Algorithm:"
  print $ ModularArithmetic.extendedeuclidean 2 19
  print $ ModularArithmetic.extendedeuclidean 2 0
  print $ ModularArithmetic.extendedeuclidean 0 2
  print $ ModularArithmetic.extendedeuclidean 42 93
  print $ ModularArithmetic.extendedeuclidean 76945 578

  -- Modular Inverse
  print "Modular Inverse:"
  print $ fromJust $ ModularArithmetic.modInverse 2 19
  print $ fromJust $ ModularArithmetic.modInverse (-3) 8
  print $ fromJust $ ModularArithmetic.modInverse 17 3120
  print $ fromJust $ ModularArithmetic.modInverse 1721 262548
  
  -- Chinese Remainder Theorem
  print "Chinese Remainder Theorem:"
  print $ ModularArithmetic.chineseremainder [(1, 10), (2, 3), (6, 7)]
  print $ ModularArithmetic.chineseremainder [(1, 2), (2, 3), (3, 5), (4, 11)]
  print $ ModularArithmetic.chineseremainder [(1, 61), (17, 53)]
