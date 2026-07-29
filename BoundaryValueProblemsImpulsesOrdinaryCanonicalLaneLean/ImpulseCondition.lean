import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ImpulseConditionPackage where
  impulseTimes : List ℝ
  stateJump : (ℝ → ℝ) → ℝ
  jumpMagnitude : ℝ → Prop
  continuityAfterJump : Prop
  jumpConditionSatisfied : Prop

structure ImpulseConditionEvidence (I : ImpulseConditionPackage) where
  continuityAfterJumpClosed : I.continuityAfterJump
  jumpConditionSatisfiedClosed : I.jumpConditionSatisfied

def ImpulseConditionClosed (I : ImpulseConditionPackage) : Prop :=
  I.continuityAfterJump ∧ I.jumpConditionSatisfied

theorem impulse_condition_closed_from_evidence (I : ImpulseConditionPackage)
    (E : ImpulseConditionEvidence I) : ImpulseConditionClosed I := by
  exact And.intro E.continuityAfterJumpClosed E.jumpConditionSatisfiedClosed

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse