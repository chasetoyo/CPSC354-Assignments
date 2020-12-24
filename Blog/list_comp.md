# List Comprehension

Aside from the built on functions that can be performed on lists that are mentioned in the previous blog [`Overview of Lists`](lists.md), Haskell provides a syntactic sugar to aid with lists known as *list comprehension*.

Haskell provides an example of list comprehension as below:

*Note that all code can be ran in GHCI to experiment with it yourself*

```Haskell
[ f x | x <- xs ]
```

We will break down each element of this expresion in order to better understand how it is working. The first thing to notice is that everything is contained in '[]', which clearly shows us that we will be creating a list of something.

Next, we will analyze the f and the x on the left side of the pipe ('|'). In English, we would read this as "the list of all *f x*", meaning that our new list will be composed in the form of f x. 

Finally, the right side of the pipe is known as the *generator* for our list. In English, it reads as "such that *x* is drawn from *xs*", which indicates that the elements in our new list will be coming from the *xs*. It is also interesting to note that generators can be combined into multiple generators, as seen in the concrete example as follows.

```Haskell
[(i,j) | i <- [1,2],
         j <- [1..4] ]
```

This expression will evaluate to a new list, where each element is of the form (i,j), and those i's and j's are coming from the generators as described on the right side of the pipe. Specifically, we will end up with a result of 

`[(1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4)]`

If you did not catch it, we used yet another syntactic sugar that Haskell provides for shortening the creation of lists. The usage of `[1..4]` allowed us to create the list `[1,2,3,4]`, where Haskell filled in the blanks for us. It is important to note that this can be done for htings other than numbers, and it also allows for the creation of an *infinite list* if you do not have a closing number or character, such as `[1..]`.
