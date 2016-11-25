module EvalExpression where

import Token

solveRpnTokens :: [Token] -> Float
solveRpnTokens = head . foldl foldingFunction []
  where foldingFunction values (FloatToken i) = i:values
        foldingFunction (x:y:ys) (OpToken '+') = (x + y):ys
        foldingFunction (x:y:ys) (OpToken '-') = (y - x):ys
        foldingFunction (x:y:ys) (OpToken '*') = (x * y):ys
        foldingFunction (x:y:ys) (OpToken '/') = (x / y):ys
        foldingFunction (x:y:ys) (OpToken '^') = (x ** y):ys
