import Lexer
import RpnConverter
import EvalExpression
import Token

main = do
  let tokens = lexer "3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3"
  -- let tokens = lexer "1 / 5 + 1"
  print tokens
  let rpnTokens = convertToRpn tokens
  print rpnTokens
  let results = solveRpnTokens rpnTokens
  print results
