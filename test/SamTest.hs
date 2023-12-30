{-# LANGUAGE ScopedTypeVariables #-}

module SamTest where

import Control.Exception
import Test.HUnit
import qualified Sam (squareandmultiply)

tests :: Test
tests = TestList [
    TestLabel "testSAM" testCalculate,
    TestLabel "testSAMwithZeros" testWithZeros,
    TestLabel "testSAMwithBigNumbers" testWithBigNumbers
    ]

testCalculate :: Test
testCalculate = TestCase $ do
    assertEqual "Default Square and Multiply 1" 5 (Sam.squareandmultiply 5 21 11)
    assertEqual "Default Square and Multiply 2" 3 (Sam.squareandmultiply 3 13 13)

testWithZeros :: Test
testWithZeros = TestCase $ do
    assertError "Test Square and Multiply with modulus 0" (evaluate $ Sam.squareandmultiply 15 3 0)
    assertError "Test Square and Multiply with modulus 0" (evaluate $ Sam.squareandmultiply 0 0 0)

testWithBigNumbers :: Test
testWithBigNumbers = TestCase $ do
    assertEqual "Test Square and Multiply with big numbers" 29597504 (Sam.squareandmultiply 252533 18168396 33554393)

-- assert error - consider: https://hackage.haskell.org/package/HUnit-Plus-2.0.0/docs/Test-HUnitPlus-Base.html#v:assertThrows
assertError :: String -> IO a -> Assertion
assertError msg action = do
    result <- try action
    case result of
        Left (_ :: SomeException) -> assertBool msg True
        Right _ -> assertFailure $ "Expected an error but no error was raised: " ++ msg