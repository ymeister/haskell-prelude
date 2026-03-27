module Prelude.Utils.Lens where

import Prelude.Prelude

import Control.Lens (set)



underlook :: Applicative f => Lens' s t -> Lens' (f s) (f t)
underlook f = lens (fmap $ view f) (liftA2 (flip $ set f))
