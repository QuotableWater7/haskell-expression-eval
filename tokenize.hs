module Tokenize where

import Data.Char (isDigit)

import Token

sanitizeDecimal str = let (beforeDecimal, afterDecimal) = span (/='.') str
  in (formatInteger beforeDecimal) ++ "." ++ (formatFractional afterDecimal)
  where
    formatInteger [] = "0"
    formatInteger x = x
    formatFractional [] = "0"
    formatFractional xs = (if length xs > 1 then (drop 1 xs) else "0")

str2FloatToken = FloatToken . read . sanitizeDecimal

tokenize :: String -> [Token]

tokenize [] = []
tokenize (' ':xs) = tokenize xs

tokenize str@(x:_)
  | isPartOfNumber x =
    let (numbers, rest) = span isPartOfNumber str in (str2FloatToken numbers) : tokenize rest
    where isPartOfNumber y = (y == '.') || isDigit y

tokenize ('+':xs) = OpToken '+' : tokenize xs
tokenize ('-':xs) = OpToken '-' : tokenize xs
tokenize ('/':xs) = OpToken '/' : tokenize xs
tokenize ('*':xs) = OpToken '*' : tokenize xs
tokenize ('^':xs) = OpToken '^' : tokenize xs

tokenize ('(':xs) = LeftParen : tokenize xs
tokenize (')':xs) = RightParen : tokenize xs
