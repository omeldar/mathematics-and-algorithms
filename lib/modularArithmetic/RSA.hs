module RSA where

import SquareAndMultiply (squareandmultiply)

generateKeys :: Integer -> Integer -> (Integer, Integer, Integer)
generateKeys p q = (e, d, n)
where n = p * q
    phi = (p-1) * (q-1)
    e = 65537
    d = inverse e phi

encrypt :: Integer -> (Integer, Integer) -> Integer
encrypt c (d, n) = squareandmultiply m e n

decrypt :: Integer -> (Integer, Integer) -> Integer
decrypt c (d, n) = squareandmultiply c d n