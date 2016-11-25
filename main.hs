import Lexer
import RpnConverter
import EvalExpression

main = do
  let tokens = lexer "234 + 100 / 5"
  let rpnTokens = convertToRpn tokens
  let results = solveRpnTokens rpnTokens
  print results
