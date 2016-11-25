import Tokenize (tokenize)
import RpnConverter (convertToRpn)
import EvalExpression (solveRpnTokens)

main = do
  userInput <- getLine
  if userInput == ""
    then return ()
    else do
      let tokens = tokenize userInput
      let rpnTokens = convertToRpn tokens
      let results = solveRpnTokens rpnTokens
      print results
      main
