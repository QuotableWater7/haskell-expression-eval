module EvalExpression where

import Token

-- solveRpn :: (Token a, Read a) => String -> a
-- solveRpn = head . foldl foldingFunction [] . words
--     where   foldingFunction (x:y:ys) "*" = (x * y):ys
--             foldingFunction (x:y:ys) "+" = (x + y):ys
--             foldingFunction (x:y:ys) "-" = (y - x):ys
--             foldingFunction xs numberString = read numberString:xs

solveRpnTokens :: [Token] -> Float
solveRpnTokens = head . foldl foldingFunction []
  where foldingFunction (x:y:ys) (OpToken '+') = (x + y):ys
        foldingFunction (x:y:ys) (OpToken '-') = (y - x):ys
        foldingFunction (x:y:ys) (OpToken '*') = (x * y):ys
        foldingFunction (x:y:ys) (OpToken '/') = (x / y):ys
        foldingFunction values (FloatToken i) = i:values
