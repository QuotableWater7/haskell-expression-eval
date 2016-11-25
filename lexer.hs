module Lexer where

import Data.Char (isDigit)

import Token

lexer :: String -> [Token]

lexer [] = []
lexer (' ':xs) = lexer xs

lexer str@(x:_) | isDigit x =
  let (numbers, rest) = span isDigit str in FloatToken (read numbers) : lexer rest

lexer ('+':xs) = OpToken '+' : lexer xs
lexer ('-':xs) = OpToken '-' : lexer xs
lexer ('/':xs) = OpToken '/' : lexer xs
lexer ('*':xs) = OpToken '*' : lexer xs
