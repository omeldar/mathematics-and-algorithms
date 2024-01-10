module Main (main) where

import Test.HUnit
import SquareAndMultiplyTest
import ExtendedEuclideanTest

allTests :: Test
allTests = TestList [
  TestLabel "Square and Multiply tests" SquareAndMultiplyTest.tests,
  TestLabel "Extended Euclidean tests" ExtendedEuclideanTest.tests
  ]

main :: IO ()
main = do
  counts <- runTestTT allTests
  print counts
