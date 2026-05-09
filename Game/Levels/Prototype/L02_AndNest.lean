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

-- Stage 1 & 2: still introducing assumptions.
VisualGoalInfoOnGoal above false "A → B ∧ (A → B → C) → (A ∧ B) ∧ C" show
  "Click twice to introduce your assumptions."
VisualGoalInfoOnGoal above false "B ∧ (A → B → C) → (A ∧ B) ∧ C" show
  "Click twice to introduce your assumptions."

-- Stage 3: both intros done, conjunction goal not yet split.
VisualGoalInfoOnGoal above false "(A ∧ B) ∧ C" show
  "Click goals of the form $A ∧ B$ to split them into two proof goals: one where you must prove $A$ and one where you must prove $B$."

-- Stage 4: after splitting `(A ∧ B) ∧ C`. Either branch shows the same hint.
VisualGoalInfoOnGoal above false "A ∧ B" show
  "You can switch goals with the proof graph. \n Click hypotheses of the form $A ∧ B$ to split them into the hypotheses $A$ and $B$."
VisualGoalInfoOnGoal above false "C" show
  "You can switch goals with the proof graph. \n Click hypotheses of the form $A ∧ B$ to split them into the hypotheses $A$ and $B$."
