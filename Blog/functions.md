# Functions

## Declaring Functions

We will next explore how to create functions in Haskell and compare them to similar functions in C++, which will allow us to further explore the key differences between imperative and functional programming. 

As we mentioned in [`Types in Haskell`](types.md), functions in Haskell can have type declarations, although they are not required to. This is largely different from other languages such as C++, where the first "word" in a function declaration is the return type, regardless if the return type is void or not.

A multiplication function in C++ may look like
```C++
...

int mult(int a, int b) {
	return a * b;
}

cout << mult(2,4) << endl;
```

which would obviously print out `8` to the console. We can see that there are type declarations of the return type, as well as the types of the inputs. In the brackets that enclose the statement, we have a statement that returns a value of `a*b`.

Comparing this same function to Haskell, there are a few ways that we might implement this.

```Haskell
mult :: Integer -> Integer -> Integer
mult x y = x * y

main = do 
   print(mult 2 4)
```

Alternatively, we can skip the first line entirely and only write 

```Haskell
mult x y = x * y

main = do 
   print(mult 2 4)
```

which again, would output `8` to the console. The key things to take away here are that the type declaration is comprised of `Type -> Type -> Type`, so it is not immediately obvious what represents the function return type and what represents our inputs. We can infer that the first two *Type*'s indicate the two input types, and the final *Type* is what type our expression will evaluate to. 

It's important to note that throughout the process, because Haskell is strongly typed, it will ensure that your function can only evaluate to the type specified, as well as only take input which is the type specified. 

### Pattern Matching

In Haskell, rather than implementing an if-else, where the function takes in a generic *n*, we can take advantage of pattern matching, which allows us to redefine what the function will do depending on the input that it receives. In this next example, we will explore pattern matching through a recursive fibonnaci program in Haskell.

```Haskell
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
```

As mentioned above, we were able to redefine the functionality of *fib* because of Haskell's ability to pattern match. An alternative approach in an imperative programming language such as C++ would look like:

```C++
int fib(int n) {
	if (n == 0) {
		return 0
	}
	else if (n == 1) {
		return 1
	}
	else {
		return fib(n-1) + fib(n-2)
	}
}
```

Both Haskell and C++ are capable of creating recursive functions, but C++ is unable to pattern match the input and redefine the functionality of a function depending on that input. 