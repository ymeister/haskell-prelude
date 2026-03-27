module Prelude.Utils.Composition where

import Prelude.Prelude



infixr 0 $
type (f :: k1 -> k2) $ (a :: k1) = f a

infixl 1 &
type (a :: k1) & (f :: k1 -> k2) = f a



infixr 9 <.>
(<.>) :: Functor f => (a -> b) -> (c -> f a) -> c -> f b
f1 <.> f2 = fmap f1 . f2

infixl 4 <<*>>
(<<*>>) :: (Applicative f, Applicative g) => f (g (a -> b)) -> f (g a) -> f (g b)
(<<*>>) = liftA2 (<*>)
