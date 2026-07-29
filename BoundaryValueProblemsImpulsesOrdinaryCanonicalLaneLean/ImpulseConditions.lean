import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ImpulseConditionsPackage where
  impulseTimes : Set ℝ
  stateTransitionFunction : stateSpace → stateSpace
  leftLimitCondition : Prop
  rightLimitCondition : Prop
  jumpCondition : Prop
  timeOrderingCompatible : Prop

structure ImpulseConditionsEvidence (I : ImpulseConditionsPackage) where
  leftLimitConditionClosed : I.leftLimitCondition
  rightLimitConditionClosed : I.rightLimitCondition
  jumpConditionClosed : I.jumpCondition
  timeOrderingCompatibleClosed : I.timeOrderingCompatible

def ImpulseConditionsClosed (I : ImpulseConditionsPackage) : Prop :=
  I.leftLimitCondition ∧ I.rightLimitCondition ∧ I.jumpCondition ∧ I.timeOrderingCompatible

theorem impulse_conditions_closed_from_evidence
    (I : ImpulseConditionsPackage) (E : ImpulseConditionsEvidence I) : ImpulseConditionsClosed I := by
  exact And.intro E.leftLimitConditionClosed
    (And.intro E.rightLimitConditionClosed
      (And.intro E.jumpConditionClosed E.timeOrderingCompatibleClosed))

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse