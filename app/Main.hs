module Main where

import ModularArithmetic
import NumericalOptimization
import Data.Maybe (fromJust)

main :: IO ()
main = do
  -- Square and Multiply
  print "Square and Multiply:"
  print $ ModularArithmetic.squareandmultiply 252533 18168396 33554393
  print $ ModularArithmetic.squareandmultiply 855 2753 61
  print $ ModularArithmetic.squareandmultiply 855 2753 53
  print $ ModularArithmetic.squareandmultiply 2345 157 47
  print $ ModularArithmetic.squareandmultiply 2345 157 59

  -- Extended Euclidean Algorithm
  print "Extended Euclidean Algorithm:"
  print $ ModularArithmetic.extendedeuclidean 2 19
  print $ ModularArithmetic.extendedeuclidean 2 0
  print $ ModularArithmetic.extendedeuclidean 0 2
  print $ ModularArithmetic.extendedeuclidean 42 93
  print $ ModularArithmetic.extendedeuclidean 76945 578
  print $ ModularArithmetic.extendedeuclidean 59 49
  print $ ModularArithmetic.extendedeuclidean 47 12

  -- Modular Inverse
  print "Modular Inverse:"
  print $ fromJust $ ModularArithmetic.modInverse 2 19
  print $ fromJust $ ModularArithmetic.modInverse (-3) 8
  print $ fromJust $ ModularArithmetic.modInverse 17 3120
  print $ fromJust $ ModularArithmetic.modInverse 1721 262548
  print $ fromJust $ ModularArithmetic.modInverse 17 2668
  print $ fromJust $ ModularArithmetic.modInverse 59 47
  print $ fromJust $ ModularArithmetic.modInverse 47 59

  -- Chinese Remainder Theorem
  print "Chinese Remainder Theorem:"
  print $ ModularArithmetic.chineseremainder [(1, 10), (2, 3), (6, 7)]
  print $ ModularArithmetic.chineseremainder [(1, 2), (2, 3), (3, 5), (4, 11)]
  print $ ModularArithmetic.chineseremainder [(1, 61), (17, 53)]

  -- Newton Raphson Method
  print "Newton Raphson Method:"

  let f x = x^3 - 4 * x^2 + 1
  let f' x = 3 * x^2 - 8 * x

  case NumericalOptimization.newtonRaphson f f' 0.5 0.00000001 10 of
    Just root -> print $ "f(x) = 0 at: x = " ++ show root
    Nothing -> putStrLn "No root found within the given iterations and tolerance."

  let g x = 1 / 12 * x^4 + 1 / 6 * x^3 - x^2
  let g' x = 1 / 3 * x^3 + 1 / 2 * x^2 - 2 * x

  case NumericalOptimization.newtonRaphson g g' (-4) 0.00001 10 of
    Just root -> print $ "g(x) = 0 at: x = " ++ show root
    Nothing -> putStrLn "No root found within the given iterations and tolerance."

-- Gradient descent
  print "Gradient Descent:"
  print NumericalOptimization.calculateMinima