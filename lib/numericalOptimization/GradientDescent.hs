module GradientDescent (gradientDescent) where

type Function = Double -> Double

gradientDescent :: Function -> Function -> Double -> Double -> Double -> Int -> Maybe Double
gradientDescent f f' x0 lr tolerance maxIter = go x0 0
    where
        go x i
            | abs (f' x) <= tolerance = Just x
            | i >= maxIter = Nothing
            | otherwise = go nextx (i + 1)
            where
                nextx = x - lr * f' x