{-# OPTIONS_GHC -Wno-orphans #-}

module Prelude.Orphans where

import Prelude.Prelude

import Data.Semigroup (First(..))
import GHC.Generics (V1)
import Generics.Kind (LoT(..))
import Generics.Kind.Derive.Json
import Generics.Kind.TH ()



deriving via (Op b a) instance Num b => Num (a -> b)
deriving via (Op b a) instance Fractional b => Fractional (a -> b)

deriving newtype instance Monoid a => Monoid (First a)

--deriving newtype instance FunctorWithIndex k (MonoidalMap k)
--deriving newtype instance FoldableWithIndex k (MonoidalMap k)
--instance TraversableWithIndex k (MonoidalMap k) where
--  itraverse f (MonoidalMap t) = MonoidalMap <$> itraverse f t

--deriving newtype instance ToJSON Month
--deriving newtype instance FromJSON Month


instance GToJSONK V1 'LoT0 where
  gtoJSON _ = error "gtoJSON: V1"

instance GFromJSONK V1 'LoT0 where
  gfromJSON _ = fail "gfromJSON: V1"
