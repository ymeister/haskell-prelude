module Prelude.Utils.Error where

import Prelude.Prelude



fromMaybeT :: Functor m => a -> MaybeT m a -> m a
fromMaybeT a m = fromMaybe a <$> runMaybeT m
