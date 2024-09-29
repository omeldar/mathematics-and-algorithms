module GradientDescent (calculateMinima) where

calculateMinima :: (Double -> Double) 
                -> (Double -> Double)
                -> Double
calculateMinima f f' x
    | 