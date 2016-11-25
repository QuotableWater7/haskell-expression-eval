module RpnConverter where

import Token

convertToRpn [a] = [a]
convertToRpn tokens = let (remainingOps, output) = break tokens ([], []) in output ++ remainingOps
  where
    break tokens@(t@(FloatToken i):ts) (opStack, outputStack) = break ts (opStack, outputStack ++ [t])
    break (o1@(OpToken _):ts) (opStack, outputStack) =
      let (a, b) = span (shouldPop o1) opStack
        in break ts (o1:a, outputStack ++ b)
        where shouldPop o1 o2 = (isLeftAssociative o1 && o1 <= o2) || (isRightAssociative o1 && o1 < o2)
    break [] tuples = tuples
