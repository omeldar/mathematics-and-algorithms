{-# LANGUAGE ScopedTypeVariables #-}

module ChineseRemainderTest where

import Control.Exception
import Test.HUnit
import AssertHelpers
import qualified ChineseRemainder (chineseremainder)

tests :: Test
tests = TestList [
    TestLabel "testChineseRemainder" testCalculate,
    TestLabel "testChineseRemainderWithEmpty" testWithEmpty,
    TestLabel "testChineseRemainderWithNegative" testWithNegative
    ]

testCalculate :: Test
testCalculate = TestCase $ do
    assertEqual "Standard chinese remainder 3 congruences" 41 (ChineseRemainder.chineseremainder [(1, 10), (2, 3), (6, 7)])
    -- modular inverse always should return the positive value,
    -- even if negative value is calculated, corresponding positive should be returned
    assertEqual "Standard chinese remainder 4 congruences" 323 (ChineseRemainder.chineseremainder [(1, 2), (2, 3), (3, 5), (4, 11)])

testWithEmpty :: Test
testWithEmpty = TestCase $ do
    AssertHelpers.assertError "Test with empty list for congruences" (evaluate $ ChineseRemainder.chineseremainder [])

testWithNegative :: Test
testWithNegative = TestCase $ do
    AssertHelpers.assertError "Test ChineseRemainder with negative numbers" (evaluate $ ChineseRemainder.chineseremainder [((-5), (-3)), ((-35),(-8))]) 
    AssertHelpers.assertError "Test ChineseRemainder with negative numbers" (evaluate $ ChineseRemainder.chineseremainder [((5), (3)), ((35),(-8))]) 
    assertEqual "Test ChineseRemainder with negative numbers" 5 (ChineseRemainder.chineseremainder [((5), (3)), ((-35),(8))]) 