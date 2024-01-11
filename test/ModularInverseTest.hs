{-# LANGUAGE ScopedTypeVariables #-}

module ModularInverseTest where

import Control.Exception
import Test.HUnit
import AssertHelpers
import qualified ModularInverse (modInverse)

tests :: Test
tests = TestList [
    TestLabel "testModInverse" testCalculate,
    TestLabel "testModInverseWithZeros" testWithZeros,
    TestLabel "testModInverseWithNegative" testWithNegative
    ]

testCalculate :: Test
testCalculate = TestCase $ do
    assertEqual "Standard modular inverse" (Just 4) (ModularInverse.modInverse 3 11)
    -- modular inverse always should return the positive value,
    -- even if negative value is calculated, corresponding positive should be returned
    assertEqual "Standard modular inverse for negative modular inverse" (Just 10) (ModularInverse.modInverse 2 19)

testWithZeros :: Test
testWithZeros = TestCase $ do
    AssertHelpers.assertError "Test modular inverse with modulus 0" (evaluate $ ModularInverse.modInverse 5 0)
    AssertHelpers.assertError "Test modular inverse with a = 0" (evaluate $ ModularInverse.modInverse 0 0)
    assertEqual "Test modular inverse with a = 0" Nothing (ModularInverse.modInverse 0 5)

testWithNegative :: Test
testWithNegative = TestCase $ do
    --negative inputs for a should be converted to its modular positive equivalent
    assertEqual "Test modular inverse with a = -3" (Just 7) (ModularInverse.modInverse (-3) 11) 