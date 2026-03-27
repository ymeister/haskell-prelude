module Prelude.Utils.Text where

import Prelude.Prelude
import Prelude.Utils.Text.Orphans ()

import Data.Aeson
import Data.Text qualified as T
import GHC.TypeLits qualified as TL
import Text.PrettyPrint.HughesPJClass qualified as PP
import Text.Regex.TDFA ((=~))



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

like
  :: forall a b.
     ( Printable a
     , Printable b
     )
  => a
  -> b
  -> Bool
like a b = (print_ @b @Text b) =~ (".*" <> (print_ @a @Text a) <> ".*")

ilike
  :: forall a b.
     ( Printable a
     , Printable b
     )
  => a
  -> b
  -> Bool
ilike a b = (T.toLower $ print_ @b @Text b) =~ (".*" <> (T.toLower $ print_ @a @Text a) <> ".*")



tshow :: Show a => a -> Text
tshow = T.pack . show

print_ :: (Printable a, IsString s) => a -> s
print_ = fromString . PP.render . printDoc_



class Printable a where
  printDoc_ :: a -> PP.Doc

instance {-# OVERLAPPING #-} Printable a => Printable (Identity a) where
  printDoc_ (Identity a) = printDoc_ a

instance {-# OVERLAPPING #-} PrintableMaybe (Maybe a) => Printable (Maybe a) where
  printDoc_ = printDocMaybe_

instance {-# OVERLAPPING #-} Printable Bool where
  printDoc_ = \case
    True -> PP.text "Yes"
    False -> PP.text "No"

instance {-# OVERLAPPABLE #-} PP.Pretty a => Printable a where
  printDoc_ = PP.pPrint



class PrintableMaybe a where
  printDocMaybe_ :: a -> PP.Doc

instance {-# OVERLAPPING #-} Printable a => PrintableMaybe (Maybe a) where
  printDocMaybe_ = maybe mempty printDoc_

instance {-# OVERLAPPABLE #-} TL.TypeError ('TL.Text "Printing of nested Maybes is prohibited") => PrintableMaybe (Maybe (Maybe a)) where
  printDocMaybe_ = error "Printing of nested Maybes is prohibited"



newtype PrettyMaybe a = PrettyMaybe { unPrettyMaybe :: Maybe a }
  deriving newtype (Eq, Ord, Show, Generic, Universe, Finite)

instance ToJSON a => ToJSON (PrettyMaybe a) where
  toJSON (PrettyMaybe ma) = toJSON $ maybeToList ma

instance FromJSON a => FromJSON (PrettyMaybe a) where
  parseJSON val = fmap (PrettyMaybe . listToMaybe) $ parseJSON val
