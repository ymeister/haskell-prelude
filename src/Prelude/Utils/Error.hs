module Prelude.Utils.Error where

import Prelude.Prelude



--traceWith :: (a -> String) -> a -> a
--traceWith f a = trace (f a) a

--traceShowWith :: Show b => (a -> b) -> a -> a
--traceShowWith f = traceWith (show . f)



fromMaybeT :: Functor m => a -> MaybeT m a -> m a
fromMaybeT a m = fromMaybe a <$> runMaybeT m
