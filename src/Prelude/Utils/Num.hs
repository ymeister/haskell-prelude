module Prelude.Utils.Num where

import Prelude.Prelude



truncateTo :: RealFrac a => Int -> a -> a
truncateTo n x = (fromIntegral @Integer (truncate (x * t))) / t
  where t = 10^n

clamp :: Ord a => a -> a -> a -> a
clamp a b x = clampM (Just min_) (Just max_) x
  where min_ = min a b
        max_ = max a b

clampM :: Ord a => Maybe a -> Maybe a -> a -> a
clampM min_ max_ x = (maybe id min max_) . (maybe id max min_) $ x

succBound :: (Ord a, Enum a) => (a, a) -> a -> a
succBound (min_, max_) x = if sx > max_ then min_ else sx
  where sx = succ x
