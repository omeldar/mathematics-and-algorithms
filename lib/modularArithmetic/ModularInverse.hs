module ModularInverse (modInverse) where

import ExtendedEuclidean (extendedeuclidean)

-- returns: positive modular inverse such that (a * b) mod m = 1
modInverse :: Integral a => a -> a -> Maybe a
modInverse a m
    | m <= 0 = error "undefined"    -- modular inverse does not exist
    | a == 0 = Nothing
    | otherwise =
    let a' = mod a m    -- convert a to its positive equivalent in the modular system
        (g, x, _) = extendedeuclidean a' m 
    in if g == 1 then Just (mod x m) else Nothing