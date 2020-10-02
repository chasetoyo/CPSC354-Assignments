module Interpreter where

import AbsNumbers

eval :: Exp -> Integer
eval (Num n) = n
eval (Plus n m) = (eval n) + (eval m)
eval (Times n m) = (eval n) * (eval m)
eval (Divide n m) = (eval n) `div` (eval m)
eval (Minus n m) = (eval n) - (eval m)
eval (Modulo n m) = (eval n) `mod` (eval m)
eval (Increment n) = (eval n) + 1
eval (Decrement n) = (eval n) - 1
eval (Negative n) = negate (eval n)
