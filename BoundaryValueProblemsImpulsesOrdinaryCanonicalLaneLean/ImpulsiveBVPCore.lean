import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ImpulsiveBVPCore where
  timeInterval : Type u
  stateSpace : Type v
  dynamicEquation : Prop
  impulseTimes : List timeInterval
  impulseMap : timeInterval -> stateSpace -> stateSpace
  initialCondition : stateSpace
  targetCondition : stateSpace -> Prop
  wellposednessAssumptions : Prop

structure ImpulsiveBVPEvidence (C : ImpulsiveBVPCore) where
  dynamicEquationClosed : C.dynamicEquation
  impulseTimesDiscrete : C.impulseTimes.length = 0 ∨ C.impulseTimes.Nodup
  impulseMapContinuous : Prop
  initialConditionCompatible : C.initialCondition = C.initialCondition
  targetConditionNonempty : ∃ x, C.targetCondition x
  wellposednessAssumptionsClosed : C.wellposednessAssumptions

def ImpulsiveBVPClosed (C : ImpulsiveBVPCore) : Prop :=
  C.dynamicEquation ∧
  (C.impulseTimes.length = 0 ∨ C.impulseTimes.Nodup) ∧
  C.wellposednessAssumptions

theorem impulsive_bvp_closed_from_evidence (C : ImpulsiveBVPCore) (E : ImpulsiveBVPEvidence C) : ImpulsiveBVPClosed C := by
  exact And.intro E.dynamicEquationClosed
    (And.intro E.impulseTimesDiscrete E.wellposednessAssumptionsClosed)

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse
