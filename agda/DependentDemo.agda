module DependentDemo where

infixl 6 _+_
infixr 5 _::_
infix  4 _==_

data Nat : Set where
  zero : Nat
  suc  : Nat -> Nat

_+_ : Nat -> Nat -> Nat
zero  + n = n
suc m + n = suc (m + n)

data Vec (A : Set) : Nat -> Set where
  []   : Vec A zero
  _::_ : {n : Nat} -> A -> Vec A n -> Vec A (suc n)

append : {A : Set} {m n : Nat} ->
         Vec A m -> Vec A n -> Vec A (m + n)
append [] ys = ys
append (x :: xs) ys = x :: append xs ys

head : {A : Set} {n : Nat} -> Vec A (suc n) -> A
head (x :: xs) = x

data _==_ {A : Set} (x : A) : A -> Set where
  refl : x == x

one : Nat
one = suc zero

two : Nat
two = suc one

ex1 : Vec Nat two
ex1 = one :: two :: []

ex2 : append ex1 ex1 == one :: two :: one :: two :: []
ex2 = refl

ex3 : head ex1 == one
ex3 = refl
