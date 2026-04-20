import Game.Metadata

World "Prototype"
Level 4

Title "Rewrite Equality"

Introduction
"
This is the Lean version of the prototype stage

`x = y + 1 => 5 + 5 * y = x * 5`
"

Statement (x y : Nat) : x = y + 1 -> 5 + 5 * y = x * 5 := by
  exact fun h => by
    rw [h]
    rw [<- Nat.mul_one 5]
    rw [<- Nat.mul_add 5 1 y]
    rw [Nat.add_comm 1 y]
    rw [Nat.mul_comm 5 (y + 1)]

Conclusion
"
Stage 4 keeps the arithmetic rewrite goal even though full visual support comes later.
"

NewTactic rw
NewTheorem Nat.mul_one Nat.mul_add Nat.add_comm Nat.mul_comm
