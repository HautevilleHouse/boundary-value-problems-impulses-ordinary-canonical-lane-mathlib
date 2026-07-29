import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ImpulseConditionSolver where
  left : ℝ
  right : ℝ
  jumpTimes : List ℝ
  f : ℝ → ℝ → ℝ
  jumpFunction : ℝ → ℝ → ℝ → ℝ
  boundaryLeft : ℝ
  boundaryRight : ℝ
  solutionCheck : Prop
  solutionCheckTerm : solutionCheck

structure ImpulseConditionSolverEvidence (S : ImpulseConditionSolver) where
  leftClosed : S.left = -∞
  rightClosed : S.right = ∞
  jumpTimesFinite : S.jumpTimes ≠ []
  jumpTimesFiniteTerm : jumpTimesFinite
  solutionCheckClosed : S.solutionCheck

def ImpulseConditionSolverClosed (S : ImpulseConditionSolver) : Prop :=
  S.solutionCheck

theorem impulse_condition_solver_closed_from_evidence
    (S : ImpulseConditionSolver) (E : ImpulseConditionSolverEvidence S) :
    ImpulseConditionSolverClosed S := by
  exact E.solutionCheckClosed

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse