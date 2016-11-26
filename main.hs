import Tokenize (tokenize)
import RpnConverter (convertToRpn)
import EvalExpression (solveRpnTokens)

evaluate = solveRpnTokens . convertToRpn . tokenize

evaluateLoop expression = do
  nextOp <- getLine
  if nextOp == ""
    then return ()
  else do
    let result = evaluate $ expression ++ nextOp
    print result
    evaluateLoop (show result)

main = evaluateLoop ""
