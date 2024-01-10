module ExtendedEuclidean (extendedeuclidean) where

extendedeuclidean :: Integral a => a -> a -> (a, a, a)
extendedeuclidean 0 0 = error "undefined"
extendedeuclidean 0 b = (b, 0, 1)
extendedeuclidean a 0 = (a, 1, 0)
extendedeuclidean a b = (gcd, t, s - q * t)
    where 
        (q, r) = a `quotRem` b
        (gcd, s, t) = extendedeuclidean b r
    