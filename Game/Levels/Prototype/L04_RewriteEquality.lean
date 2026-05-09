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

-- Combining mode: equality goal has been introduced (`h : x = y + 1` is in scope).
-- Suggest entering transformation mode by double-clicking the equality.
VisualGoalInfoOnGoal above false "5 + 5 * y = x * 5" show
  "Double-click goals or hypotheses of the form $a = b$ to enter transformation mode."

-- Transformation mode: arrow from rule card `h` to the `x` subterm in the goal.
VisualTransformRewriteInfoOnGoal h "x" "5 + 5 * y = x * 5" show
  "Here, you can make known substitutions. \n Try dragging in $h$ to plug in for $x$."

-- Transformation mode (sides not yet matching): after the player has begun
-- rewriting the goal but the two sides of the equality are still different,
-- nudge them to keep going. No arrow — generic status text only.
VisualTransformInfoOnGoal "5 + 5 * y = (y + 1) * 5" show
  "To fulfill the goal, you must make both sides of the equality match exactly."

-- Transformation mode (sides match): both sides identical. Point at the
-- back button so the player knows where to leave for combining mode.
VisualTransformBackInfoOnGoal "(y + 1) * 5 = (y + 1) * 5" show
  "Now that both sides of the equality match, return to combining mode and click the goal to solve it with reflection."
