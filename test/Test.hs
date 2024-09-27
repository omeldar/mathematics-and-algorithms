module Main (main) where

import Test.HUnit
import SquareAndMultiplyTest
import ExtendedEuclideanTest
import ModularInverseTest
import ChineseRemainderTest
import NewtonRaphsonTest

allTests :: Test
allTests = TestList [
  TestLabel "Square and Multiply tests" SquareAndMultiplyTest.tests,
  TestLabel "Extended Euclidean tests" ExtendedEuclideanTest.tests,
  TestLabel "Modular Inverse tests" ModularInverseTest.tests,
  TestLabel "Chinese Remainder tests" ChineseRemainderTest.tests,
  TestLabel "Newton Raphson Method tests" NewtonRaphsonTest.tests
  ]

main :: IO ()
main = do
  counts <- runTestTT allTests
  print counts
