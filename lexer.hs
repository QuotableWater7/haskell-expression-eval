module Lexer where

import Data.Char (isDigit)

import Token

lexer :: String -> [Token]

lexer [] = []
lexer (' ':xs) = lexer xs

lexer str@(x:_)
  | isPartOfNumber x =
    let (numbers, rest) = span isPartOfNumber str in FloatToken (read numbers) : lexer rest
    where isPartOfNumber y = (y == '.') || isDigit y

lexer ('+':xs) = OpToken '+' : lexer xs
lexer ('-':xs) = OpToken '-' : lexer xs
lexer ('/':xs) = OpToken '/' : lexer xs
lexer ('*':xs) = OpToken '*' : lexer xs
lexer ('^':xs) = OpToken '^' : lexer xs

lexer ('(':xs) = LeftParen : lexer xs
lexer (')':xs) = RightParen : lexer xs
