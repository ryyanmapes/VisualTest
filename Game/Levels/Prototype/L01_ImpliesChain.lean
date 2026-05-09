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

-- Stage 1 & 2: there are still implications to introduce.
VisualGoalInfoOnGoal above false "P → (P → Q) → Q" show
  "Click the goal to introduce the hypothesis $P$, then the hypothesis $P → Q$."
VisualGoalInfoOnGoal above false "(P → Q) → Q" show
  "Click the goal to introduce the hypothesis $P$, then the hypothesis $P → Q$."

-- Stage 3: both intros done, but no `Q` hypothesis yet.
VisualGoalInfoOnGoalWithoutHyp above false "Q" "Q" show
  "Drag $P$ onto $P → Q$ to yield the hypothesis $Q$."

-- Stage 4: a hypothesis of type `Q` has been produced.
VisualGoalInfoOnGoalWithHyp above false "Q" "Q" show
  "Drag the hypothesis $Q$ onto the goal to solve the level."
