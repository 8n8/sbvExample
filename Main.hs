{-# LANGUAGE ScopedTypeVariables #-}
module Main (main) where

import qualified Data.SBV.List as Sl
import qualified Data.SBV as S


main :: IO ()
main = do
    result <- S.optimize S.Lexicographic help
    print result


help :: S.SymbolicT IO ()
help = do
    xs :: S.SList S.SBool <- S.sList "xs"
    S.constrain $ isValid xs
    S.minimize "goal" $ toNum xs


isValid :: S.SList S.SBool -> S.SBool
isValid xs =
    Sl.length xs S..> 0


toNum :: S.SList S.SBool -> S.SInteger
toNum xs =
    Sl.length xs
