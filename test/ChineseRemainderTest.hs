{-# LANGUAGE ScopedTypeVariables #-}

module ChineseRemainderTest where

import Control.Exception
import Test.HUnit
import AssertHelpers
import qualified ModularArithmetic (chineseremainder)

tests :: Test
tests = TestList [
    TestLabel "testChineseRemainder" testCalculate,
    TestLabel "testChineseRemainderWithEmpty" testWithEmpty,
    TestLabel "testChineseRemainderWithNegative" testWithNegative
    ]

testCalculate :: Test
testCalculate = TestCase $ do
    assertEqual "Standard chinese remainder 3 congruences" 41 (ModularArithmetic.chineseremainder [(1, 10), (2, 3), (6, 7)])
    -- modular inverse always should return the positive value,
    -- even if negative value is calculated, corresponding positive should be returned
    assertEqual "Standard chinese remainder 4 congruences" 323 (ModularArithmetic.chineseremainder [(1, 2), (2, 3), (3, 5), (4, 11)])

testWithEmpty :: Test
testWithEmpty = TestCase $ do
    AssertHelpers.assertError "Test with empty list for congruences" (evaluate $ ModularArithmetic.chineseremainder [])

testWithNegative :: Test
testWithNegative = TestCase $ do
    AssertHelpers.assertError "Test ChineseRemainder with negative numbers" (evaluate $ ModularArithmetic.chineseremainder [((-5), (-3)), ((-35),(-8))]) 
    AssertHelpers.assertError "Test ChineseRemainder with negative numbers" (evaluate $ ModularArithmetic.chineseremainder [((5), (3)), ((35),(-8))]) 
    assertEqual "Test ChineseRemainder with negative numbers" 5 (ModularArithmetic.chineseremainder [((5), (3)), ((-35),(8))]) 