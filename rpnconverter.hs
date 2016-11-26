module RpnConverter where

import Token

convertToRpn tokens = let (remainingOps, output) = break tokens ([], []) in output ++ remainingOps
  where
    break [] tuples = tuples
    break (t@(FloatToken _):ts) (opStack, outputStack) = break ts (opStack, outputStack ++ [t])
    break (LeftParen:ts) (opStack, outputStack) = break ts (LeftParen:opStack, outputStack)
    break (RightParen:ts) (opStack, outputStack) =
      let (toPop, (_:toRemain)) = span (not . isLeftParen) opStack
        in break ts (toRemain, outputStack ++ (reverse toPop))
        where isLeftParen LeftParen = True
              isLeftParen _ = False
    break (o1@(OpToken _):ts) (opStack, outputStack) =
      let (poppedTokens, unpoppedTokens) = span (shouldPop o1) opStack
        in break ts (o1:unpoppedTokens, outputStack ++ (reverse poppedTokens))
        where shouldPop o1 o2@(OpToken _) = (isLeftAssociative o1 && o1 <= o2) || (isRightAssociative o1 && o1 < o2)
              shouldPop o1 o2 = False
