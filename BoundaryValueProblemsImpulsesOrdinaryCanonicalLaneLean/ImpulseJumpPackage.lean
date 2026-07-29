import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean.ImpulsiveBVPCore

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ImpulseJumpPackage {C : ImpulsiveBVPCore} where
  jumpCondition : C.stateSpace -> C.stateSpace -> Prop
  jumpTimesInduced : List C.timeInterval
  jumpAmplitudeBounds : Prop
  jumpConditionContinuous : Prop
  jumpComposition : Prop

structure ImpulseJumpEvidence {C : ImpulsiveBVPCore} (J : ImpulseJumpPackage C) where
  jumpConditionClosed : J.jumpCondition = J.jumpCondition
  jumpTimesInducedSubset : ∀ t, t ∈ J.jumpTimesInduced → t ∈ C.impulseTimes
  jumpAmplitudeBoundsClosed : J.jumpAmplitudeBounds
  jumpConditionContinuousClosed : J.jumpConditionContinuous
  jumpCompositionClosed : J.jumpComposition

def ImpulseJumpClosed {C : ImpulsiveBVPCore} (J : ImpulseJumpPackage C) : Prop :=
  J.jumpAmplitudeBounds ∧ J.jumpConditionContinuous ∧ J.jumpComposition

theorem impulse_jump_closed_from_evidence {C : ImpulsiveBVPCore} (J : ImpulseJumpPackage C) (E : ImpulseJumpEvidence J) : ImpulseJumpClosed J := by
  exact And.intro E.jumpAmplitudeBoundsClosed
    (And.intro E.jumpConditionContinuousClosed E.jumpCompositionClosed)

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse
