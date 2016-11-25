module Lexer where

import Data.Char (isDigit)

import Token

lexer :: String -> [Token]

lexer [] = []
lexer (' ':xs) = lexer xs

lexer str@(x:_) | isDigit x =
  let (numbers, rest) = span isDigit str in IntToken (read numbers) : lexer rest

lexer ('+':xs) = PlusToken : lexer xs
lexer ('-':xs) = MinusToken : lexer xs
lexer ('/':xs) = DivToken : lexer xs
lexer ('*':xs) = MultToken : lexer xs