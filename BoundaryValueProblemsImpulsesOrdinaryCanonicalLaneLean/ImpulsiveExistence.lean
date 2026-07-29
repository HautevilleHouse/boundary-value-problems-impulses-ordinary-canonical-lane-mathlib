import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ImpulsiveExistencePackage where
  initialCondition : Prop
  impulsiveJumpCondition : Prop
  solutionOverInterval : Prop
  endpointMatch : Prop

structure ImpulsiveExistenceEvidence (P : ImpulsiveExistencePackage) where
  initialConditionClosed : P.initialCondition
  impulsiveJumpConditionClosed : P.impulsiveJumpCondition
  solutionOverIntervalClosed : P.solutionOverInterval
  endpointMatchClosed : P.endpointMatch

def ImpulsiveExistenceClosed (P : ImpulsiveExistencePackage) : Prop :=
  P.initialCondition ∧ P.impulsiveJumpCondition ∧ P.solutionOverInterval ∧ P.endpointMatch

theorem impulsive_existence_closed_from_evidence (P : ImpulsiveExistencePackage)
    (E : ImpulsiveExistenceEvidence P) : ImpulsiveExistenceClosed P := by
  exact And.intro E.initialConditionClosed
    (And.intro E.impulsiveJumpConditionClosed
      (And.intro E.solutionOverIntervalClosed E.endpointMatchClosed))

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse