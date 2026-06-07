# Lecture 2: in-class unit plan and concrete slide changes

This plan adapts Lecture 2 to a three-hour unit with on-site exercises and no homework. The core target is that students can construct and inspect typing derivations for simply typed lambda calculus and understand type safety at the level of preservation and progress statements.

## Learning objectives

By the end of the unit, students should be able to:

1. read the judgement `Gamma |- t : A` as a statement about a term under a context;
2. construct simple typing derivations using variable, abstraction, and application rules;
3. use typing inversion to analyse a term by its syntax;
4. explain the roles of weakening and substitution in preservation;
5. state preservation and progress in their own words;
6. distinguish core STLC from later extensions such as fixpoints, natural numbers, and booleans.

## Proposed three-hour schedule

| Time | Activity |
| --- | --- |
| 0:00--0:10 | Recap Lecture 1: terms, substitution, beta-reduction |
| 0:10--0:25 | Why types: ruling out unintended applications and self-application |
| 0:25--0:50 | Types, contexts, and the typing judgement |
| 0:50--1:15 | Guided derivation of `lambda x y. x` and paired derivation exercise |
| 1:15--1:25 | Break |
| 1:25--1:50 | Syntax-directedness and typing inversion |
| 1:50--2:20 | Preservation: why substitution is the critical lemma |
| 2:20--2:45 | Progress: normal vs neutral forms as a syntactic characterisation |
| 2:45--3:00 | Exit check and optional preview of extensions |

## Concrete slide edits

1. Add an opening `Unit goals` frame after the title slide. This should make clear that the required core is STLC typing plus type-safety intuition, not all extensions.
2. Keep the motivation slide on adding types, but add one explicit failed example such as `lambda x. x x` and the informal reason it cannot receive a simple type.
3. Move the higher-order function type and context slides earlier as they are prerequisites for reading the typing rules.
4. Add a small worked derivation before the current derivation of `lambda x y. x`:

```text
x : A |- x : A
---------------- abs
|- lambda x. x : A -> A
```

This gives students a one-binder example before the two-binder example.
5. For the exercise deriving
   `|- lambda f g x. f x (g x) : (A -> B -> C) -> (A -> B) -> A -> C`,
   add a derivation skeleton with blanks for the contexts and intermediate types. Without the skeleton, this is too large for many students to complete during class.
6. After `Syntax-directedness`, add a short `How to build a derivation backwards` slide:
   - if the term is a lambda, use `(abs)`;
   - if the term is an application, use `(app)` and infer the argument type;
   - if the term is a variable, look it up in the context.
7. Move `Type inference and checking` later or mark it as optional. It is useful motivation, but it interrupts the path from typing rules to type safety.
8. Move Church encodings of natural numbers and booleans to an optional programming segment. The main no-homework target should be typing derivations and safety, not encoded arithmetic.
9. In the type-safety slide, replace the sentence that combines progress and preservation with a simpler operational statement:
   - preservation: one step keeps the type;
   - progress: a well-typed closed term is either done or can step;
   - together: evaluation does not get stuck.
10. Complete or remove the partial preservation proof slide containing placeholders. If kept, turn it into an exercise with an explicit statement: `Complete the application case`.
11. Reduce normalization content to a brief optional slide. Weak and strong normalization are important but should not be required in the same three-hour unit unless proofs are omitted entirely.
12. Move `fix`, natural numbers, predecessor, and boolean-extension exercises into an optional extension block or a follow-up lecture. They currently compete with preservation/progress for time.
13. Replace the final homework slide with an exit check:
    - derive `|- lambda x. x : A -> A`;
    - explain why `lambda x. x x` is not typable in STLC;
    - identify which lemma is needed for the beta case of preservation;
    - classify a term as normal, neutral, or reducible.

## In-class exercise set

### Exercise 1: basic derivations

Derive the following judgements:

1. `|- lambda x. x : A -> A`;
2. `|- lambda x y. y : A -> B -> B`;
3. `f : A -> B, x : A |- f x : B`.

Suggested timing: 8 minutes individual, 7 minutes guided solution.

### Exercise 2: backward construction

Complete a derivation skeleton for:

```text
|- lambda f g x. f x (g x) : (A -> B -> C) -> (A -> B) -> A -> C
```

Minimum target: identify all intermediate contexts.

Challenge target: write the full proof tree.

Suggested timing: 12 minutes group work, 10 minutes solution.

### Exercise 3: preservation beta case

Given:

```text
Gamma |- (lambda x. t) u : B
```

Use inversion to find types and contexts needed to conclude:

```text
Gamma |- t[u/x] : B
```

Expected answer: the substitution lemma is needed after inversion gives `Gamma, x : A |- t : B` and `Gamma |- u : A`.

### Exercise 4: progress intuition

For each term, decide whether it is neutral, normal, reducible, or ill-typed under the empty context:

1. `lambda x. x`;
2. `(lambda x. x) (lambda y. y)`;
3. `x y`;
4. `lambda x. (lambda y. y) x`.

## Slide-level corrections

1. Fix typo: `Muliplication` should be `Multiplication`.
2. Fix the natural-number syntax bullet: `suc(t)` is a term if `t` is a term.
3. The `ifz` typing rule should be reviewed for argument order and branch naming. The prose says it is like pattern matching, so the rule should visually align the scrutinee, zero branch, and successor branch.
4. Replace `By combing` with `By combining` on the type-safety slide.
5. The preservation proof slide should not end with ellipses in teaching material unless explicitly labelled as an exercise.

## Optional material

The following material is suitable for appendices or a second pass:

- decidability of type checking;
- Church encodings in STLC;
- weak and strong normalization;
- general recursion via `fix`;
- primitive natural numbers and boolean extensions;
- product-type homework.

These are valuable, but they exceed the realistic target for a no-homework three-hour unit.