{-# LANGUAGE ScopedTypeVariables #-}

module AssertHelpers where

import Data.Maybe (fromMaybe)
import Control.Exception
import Test.HUnit

-- assert error - consider: https://hackage.haskell.org/package/HUnit-Plus-2.0.0/docs/Test-HUnitPlus-Base.html#v:assertThrows
assertError :: String -> IO a -> Assertion
assertError msg action = do
    result <- try action
    case result of
        Left (_ :: SomeException) -> assertBool msg True
        Right _ -> assertFailure $ "Expected an error but no error was raised: " ++ msg

-- Custom assertion function for approximate equality
assertApproxEqual :: String -> Maybe Double -> Maybe Double -> Double -> Assertion
assertApproxEqual msg expected actual tolerance =
    let result = approxEqual actual expected tolerance
    in if abs (fromMaybe 0 actual - fromMaybe 0 expected) < tolerance
       then assertBool msg True
       else assertFailure $ msg ++ "\n" ++ result

-- Helper function to check if two Maybe Double values are approximately equal and provide detailed messages
approxEqual :: Maybe Double -> Maybe Double -> Double -> String
approxEqual (Just x) (Just y) tolerance
    | abs (x - y) < tolerance = "Values are approximately equal."
    | otherwise = "Expected: " ++ show y ++ " with tolerance: " ++ show tolerance ++ ", but got: " ++ show x
approxEqual Nothing Nothing _ = "Both values are Nothing, considered equal."
approxEqual Nothing (Just y) _ = "Expected: " ++ show y ++ ", but got: Nothing."
approxEqual (Just x) Nothing _ = "Expected: Nothing, but got: " ++ show x
approxEqual _ _ _ = "Values are not approximately equal."