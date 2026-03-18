import Game.Metadata

World "Prototype"
Level 2

Title "Nested Conjunction"

Introduction
"
This is the Lean version of the prototype stage

`A => (B and (A => (B => C))) => ((A and B) and C)`
"

Statement (A B C : Prop) : A -> And B (A -> B -> C) -> And (And A B) C := by
  exact fun hA h =>
    And.intro (And.intro hA h.left) (h.right hA h.left)

Conclusion
"
Stage 2 keeps the original conjunction structure, but now in Lean syntax.
"
