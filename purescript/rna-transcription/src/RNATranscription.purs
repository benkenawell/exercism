module RNATranscription
  ( toRNA
  ) where

import Prelude (($), (<$>), append)
import Data.String (split, Pattern(..))
import Data.Maybe (Maybe(..))
import Data.Array (foldM)

-- folds the RNA rotation on every given letter.
-- returns Nothing if there are any invalid characters
toRNA :: String -> Maybe String
toRNA rna =  foldM foldRNA "" $ split (Pattern "") rna

-- performs the RNA rotation on a single letter
rotateRNA :: String -> Maybe String
rotateRNA "G" = Just "C"
rotateRNA "C" = Just "G"
rotateRNA "A" = Just "U"
rotateRNA "T" = Just "A"
rotateRNA x = Nothing

-- utility function to facilitate fold
foldRNA :: String -> String -> Maybe String
foldRNA acc rna = append acc <$> rotateRNA rna