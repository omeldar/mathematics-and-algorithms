module Main where

import qualified SquareAndMultiply (squareandmultiply)
import qualified ExtendedEuclidean (extendedeuclidean)
import qualified ModularInverse (modInverse)
import qualified ChineseRemainder (chineseremainder)

main :: IO ()
main = do
  -- Square and Multiply
  print "Square and Multiply:"
  print $ SquareAndMultiply.squareandmultiply 252533 18168396 33554393

  -- Extended Euclidean Algorithm
  print "Extended Euclidean Algorithm:"
  print $ ExtendedEuclidean.extendedeuclidean 2 19
  print $ ExtendedEuclidean.extendedeuclidean 2 0
  print $ ExtendedEuclidean.extendedeuclidean 0 2
  print $ ExtendedEuclidean.extendedeuclidean 76945 578

  -- Modular Inverse
  print "Modular Inverse:"
  print $ ModularInverse.modInverse 2 19
  print $ ModularInverse.modInverse (-3) 11
  print $ ModularInverse.modInverse 8 11
  
  -- Chinese Remainder Theorem
  print "Chinese Remainder Theorem:"
  print $ ChineseRemainder.chineseremainder [(1, 10), (2, 3), (6, 7)]
  print $ ChineseRemainder.chineseremainder [(1, 2), (2, 3), (3, 5), (4, 11)]
