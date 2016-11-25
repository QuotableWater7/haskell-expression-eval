import Tokenize (tokenize)
import RpnConverter (convertToRpn)
import EvalExpression (solveRpnTokens)

evaluate = solveRpnTokens . convertToRpn . tokenize

main = do
  userInput <- getLine
  if userInput == ""
    then return ()
    else do
      print $ evaluate userInput
      main
