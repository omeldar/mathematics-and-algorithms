module Sam (squareandmultiply) where

squareandmultiply :: Integer -> Integer -> Integer -> Integer
squareandmultiply base exp modulus = sqramultHelper base exp modulus 1

sqramultHelper :: Integer -> Integer -> Integer -> Integer -> Integer
sqramultHelper _ _ 0 result = error "undefined"
sqramultHelper _ 0 _ result = result
sqramultHelper base exp modulus result
    | even exp = sqramultHelper ((base^2) `mod` modulus) (exp `div` 2) modulus result
    | otherwise = sqramultHelper base (exp - 1) modulus ((result * base) `mod` modulus)