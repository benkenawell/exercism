module RNATranscription
  ( toRNA
  ) where

import Prelude
import Data.String (split, joinWith, Pattern(..))
import Data.Maybe
import Data.Functor ((<#>))
import Data.Array (foldM)

toRNA :: String -> Maybe String
toRNA rna = split (Pattern "") rna # foldM foldRNA ""

foldRNA :: String -> String -> Maybe String
foldRNA acc rna = (rotateRNA rna) >>= (\rotRNA -> Just ( acc <> rotRNA))

rotateRNA :: String -> Maybe String
rotateRNA "G" = Just "C"
rotateRNA "C" = Just "G"
rotateRNA "A" = Just "U"
rotateRNA "T" = Just "A"
rotateRNA x = Nothing