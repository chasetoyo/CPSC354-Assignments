# Monads

Monads are an extension of applicative functors, so perhaps it is worth briefly discussing what a functor is. According to https://hackage.haskell.org/package/base-4.14.1.0/docs/Data-Functor.html, a type *f* is a functor if it provides a function fmap, which, given any types a and b, lets you apply a function of type (a->b) to turn an f a into an f b, preserving the structure of f. To see this definition in a very clear haskell form,

```Haskell
fmap :: (Functor f) => (a -> b) -> f a -> f b
```

The usage of monads are when you have a value with a context m a, then apply it to a function that takes a normal a and returns a value with a context. In other words, 

```Haskell
(>>=) :: (Monad m) => m a -> (a -> m b) -> m b 
```

where ">>=" is read as "bind". We can see that it is very easy to apply a function *a -> b* to a normal value *a*, but when we add the context *m* to it, it might seem difficult at first how to apply that same function. The key to adding this context is with the *Maybe* monad. 

## Maybe

*Maybe* is a keyword in Haskell, and it is in fact, a monad. A value with type *Maybe a* is a value of type a, with the context of possible failure (meaning that it might not actually have type a). On the other hand, the value of type *Just a* represents a value *a*, where the value *Nothing* represents its absence. 

The Maybe monad allows us to create functions such as this

```Haskell
f::Int -> Maybe Int
f 0 = Nothing
f x = Just x
```

where it has the possibility of not having a value (in this case, if the input is 0), and in every other case, it returns the value of *Just x*. 