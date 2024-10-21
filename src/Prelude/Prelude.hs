module Prelude.Prelude
  ( module Prelude
  ) where

import Relude as Prelude hiding
  (
  -- Control.Category
    id
  , (.)

  -- Data.Semialign
  , repeat
  , unzip
  , zip
  , zipWith

  -- GHC.IsList
  , toList

  -- Witherable
  , catMaybes
  , filter
  , hashNub
  , mapMaybe
  , ordNub
  , ordNubOn
  )

import Control.Category as Prelude
import Data.Default as Prelude
import Data.Foldable1 as Prelude (intercalate1)
import Data.Foldable.WithIndex as Prelude
import Data.Foldable1.WithIndex as Prelude
import Data.Functor.WithIndex as Prelude
import Data.Traversable.WithIndex as Prelude
import Data.Semialign as Prelude
import GHC.IsList as Prelude (IsList(..))
import Witherable as Prelude
