module Prelude.Prelude
  ( module Prelude
  ) where

import Relude as Prelude hiding
  (
  -- Control.Category
    id
  , (.)

  -- Data.Semialign
  , repeat
  , unzip
  , zip
  , zipWith

  -- Witherable
  , catMaybes
  , filter
  , hashNub
  , mapMaybe
  , ordNub
  , ordNubOn

  -- GHC.TypeLits
  , natVal
  , someNatVal

  -- Data.Universe
  , universe

  -- Control.Error.Util
  , hoistMaybe
  , hoistEither

  -- GHC.Exts / GHC.IsList
  , toList

  -- Data.Functor.Product
  , Product

  -- Data.Semigroup
  , First
  )

import Control.Applicative as Prelude
import Control.Category as Prelude
import Control.Lens as Prelude
  ( Lens
  , Lens'
  , LensLike
  , LensLike'
  , Getting
  , Getter
  , Setter
  , Setter'
    --
  , _Just
  , _Nothing
    --
  , _Left
  , _Right
    --
  , lens
  , view
  , mapped
  , mapping
    --
  , (^.)
  , (^?)
  , (.~)
  , (%~)
  , (<>~)
    --
  , (^#)
  , (#~)
  )
import Control.Error.Util as Prelude
  ( hush
  , hushT
  , note
  , noteT
  , hoistMaybe
  , hoistEither
  , failWith
  , failWithM
  )
import Control.Lens.Tuple as Prelude
import Control.Monad as Prelude
import Control.Monad.Except as Prelude
import Control.Monad.Syntax as Prelude
import Data.Default as Prelude
import Data.Either.Extra as Prelude (fromEither)
import Data.EitherR as Prelude (fmapL)
import Data.Foldable.WithIndex as Prelude
import Data.Foldable1 as Prelude (intercalate1)
import Data.Foldable1.WithIndex as Prelude
import Data.Function as Prelude hiding (id, (.))
import Data.Function.Syntax as Prelude
import Data.Functor as Prelude
import Data.Functor.Syntax as Prelude
import Data.Functor.WithIndex as Prelude
import Data.Generics.Labels ()
import Data.Generics.Labels as Prelude
import Data.Generics.Product.Fields as Prelude hiding (HasField(..), setField, getField)
import Data.Generics.Product.Typed as Prelude
import Data.Interval ()
import Data.Kind as Prelude
import Data.Map.Monoidal as Prelude (MonoidalMap(..))
import Data.Maybe as Prelude hiding (catMaybes, mapMaybe)
import Data.MonoTraversable as Prelude
import Data.Proxy as Prelude
import Data.Semialign as Prelude hiding (unzip)
import Data.These as Prelude
import Data.These.Combinators as Prelude
import Data.Time.Calendar.WeekDate.Compat as Prelude
import Data.Time.Compat as Prelude hiding (getCurrentTime, months)
import Data.Traversable as Prelude (for)
import Data.Traversable.WithIndex as Prelude
import Data.UUID as Prelude (UUID)
import Data.Universe as Prelude
import Data.Vector as Prelude (Vector)
import Data.Word as Prelude
import GHC.Exts as Prelude (IsList(..))
import GHC.Generics as Prelude (M1(..), (:*:)(..), (:+:)(..), (:.:)(..))
import GHC.Natural as Prelude
import GHC.TypeLits as Prelude
import Generic.Data as Prelude (Generically(..), gcoerce)
import Generic.Data.Microsurgery as Prelude (Surgery'(..))
import HigherKinded as Prelude hiding (Dict)
import HigherKinded.HKD.Applied as Prelude
import Witherable as Prelude
