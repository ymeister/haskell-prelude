module Prelude.Utils.Generics.Pair where

import Prelude.Prelude

import Control.Lens (from)
import Data.Functor.Product
import Data.Generics.Product.HList
import Data.Generics.Product.Internal.HList
import GHC.Generics (Rep)



{-# COMPLETE (:**:) :: (,) #-}
{-# COMPLETE (:**:) :: (:*:) #-}
{-# COMPLETE (:**:) :: Product #-}
infixr 6 :**:
pattern (:**:)
  :: ( GPair x y t
     )
  => x -> y -> t
pattern x :**: y <- (gFromPair -> (x, y)) where
  x :**: y = gToPair x y


class (Generic t, GIsList (Rep t) (Rep t) '[x, y] '[x, y]) => GPair x y t | t -> x y, t -> x, t -> y where
  gFromPair :: t -> (x, y)
  gToPair :: x -> y -> t

instance (Generic t, GIsList (Rep t) (Rep t) '[x, y] '[x, y]) => GPair x y t where
  gFromPair xy = case xy ^. list of
    x :> y :> Nil -> (x, y)
  gToPair x y = (x :> y :> Nil) ^. from list
