------------------
-- NATURAL NUMBERS
------------------

data NN = O | S NN
    deriving (Eq,Show)

-- addition
add :: NN -> NN -> NN
add O n = n
add (S n) m = S (add n m)

-- multiplication
mult :: NN -> NN -> NN
mult O n = O
mult (S O) n = n
mult (S n) m = add m (mult n m)

-- subtract 
subtr :: NN -> NN -> NN
subtr O n = O
subtr n O = n
subtr (S n) (S m) = subtr n m

-- less n m if n < m
-- use recursion on NN
less :: NN -> NN -> Bool
less O O = False
less O n = True
less n O = False
less (S n) (S m) = less n m

-- division
-- division is just repeated subtraction
-- if numerator is less than denominator, set to O
    -- we dont have fractions in NN
divi :: NN -> NN -> NN
divi O n = O
divi n O = O
divi n m =
    if less n m == True
        then O
        else
            S(divi (subtr n m) m)

-- remainder
-- set n % O to be O to avoid errors
-- remainder is the difference between the dividend and 
    -- the quotient * divisor
modl :: NN -> NN -> NN
modl O n = O
modl n O = O
modl n m =
    if less n m
        then n
        else subtr n (mult m (divi n m))

-- greatest common divisor
-- implement Euclid's algorithm, allow gcdN O O = O to make it simpler
-- use recursion on NN
gcdN :: NN -> NN -> NN
gcdN O O = O
gcdN O n = n
gcdN n O = n
gcdN n m = gcdN m (modl n m)


-----------------
-- POSITIVE NUMBERS
-----------------

-- I represents 1
-- T represents any number of 1's preceeding I
data PN = I | T PN
    deriving (Eq,Show)

-- addition of positive numbers
-- use recursion over PN
-- same as addition over natural numbers, get rid of identity law of 0
addP :: PN -> PN -> PN
addP I n = T n
addP (T n) m = T (addP n m)

-- multiplication of positive numbers
-- use recursion over PN
-- Use multiplicative identity property
multP :: PN -> PN -> PN
multP I n = n
multP n I = n
multP (T n) m = addP m (multP n m)

-- lessP n m if n < m
-- use recursion over PN
lessP :: PN -> PN -> Bool
lessP I I = False
lessP I n = True
lessP n I = False
lessP (T n) (T m) = lessP n m

-- subtract a positive number from a natural number
-- use recursion over NN
subtrNP :: NN -> PN -> NN
subtrNP O n = O
subtrNP (S n) I = subtr (S n) (S O)
subtrNP (S n) (T m) = subtrNP n m

-- divide a natural number by a positive number
-- use recursion over NN
-- anything divided by 1 is itself
-- dividing by same thing gives 1
    -- otherwise, same as divi
divP :: NN -> PN -> NN
divP O n = O
divP n I = n
divP (S n) (T m) =
    if less (S n) (p2n (T m))
        then O
        else
            if (S n) == (p2n (T m))
                then (S O)
            else
                divP (subtrNP n m) m

-- convert from PN to NN
-- use recursion over PN
p2n :: PN -> NN
p2n I = (S O)
p2n (T m) = S(p2n m)

-- convert from NN to PN
-- use recursion over NN
-- allow runtime error if NN is O
n2p :: NN -> PN
n2p O = undefined
n2p (S O) = I
n2p (S n) = T (n2p n)

------------
-- FRACTIONS
------------

-- non-negative fractions
-- a fraction is a pair (numerator,denominator)
type Frac = (NN,PN)

-- multiply fractions
-- recall from school how to multiply fractions
-- multiply numerators and multiply denominators
multF :: Frac -> Frac -> Frac
multF x y = (mult (fst x) (fst y), multP (snd x) (snd y))

-- add fractions
-- recall from school how to add fractions
-- make denominators same, add numerators
addF :: Frac -> Frac -> Frac
addF x y =
    if snd x == snd y
        then (add (fst x) (fst y), snd x)
        else
            (add (mult (fst x) (p2n (snd y))) (mult (fst y) (p2n (snd x))), 
            multP (snd x) (snd y))



-- equality of fractions
-- recall from school how to check that two fractions are equal
-- cross multiply and check for equality
equalF :: Frac -> Frac -> Bool
equalF x y = 
    if mult (fst x) (p2n (snd y)) == mult (p2n (snd x)) (fst y)
        then True
        else 
            False

-- simplify fractions
-- divide numerator and denominator by the gcd of both
-- gcd returns a NN
-- convert to PN for snd x 
simplifyF :: Frac -> Frac
simplifyF x = (divi (fst x) (gcdN (fst x) (p2n (snd x))),
               n2p (divi (p2n (snd x)) (gcdN (fst x) (p2n (snd x)))))

-- --------------
-- -- FOR TESTING
-- --------------

-- use recursion on NN
nn2int :: NN -> Int
nn2int O = 0
nn2int (S n) = 1 + nn2int n

-- use recursion on Int
-- allow runtime error for negative numbers
-- base case of O and S O, then recursively call int2nn
--      prepend S each recursive call
int2nn :: Int -> NN
int2nn 0 = O
int2nn 1 = (S O)
int2nn n = (S (int2nn (n-1)))

-- use recursion on Int
-- allow runtime error for non-positive numbers
-- same implementation as int2nn, excluding case of 0
int2pn :: Int -> PN
int2pn 1 = I
int2pn 2 = (T I)
int2pn p = (T (int2pn (p-1))) 

-- -- use int2nn and int2pn
ints2frac :: (Int,Int) -> Frac
ints2frac (n,p) = (int2nn n, int2pn p)

-- -- use nn2int 
frac2ints :: Frac -> (Int,Int)
frac2ints x = (nn2int (fst x), nn2int(p2n(snd x)))

-- Some examples (make your own):
-- add (int2nn 2) (int2nn 3)
-- addP (int2pn 2) (int2pn 3)
-- frac2ints (addF (ints2frac(1,2)) (ints2frac(3,4)))
-- frac2ints (simplifyF(addF (ints2frac(1,2)) (ints2frac(3,4))))
-- frac2ints (simplifyF(multF (ints2frac(1,2)) (ints2frac(3,4))))
-- equalF (ints2frac(1,2)) (ints2frac(4,8))
-- nn2int (subtrNP (int2nn 5) (int2pn 4))
-- nn2int (gcdN (int2nn 10) (int2nn 5))
-- nn2int (divi (int2nn 100) (int2nn 100))
-- nn2int (divP (int2nn 2) (int2pn 2))
