module Prelude.Utils.Pair where



-- | Infix tuple

type x :&: y = (x, y)

{-# COMPLETE (:&:) #-}
infixr 6 :&:
pattern (:&:) :: x -> y -> x :&: y
pattern x :&: y = (x, y)
