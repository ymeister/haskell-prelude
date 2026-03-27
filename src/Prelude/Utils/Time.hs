module Prelude.Utils.Time where

import Prelude.Prelude



addBusinessDays :: Integer -> Day -> Day
addBusinessDays n !day
  | n < 0 = addBusinessDays businessShiftToStart $ addDays shiftToStart day
  | n > 0 = addBusinessDays businessShiftToEnd $ addDays shiftToEnd day
  | otherwise = day
  where
    (_, _, weekDay) = toWeekDate day
    --
    diffToBusinessStart = fromIntegral $ negate $ weekDay - 1
    diffToBusinessEnd = fromIntegral $ max 0 $ 5 - weekDay
    --
    shiftToStart = case n >= diffToBusinessStart of
      True -> n
      False -> diffToBusinessStart - 3
    shiftToEnd = case n <= diffToBusinessEnd of
      True -> n
      False -> diffToBusinessEnd + 3
    --
    businessShiftToStart = min 0 $ n - diffToBusinessStart + 1
    businessShiftToEnd = max 0 $ n - diffToBusinessEnd - 1
