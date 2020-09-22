-- an interpreter for abstract syntax in Haskell

-- a language for arithmetic expressions
data Exp = Num Integer | Plus Exp Exp | Times Exp Exp | Minus Exp Exp | Divide Exp Exp |
           Modulo Exp Exp | Equals Exp Exp | Increment Exp | Decrement Exp

eval :: Exp -> Integer
eval (Num n) = n

eval (Times e e') = (eval e) * (eval e')
eval (Plus e e') = (eval e) + (eval e')
eval (Minus e e') = (eval e) - (eval e')
-- need to use `div` rather than '/' because of error "No Fractional Integer"
-- `div` gives a floor division
eval (Divide e e') = (eval e) `div` (eval e') 
eval (Modulo e e') = (eval e) `mod` (eval e')
-- pre increment
eval (Increment e) = (eval e) + 1
-- pre decrement
eval (Decrement e) = (eval e) - 1