{-# LANGUAGE ScopedTypeVariables #-}

module NewtonRaphsonTest where

import Control.Exception
import Test.HUnit
import AssertHelpers
import qualified NumericalOptimization (newtonRaphson)

tests :: Test
tests = TestList [
    TestLabel "testSimpleRoot" testSimpleRoot,
    TestLabel "testMultipleRoots" testMultipleRoots,
    TestLabel "testNoConvergence" testNoConvergence,
    TestLabel "testDerivativeZero" testDerivativeZero,
    TestLabel "testDerivativeZeroNoZeroFunction" testDerivativeZeroButNonZeroFunction,
    TestLabel "testNearRoot" testNearRoot
    ]

-- Test for single root
testSimpleRoot :: Test
testSimpleRoot = TestCase $ do
    let f = \x -> x^2 - 4     -- f(x) = x^2 - 4 has roots at x = -2 and x = 2
    let f' = \x -> 2 * x      -- Derivative f'(x) = 2x
    let tolerance = 1e-6
    let result = NumericalOptimization.newtonRaphson f f' 1.0 tolerance 100
    let expected = Just 2.0
    AssertHelpers.assertApproxEqual "Root approx 2" expected result tolerance

-- Test for multiple roots
testMultipleRoots :: Test
testMultipleRoots = TestCase $ do
    let f = \x -> (x - 1) * (x - 2) * (x - 3)  -- f(x) = (x - 1)(x - 2)(x - 3)
    let f' = \x -> 3 * x^2 - 12 * x + 11       -- Derivative f'(x) = 3x^2 - 12x + 11
    let tolerance = 1e-6

    let result = NumericalOptimization.newtonRaphson f f' 1.3 tolerance 100
    let exp1 = Just 1
    AssertHelpers.assertApproxEqual "Root near 1" exp1 result tolerance

    let result2 = NumericalOptimization.newtonRaphson f f' 2.3 tolerance 100
    let exp2 = Just 2
    AssertHelpers.assertApproxEqual "Root near 2" exp2 result2 tolerance

-- Test for the case where no convergence occurs
testNoConvergence :: Test
testNoConvergence = TestCase $ do
    let f = \x -> x^3 - 2*x + 2  -- f(x) = x^3 - 2x + 2 has no real roots
    let f' = \x -> 3*x^2 - 2     -- Derivative f'(x) = 3x^2 - 2
    let result = NumericalOptimization.newtonRaphson f f' 0.0 0.00001 10
    assertEqual "No real root found" Nothing result

-- Test for the case where the derivative becomes 0 (division by zero)
testDerivativeZero :: Test
testDerivativeZero = TestCase $ do
    let f = \x -> x^3        -- f(x) = x^3 has derivative f'(x) = 3x^2
    let f' = \x -> 3 * x^2   -- Derivative becomes zero at x = 0
    let result = NumericalOptimization.newtonRaphson f f' 0.0 0.00001 100
    assertEqual "Root at 0.0 with zero derivative" (Just 0.0) result

-- Test for the case where the function value is non-zero and the derivative is zero (method should return Nothing)
testDerivativeZeroButNonZeroFunction :: Test
testDerivativeZeroButNonZeroFunction = TestCase $ do
    let f = \x -> x^3 + 1    -- f(x) = x^3 + 1, no root at x = 0
    let f' = \x -> 3 * x^2   -- Derivative becomes zero at x = 0
    let result = NumericalOptimization.newtonRaphson f f' 0.0 0.00001 100
    assertEqual "Derivative zero but no root at x = 0" Nothing result

-- Test for the case where the initial guess is close to the root
testNearRoot :: Test
testNearRoot = TestCase $ do
    let f = \x -> x^2 - 9  -- f(x) = x^2 - 9 has roots at x = 3 and x = -3
    let f' = \x -> 2 * x   -- Derivative f'(x) = 2x
    let tolerance = 1e-6

    let result = NumericalOptimization.newtonRaphson f f' 3.1 tolerance 100
    AssertHelpers.assertApproxEqual "Root near 3.0" (Just 3) result tolerance