# Anonymous Functions

The background of Lambda Calculus is quite in depth, so we will do a simple introduction of what Lambda Calculus is and how it is implemented in Haskell.

To begin, lambda calculus can be seen as a universal programming language of sorts, abstracting away a lot of the intricasies seen in modern programming languages and condensing it into something that can really be written in singular lines. As mentioned in Professor Kurz's introduction to Lambda Calculus at https://hackmd.io/@alexhkurz/S1D0yP8Bw, Lambda Calculus has three programming constructs, namely abstraction, application, and variables. 

The general form of lambda calculus would be `\x.e`, where this is the function *e* which has a formal parameter *x*. 

Comparing lambda calculus to C++, we would write a definition for mult in C++ as

```C++
int mult(int a, int b) {
	return a * b;
}
mult (2,4)
```

and in lambda calculus as 

```
(\x.\y. x * y) 2 4 
```

where the function and the argument are placed in-line with each other. From this example alone we can see that lambda calculus can turn a very long program into a very concise line, with the slight expense of readability and the absence of types.

Although this is not seen in many other programming languages, Haskell does take advantage of this notion of lambda calculus through something called *anonymous functions*. In essence, there is no functional difference between lambda calculus and anonymous functions, only a syntactic difference. 

```Haskell
(\x y -> x * y) 2 4
```

and again the normal function implemented in Haskell

```Haskell
mult :: Integer -> Integer -> Integer
mult x y = x * y

main = do 
   print(mult 2 4)
```

The key differences here is that unlike lambda calculus, we do not need a "lambda" before each parameter. Haskell automatically determines that each parameter (separated by a space) before the "->" is a different parameter. Other than that, it remains entirely the same as the original lambda calculus.

The key advantages of anonymous functions are that we are able to create functions on the fly, without first naming them and giving them an intricate definition. One such use case is when using map on a list. Taken from https://wiki.haskell.org/Anonymous_function, we can see that rather than doing 

```Haskell
addOneList lst = map addOne' lst
  where addOne' x = x + 1
```

we can instead do 

```Haskell
addOneList' lst = map (\x -> x + 1) lst
```

This greatly simplifies the process when we need to create some kind of functionality on the fly.