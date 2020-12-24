# Types in Haskell

In programming languages such as C++, we associate data types with variables to ensure that the variable "holds", or is, a specific data type. In Haskell, all computations are evluations of expressions, and each of these evaluated values have an associated data type. 

## Types in C++
Types in C++ can be broken down into three distinct groups: primitive, derived, and abstract data types. Primitive data types can be found in all programming languages, including Haskell, and include
* Integer
* Character
* Boolean
* Float	
* Double
* Void
* Wide

Primitive data types are the way that all numbers and characters are represented in code, and are the fundamental building blocks to representing all other things through derived and abstract data types.

## Types in Haskell
As mentioned above, each value has an associated type, and the association of a value with its type is called a **typing**. Typings in Haskell are written as

```
5 :: Integer
'a' :: Char
square :: Integer -> Integer
[1,2,3] :: [Integer]
('b', 4) :: (Char, Integer)
```

where "::" is written to mean "has type". 

It is worth noting that Haskell is a strongly typed language, and will also type check at compile time. A strongly typed language indicates that once a value is declared to be a certain type, it will remain that type throughout the entire flow of execution and cannot be changed. Having this type checking available at compile time saves a lot of time trying to debug things at run-time, as well as producing optimized compiler code as it does not have to dynamically type things as it is being run. 

### Type Signatures
When defining functions, you have the option to define the input and output types before defining what the actual function does.

In C++, this can be implemented through something like 
```C++
int square(int x) {
	...
}
```

where the first *int* describes the return type, and the *int* before the *x* indicate the input types of the corresponding variable. 

In Haskell, this can be implemented by:
```Haskell
sum :: Integer -> Integer
sum  = ...
```

where the first Integer indicates the type of the input, and the type after the "->" indicates the "return" type of the function.

### User Defined Types
One of the advantages of user defined types is that 
One way to do this in C++ is through structs or classes. A struct takes the form
```C++
struct rectangle {
	int length, int width;
};
```

This allows us to type rectangle and the interpreter/compiler will now recognize that a "rectangle" should have two ints (representing the length and the width). Even though Haskell is a functional programming language, we still are able to define our own data types. This can be done by:
```Haskell
data Rectangle = Integer Integer  
```

### Type Synonyms
The last thing we will explore is the usage of type synonyms, or the ability to give a  new name to existing types. This allows us to increase readability in our programs, and can be implemented by:
```Haskell
type String = [Char]
```

Thus, when defining what data types a function might take as input or return as an output, we can shorten some of those types using type synonyms.