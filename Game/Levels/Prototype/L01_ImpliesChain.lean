import Game.Metadata

World "Prototype"
Level 1

Title "Implication Chain"

Introduction
"
This is the Lean version of the prototype stage

`P => (P => Q) => Q`
"

Statement (P Q : Prop) : P -> (P -> Q) -> Q := by
  exact fun hP hPQ => hPQ hP

Conclusion
"
Stage 1 is now represented as an ordinary Lean level.
"

NewTactic exact
