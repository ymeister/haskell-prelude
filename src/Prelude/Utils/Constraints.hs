{-# LANGUAGE UndecidableSuperClasses #-}

module Prelude.Utils.Constraints where

import Prelude.Prelude hiding (Field)
import Prelude.Orphans ()

import Data.Aeson
import Data.Constraint
import GHC.Generics
import Generics.Kind
import Generics.Kind.Derive.Json



data WithConstraint c x where
  WithConstraint :: c => { unWithConstraint :: x } -> WithConstraint c x

instance Evince c => Generic (WithConstraint c x) where
  type Rep (WithConstraint c x) = Rec0 x :+: V1
  from = L1 . K1 . unWithConstraint
  to = \case
    R1 _ -> error "Generic (WithConstraint c x): to: V1"
    L1 (K1 x) -> case evince @c of
      Nothing -> error "Generic (WithConstraint c x): to: no evince"
      Just Dict -> WithConstraint x

instance Evince c => GenericK (WithConstraint c x) where
  type RepK (WithConstraint c x) = Field ('Kon x) :+: V1
  fromK = L1 . Field . unWithConstraint
  toK = \case
    R1 _ -> error "Generic (WithConstraint c x): toK: V1"
    L1 (Field x) -> case evince @c of
      Nothing -> error "Generic (WithConstraint c x): toK: no evince"
      Just Dict -> WithConstraint x

deriving stock instance Eq x => Eq (WithConstraint c x)
deriving stock instance Ord x => Ord (WithConstraint c x)
deriving stock instance Show x => Show (WithConstraint c x)

instance (ToJSON x, Evince c) => ToJSON (WithConstraint c x) where
  toJSON = gtoJSON'
instance (FromJSON x, Evince c) => FromJSON (WithConstraint c x) where
  parseJSON = gfromJSON'



class Evince c where
  evince :: Maybe (Dict c)

  default evince :: c => Maybe (Dict c)
  evince = Just Dict

instance {-# OVERLAPPABLE #-} c => Evince c where
  evince = Just Dict

class Evince (c a) => Evince1 c a
instance Evince (c a) => Evince1 c a



class (c1 x, c2 x) => ProductC c1 c2 x
instance (c1 x, c2 x) => ProductC c1 c2 x
