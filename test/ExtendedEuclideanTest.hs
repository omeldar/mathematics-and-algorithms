{-# LANGUAGE ScopedTypeVariables #-}

module ExtendedEuclideanTest where

import Control.Exception
import Test.HUnit
import AssertHelpers
import qualified ModularArithmetic (extendedeuclidean)

tests :: Test
tests = TestList [
    TestLabel "testExtEuclid" testCalculate,
    TestLabel "testExtEuclidWithZeros" testWithZeros,
    TestLabel "testExtEuclidWithBothZeros" testWithBothZeros,
    TestLabel "testExtEuclidWithBigNumbers" testWithBigNumbers
    ]

testCalculate :: Test
testCalculate = TestCase $ do
    assertEqual "Standard Euclidean" (1,(-9),1) (ModularArithmetic.extendedeuclidean 2 19)
    assertEqual "Standard Euclidean a and b Exchanged" (1,1,(-9)) (ModularArithmetic.extendedeuclidean 19 2)

testWithZeros :: Test
testWithZeros = TestCase $ do
    assertEqual "Extended Euclidean with a = 0, b = 10" (10,0,1) (ModularArithmetic.extendedeuclidean 0 10)
    assertEqual "Extended Euclidean with a = 10, b = 0" (10,1,0) (ModularArithmetic.extendedeuclidean 10 0)

testWithBothZeros :: Test
testWithBothZeros = TestCase $ do
    AssertHelpers.assertError "Test Extended Euclidean with a, b = 0" (evaluate $ ModularArithmetic.extendedeuclidean 0 0)

testWithBigNumbers :: Test
testWithBigNumbers = TestCase $ do
    assertEqual "Test Extended Euclidean with big numbers" (1,57,(-7588)) (ModularArithmetic.extendedeuclidean 76945 578)