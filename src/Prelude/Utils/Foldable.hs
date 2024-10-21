module Prelude.Utils.Foldable where

import Prelude.Prelude



foldFor :: (Foldable t, Monoid m) => t a -> (a -> m) -> m
foldFor = flip foldMap

ifoldFor :: (FoldableWithIndex i t, Monoid m) => t a -> (i -> a -> m) -> m
ifoldFor = flip ifoldMap
