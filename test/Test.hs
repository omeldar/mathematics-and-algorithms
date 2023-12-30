module Main (main) where

import Test.HUnit
import SamTest

allTests :: Test
allTests = TestList [
  TestLabel "Square and Multiply tests" SamTest.tests
  ]

main :: IO ()
main = do
  counts <- runTestTT allTests
  print counts
