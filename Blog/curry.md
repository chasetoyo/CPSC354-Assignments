# Currying

What you might not have noticed in the second example of [`Functions`](functions.md) is that the type declarations for the function's "return" type as well as the function's input types looked exactly indentical. I will repost the function here for your convenience.

```Haskell
mult :: Integer -> Integer -> Integer
mult x y = x * y

main = do 
   print(mult 2 4)
```

*the same function but implemented in C++*

```C++
...

int mult(int a, int b) {
	return a * b;
}

cout << mult(2,4) << endl;
```


In that blog post we concluded that the final *Integer* was the function's "return" type, and the other two *Integer*'s indicated the functions input types. However, this conclusion did not have a strong basis, and was only an inference to try and understand the way that Haskell impelemented things. In this blog, we will explore *currying*, the "process of transforming a function that takes multiple arguments in a tuple as its argument, into a function that takes just a single argument and returns another function which accepts further arguments, one by one." (https://wiki.haskell.org/Currying)

The first thing to note is that every function in Haskell can *technically* only take one argument. If this is true, then how did the *mult* function above take 2 arguments, x and y? The way that this works is by *currying*. In other words,

```Haskell
mult :: Integer -> Integer -> Integer
mult x y = x * y

main = do 
   print(mult 2 4)
```

can be rewritten as 

```Haskell
mult :: Integer -> (Integer -> Integer)
mult x y = x * y

main = do 
   print(mult 2 4)
```

Rather than *mult* being a function that takes two integers and returns a single integer, adding the parentheses above shows that it actually takes one argument, an integer, and returns a function that itself takes one integer argument and returns an integer. This shows that we actually were interpreting the type declarations wrong in the previous blog post. 

To break it down even more, 

`mult 2 4` 

is first applying `mult` to `2`. If it helps to visualize this, we can add parentheses as follows

`(mult 2) 4`

It then applies the resulting value of `mult 2` to `4`, which gives us the expected answer, *8*.