module NewtonRaphsonMethod (newtonRaphson) where

-- Newton-Raphson method
newtonRaphson :: (Double -> Double) -- ^ Function f
              -> (Double -> Double) -- ^ Derivative f'
              -> Double             -- ^ Initial guess x0
              -> Double             -- ^ Tolerance
              -> Int                -- ^ Maximum iterationsP
              -> Maybe Double       -- ^ Root if found within tolerance, otherwise Nothing
newtonRaphson f f' x0 tol maxIter = go x0 0
  where
    go x i
      | abs (f x) < tol = Just x   -- Converged to root within tolerance
      | i >= maxIter = Nothing  -- Maximum iterations reached
      | abs (f' x) < tol = Nothing -- Derivative close to zero, can't proceed: div by zero
      | otherwise = go xNext (i + 1)
      where
        xNext = x - f x / f' x     -- Newton-Raphson iteration step
