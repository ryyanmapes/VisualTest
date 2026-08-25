import Game.Metadata

World "Prototype"
Level 5

Title "Existential Witness"

Introduction
"
This extra VisualTest level checks existential construction together with
transformation mode.

`∃ a : ℕ, a + a = a`
"

Statement : ∃ a : Nat, a + a = a := by
  exact ⟨0, by rw [Nat.add_zero]⟩

Conclusion
"
The witness is `0`, and transformation mode now also has access to
`add_zero : ∀ a, a + 0 = a`.
"

NewTheorem Nat.add_zero

-- This exact-goal condition makes the under-goal instruction disappear as
-- soon as the player specializes the existential with a witness.
VisualGoalInfoOnGoal below false "∃ a : ℕ, a + a = a" show
  "Click there-exists goals to specialize them with a particular constructed example"
