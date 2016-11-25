module Tokenize where

import Data.Char (isDigit)

import Token

tokenize :: String -> [Token]

tokenize [] = []
tokenize (' ':xs) = tokenize xs

tokenize str@(x:_)
  | isPartOfNumber x =
    let (numbers, rest) = span isPartOfNumber str in FloatToken (read numbers) : tokenize rest
    where isPartOfNumber y = (y == '.') || isDigit y

tokenize ('+':xs) = OpToken '+' : tokenize xs
tokenize ('-':xs) = OpToken '-' : tokenize xs
tokenize ('/':xs) = OpToken '/' : tokenize xs
tokenize ('*':xs) = OpToken '*' : tokenize xs
tokenize ('^':xs) = OpToken '^' : tokenize xs

tokenize ('(':xs) = LeftParen : tokenize xs
tokenize (')':xs) = RightParen : tokenize xs
