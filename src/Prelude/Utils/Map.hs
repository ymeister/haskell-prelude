module Prelude.Utils.Map where

import Prelude.Prelude

import Data.Map qualified as Map
import Data.Map.Monoidal qualified as MMap



foldMapFromList
  :: forall f k v.
     ( Applicative f
     , Semigroup (f v)
     , Ord k
     ) => [(k, v)] -> Map k (f v)
foldMapFromList = foldMapFromListWith pure

foldNestedMapFromList
  :: forall k subk subv.
     ( Ord k
     , Ord subk
     )
  => [(k, (subk, subv))]
  -> Map k (Map subk subv)
foldNestedMapFromList = foldMapFromListWith (uncurry Map.singleton)

foldMapFromListWith
  :: forall s k v.
     ( Semigroup s
     , Ord k
     )
  => (v -> s)
  -> [(k, v)]
  -> Map k s
foldMapFromListWith f = Map.fromListWith (<>) . (fmap . fmap) f



mapHeadPreferringJust :: Map (Maybe k) a -> Maybe a
mapHeadPreferringJust xs = case Map.toAscList xs of
  [] -> Nothing
  (Just _, x) : _ -> Just x
  (Nothing, _) : (Just _, x) : _ -> Just x
  (_, x) : _ -> Just x

flattenMap :: (Ord k1, Ord k2) => Map k1 (Map k2 v) -> Map (k1, k2) v
flattenMap = Map.unions . Map.mapWithKey (\k1 -> Map.mapKeys (\k2 -> (k1, k2)))



composeMaps
  :: ( Ord a
     , Ord b
     , Semigroup c
     )
  => Map a b -> Map b c -> Map a (Map b c)
composeMaps m1 m2 = coerce $ Map.foldMapWithKey (\a b -> MMap.singleton a $ maybe mempty (MMap.singleton b) $ Map.lookup b m2) m1

swapMap :: forall a b c. (Ord a, Ord b) => Map a (Map b c) -> Map b (Map a c)
swapMap mambc =
  let
    lalbc :: [(a, [(b, c)])]
    lalbc = Map.toList $ fmap Map.toList mambc

    lbmac :: [(b, Map a c)]
    lbmac = do
      (a, lbc) <- lalbc
      (b, c) <- lbc
      pure (b, Map.singleton a c)
  in Map.fromListWith (<>) lbmac
