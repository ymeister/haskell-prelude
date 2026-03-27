{-# options_ghc -fno-warn-orphans #-}

module Prelude.Utils.Text.Orphans where

import Prelude.Prelude

import Data.Text qualified as T
import Data.UUID qualified as UUID
import Text.PrettyPrint.HughesPJ qualified as Pretty
import Text.PrettyPrint.HughesPJClass (Pretty(..))



instance Pretty Text where
  pPrint = Pretty.text . T.unpack

instance Pretty Natural where
  pPrint = Pretty.text . show

instance Pretty Int64 where
  pPrint = Pretty.text . show

instance Pretty UUID where
  pPrint = Pretty.text . UUID.toString
