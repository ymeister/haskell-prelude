module Prelude.Utils.These where

import Prelude.Prelude



fromEitherOfThese :: These a a -> (a, a)
fromEitherOfThese x = (a, b)
  where
    (a, b) = fromThese b a x
