{-# LANGUAGE ScopedTypeVariables #-}

module AssertHelpers where

import Control.Exception
import Test.HUnit

-- assert error - consider: https://hackage.haskell.org/package/HUnit-Plus-2.0.0/docs/Test-HUnitPlus-Base.html#v:assertThrows
assertError :: String -> IO a -> Assertion
assertError msg action = do
    result <- try action
    case result of
        Left (_ :: SomeException) -> assertBool msg True
        Right _ -> assertFailure $ "Expected an error but no error was raised: " ++ msg