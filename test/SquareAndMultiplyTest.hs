{-# LANGUAGE ScopedTypeVariables #-}

module SquareAndMultiplyTest where

import Control.Exception
import Test.HUnit
import AssertHelpers
import qualified ModularArithmetic (squareandmultiply)

tests :: Test
tests = TestList [
    TestLabel "testSAM" testCalculate,
    TestLabel "testSAMwithZeros" testWithZeros,
    TestLabel "testSAMwithBigNumbers" testWithBigNumbers
    ]

testCalculate :: Test
testCalculate = TestCase $ do
    assertEqual "Default Square and Multiply 1" 5 (ModularArithmetic.squareandmultiply 5 21 11)
    assertEqual "Default Square and Multiply 2" 3 (ModularArithmetic.squareandmultiply 3 13 13)

testWithZeros :: Test
testWithZeros = TestCase $ do
    AssertHelpers.assertError "Test Square and Multiply with modulus 0" (evaluate $ ModularArithmetic.squareandmultiply 15 3 0)
    AssertHelpers.assertError "Test Square and Multiply with modulus 0" (evaluate $ ModularArithmetic.squareandmultiply 0 0 0)

testWithBigNumbers :: Test
testWithBigNumbers = TestCase $ do
    assertEqual "Test Square and Multiply with big numbers" 29597504 (ModularArithmetic.squareandmultiply 252533 18168396 33554393)