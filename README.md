# Introduction to Lambda Calculus and Types

Lecture notes and slides for a short course on lambda calculus and simple type theories. Each session is designed as a three-hour lecture with in-class exercises. The fourth session is an optional advanced session.

## Sessions

1. Untyped lambda calculus, Part I: syntax, alpha-equivalence, substitution, beta-reduction, and beta-equality.
2. Untyped lambda calculus, Part II: Church encodings, recursion, evaluation strategies, normalisation, and confluence.
3. Simply typed lambda calculus: typing, typed programming, type safety, and strong normalisation.
4. Advanced optional session: polymorphic lambda calculus, System F encodings, logical relations, parametricity, and free theorems.

## Requirements

* XeLaTeX
* latexmk
* pdfjam, for combined note handouts
* Fira Sans Font, optional

## Compilation

To compile the regular sessions, run

```sh
make
```

To compile a specific regular session, run for example

```sh
make lecture1
```

To compile note handouts for the regular sessions, run

```sh
make note
```

Generated PDFs are copied to `pdf/`.
