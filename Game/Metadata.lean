import GameServer

/-- Close the current goal by providing a term of exactly the required type. -/
TacticDoc exact

/-- Rewrite the goal using an equality or equivalence. -/
TacticDoc rw

TheoremDoc Nat.mul_one as "mul_one" in "*"

TheoremDoc Nat.mul_add as "mul_add" in "*"

TheoremDoc Nat.add_comm as "add_comm" in "+"

TheoremDoc Nat.mul_comm as "mul_comm" in "*"

/-- `add_zero a` is a proof that `a + 0 = a`. -/
TheoremDoc Nat.add_zero as "add_zero" in "+"
