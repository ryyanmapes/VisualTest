import Game.Metadata

World "Prototype"
Level 3

Title "Disjunction Swap"

Introduction
"
This is the Lean version of the prototype stage

`Z \\lor ((A \\lor B) => (B \\lor A))`
"

Statement (A B Z : Prop) : Or Z ((Or A B) -> Or B A) := by
  exact Or.inr (fun h => Or.elim h Or.inr Or.inl)

Conclusion
"
Stage 3 preserves the original disjunction-heavy goal from the prototype.
"
