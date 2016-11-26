import Tokenize (tokenize)
import RpnConverter (convertToRpn)
import EvalExpression (solveRpnTokens)

evaluate = solveRpnTokens . convertToRpn . tokenize

evaluateLoop expression = do
  let result = evaluate expression
  print result

  nextOp <- getLine

  if nextOp == ""
    then return ()
    else do
      evaluateLoop $ (show result) ++ nextOp

main = getLine >>= evaluateLoop
