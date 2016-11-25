import Lexer
import RpnConverter

main = do
  let tokens = lexer "234 + 100 / 5"
  let rpnTokens = convertToRpn tokens
  print rpnTokens
