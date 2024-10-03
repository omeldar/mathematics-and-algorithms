module GradientDescent (gradientDescent) where

type Function = Double -> Double

gradientDescent :: Function -> Function -> Double -> Double -> Int -> Double
gradientDescent f f' x0 tolerance maxIter = 0