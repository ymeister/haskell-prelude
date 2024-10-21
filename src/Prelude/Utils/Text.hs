module Prelude.Utils.Text where

import Prelude.Prelude



(<+>) :: (IsString s, Eq s, Semigroup s) => s -> s -> s
(<+>) = curry $ \case
  ("", "") -> ""
  (t1, "") -> t1
  ("", t2) -> t2
  (t1, t2) -> t1 <> " " <> t2

nonEmptyText :: (IsString s, Eq s) => s -> Maybe s
nonEmptyText = \case
  "" -> Nothing
  t -> Just t
