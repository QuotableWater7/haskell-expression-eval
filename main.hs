import Lexer
import RpnConverter
import EvalExpression
import Token

main = do
  userInput <- getLine
  if userInput == ""
    then return ()
    else do
      let tokens = lexer userInput
      let rpnTokens = convertToRpn tokens
      let results = solveRpnTokens rpnTokens
      print results
      main
