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

-- Initial: top-level disjunction. Player picks left (Z) or right ((A∨B) → B∨A).
VisualGoalInfoOnGoal above false "Z ∨ ((A ∨ B) → B ∨ A)" show
  "Click goals of the form $A ∨ B$ to choose whether to prove the left side, or the right side."

-- Dead end: picked Z. There is no proof of Z available.
VisualGoalInfoOnGoal above true "Z" show
  "You've made an incorrect assumption: this is a dead end. Use the undo button to go back."

-- Dead end: split `B ∨ A` (the goal) before splitting the `A ∨ B` hypothesis,
-- so the player committed to one side without knowing which one is reachable.
VisualGoalInfoOnGoalWithHyp above true "A" "A ∨ B" show
  "You've reached a dead end! Use the undo button to go back."
VisualGoalInfoOnGoalWithHyp above true "B" "A ∨ B" show
  "You've reached a dead end! Use the undo button to go back."

-- After picking the right side and introducing the implication, an `A ∨ B`
-- hypothesis is available and the goal is `B ∨ A`. Hint to split the hyp.
VisualGoalInfoOnGoalWithHyp above false "B ∨ A" "A ∨ B" show
  "Click hypotheses of the form $A ∨ B$ to split into two proof streams: one where you assume $A$ and one where you assume $B$."
