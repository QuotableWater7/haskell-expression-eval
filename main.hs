import Lexer
import RpnConverter
import EvalExpression
import Token

main = do
  let tokens = lexer "3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3"
  let rpnTokens = convertToRpn tokens
  let results = solveRpnTokens rpnTokens
  print results
