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

-------------------
-- POSITIVE NUMBERS
-------------------

data PN = I | T PN
    deriving (Eq,Show)

-- addition of positive numbers
-- use recursion over PN
addP :: PN -> PN -> PN

-- multiplication of positive numbers
-- use recursion over PN
multP :: PN -> PN -> PN

-- lessP n m if n < m
-- use recursion over PN
lessP :: PN -> PN -> Bool

-- subtract a positive number from a natural number
-- use recursion over NN
subtrNP :: NN -> PN -> NN

-- divide a natural number by a positive number
-- use recursion over NN
divP :: NN -> PN -> NN

-- convert from PN to NN
-- use recursion over PN
p2n :: PN -> NN

-- convert from NN to PN
-- use recursion over NN
-- allow runtime error if NN is O
n2p :: NN ->PN

------------
-- FRACTIONS
------------

-- non-negative fractions
-- a fraction is a pair (numerator,denominator)
type Frac = (NN,PN)

-- multiply fractions
-- recall from school how to multiply fractions
multF :: Frac -> Frac -> Frac

-- add fractions
-- recall from school how to add fractions
addF :: Frac -> Frac -> Frac

-- equality of fractions
-- recall from school how to check that two fractions are equal
equalF :: Frac -> Frac -> Bool

-- simplify fractions
-- divide numerator and denominator by the gcd of both
simplifyF :: Frac -> Frac

--------------
-- FOR TESTING
--------------

-- use recursion on NN
nn2int :: NN -> Int

-- use recursion on Int
-- allow runtime error for negative numbers
int2nn :: Int -> NN

-- use recursion on Int
-- allow runtime error for non-positive numbers
int2pn :: Int -> PN

-- use int2nn and int2pn
ints2frac :: (Int,Int) -> Frac
ints2frac (n,p) = (int2nn n, int2pn p)

-- use nn2int 
frac2ints :: Frac -> (Int,Int)
frac2ints x = (nn2int (fst x), nn2int(p2n(snd x)))

-- Some examples (make your own):
-- 
-- frac2ints (addF (ints2frac (2,3)) (ints2frac (6,8)))
-- equalF (ints2frac (2,6)) (ints2frac (1,3))
-- addF (ints2frac (36,60)) (ints2frac (24,45))
-- simplifyF (addF (ints2frac (36,60)) (ints2frac (24,45)))
-- frac2ints(simplifyF (addF (ints2frac (36,60)) (ints2frac (24,45))))