module Prelude.Utils.List where

import Prelude.Prelude



takeEveryN
  :: ( IsList (f b)
     , b ~ Item (f b)
     )
  => Int -> f b -> f b
takeEveryN n xs = withList xs $ \case
    [] -> []
    (l : ls) -> reverse $ snd $ foldl' go (1, [l]) ls
  where
    go !(i, acc) z = case i >= n of
      True -> (1, z : acc)
      False -> (i + 1, acc)

takeEvenly
  :: ( Foldable f
     , IsList (f b)
     , b ~ Item (f b)
     )
  => Int -> f b -> f b
takeEvenly n xs = takeEveryN m xs
  where
    m = ceiling @Double $ (fromIntegral $ length xs) / (fromIntegral n)

padFrom
  :: ( Foldable f
     , Semigroup (f a)
     , IsList (f a)
     , a ~ Item (f a)
     )
  => Int -> f a -> f a -> f a
padFrom n xs ys = xs <> asList (take (n - length xs)) ys

asList
  :: ( IsList f
     , IsList g
     )
  => ([Item f] -> [Item g]) -> f -> g
asList f xs = fromList $ f $ toList xs

withList
  :: ( IsList f
     , IsList g
     )
  => f -> ([Item f] -> [Item g]) -> g
withList xs f = asList f xs
