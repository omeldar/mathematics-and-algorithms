module ChineseRemainder (chineseremainder) where

import ModularInverse (modInverse)
import Data.Maybe (isNothing, fromMaybe)

chineseremainder :: Integral a => [(a, a)] -> a
chineseremainder [] = error "undefined"
chineseremainder linearCongruences = mod sumProduct productOfModuli
    where
        productOfModuli = product $ map snd linearCongruences
        sumProduct = sum $ zipWith (*) remainders products
        remainders = map fst linearCongruences
        products = map (\(remainder, modulus) -> 
            let productOfOthers = productOfModuli `div` modulus
                inverse = modInverse productOfOthers modulus
            in productOfOthers * fromMaybe 0 inverse) linearCongruences
