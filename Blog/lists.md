# Overview of Lists

The following built in functions and their details can be found on https://wiki.haskell.org/.

### Basics
* Size
    * `length xs`
* Reverse
    * `reverse xs`

### Indexing
* `xs !! n`
where n is the nth element in the list, similar to indexing in Python in the form of `ls[0]`.

The following two in particular will be useful in this course.

* Get first element
    * `head xs`
* Get everything except the first element
    * `tail xs`

### Adding
* Add to start:
    * `new_elem : xs`
* Append:
    * `xs ++ [new_element]`
* Join:
    * `xs ++ ys`

### Deleting
* Delete the first n elements
    * `drop n xs`
* Split lists into two smaller lists
   * `splitAt n xs`

where n is the position at which the original list will split.

### Modifying list
* Apply function to all elements
    * `map function xs`
* Number elements in a list
    * `zip xs [0..]`
    * This will return a list of tuples, where each element in the list is paired in a tuple with the corresponding number.]
* Sort a list
    * `sort xs`

## Tuples 
Different from lists is tuples, which does exist in other programming languages such as Python. Similarly to python, a tuple is a way to store multiple values, with some key differences to a list. Firstly, tuples are immutable, meaning they store a fixed number of elements. Additionally, tuples can store multiple types of values, and they have different functions than a list. These functions include:

* Get first element of a pair
    * `fst (a, b)`
* Get second element of a pair
    * `snd (a, b)`
* Swap elements in a pair
    * `swap (a,b)`
    * this will return '(b,a)'