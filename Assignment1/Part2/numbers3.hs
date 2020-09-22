-- an interpreter for abstract syntax in Haskell

-- a language for arithmetic expressions
data Exp = Num Integer | Plus Exp Exp | Times Exp Exp | Minus Exp Exp | Divide Exp Exp |
           Modulo Exp Exp | Power Exp Exp | Equals Exp Exp | Increment Exp

eval :: Exp -> Integer
eval (Num n) = n

eval (Times e e') = (eval e) * (eval e')
eval (Plus e e') = (eval e) + (eval e')
eval (Minus e e') = (eval e) - (eval e')
-- need to use `div` rather than '/' because of error "No Fractional Integer"
-- `div` gives a floor division
eval (Divide e e') = (eval e) `div` (eval e') 
eval (Modulo e e') = (eval e) `mod` (eval e')
-- '^' is the symbol to use exponents with integers
eval (Power e e') = (eval e) ^ (eval e')
-- technically a pre increment
-- eval (Plus (Num 2) (Increment (Num 3))) results in 6
eval (Increment e) = (eval e) + 1