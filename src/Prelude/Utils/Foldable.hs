module Prelude.Utils.Foldable where

import Prelude.Prelude
import GHC.Exts qualified as IsList



type List l a = (IsList l, IsList.Item l ~ a)

pattern List :: IsList l => [IsList.Item l] -> l
pattern List { unList } <- (IsList.toList -> unList) where
  List a = IsList.fromList a



iffor :: FunctorWithIndex i f => f a -> (i -> a -> b) -> f b
iffor = flip imap

foldFor :: (Foldable t, Monoid m) => t a -> (a -> m) -> m
foldFor = flip foldMap

ifoldFor :: (FoldableWithIndex i t, Monoid m) => t a -> (i -> a -> m) -> m
ifoldFor = flip ifoldMap
