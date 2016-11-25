module Token where

data Token = LeftParen | RightParen | OpToken Char | FloatToken Float deriving (Show, Eq)

isLeftAssociative (OpToken '+') = True
isLeftAssociative (OpToken '-') = True
isLeftAssociative (OpToken '*') = True
isLeftAssociative (OpToken '/') = True
isLeftAssociative (OpToken '^') = False

isRightAssociative = not . isLeftAssociative

tokenPrecedence (OpToken '+') = 2
tokenPrecedence (OpToken '-') = 2
tokenPrecedence (OpToken '*') = 3
tokenPrecedence (OpToken '/') = 3
tokenPrecedence (OpToken '^') = 4

instance Ord Token where
  compare a b = compare (tokenPrecedence a) (tokenPrecedence b)
