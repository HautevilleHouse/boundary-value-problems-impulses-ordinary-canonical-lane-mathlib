import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean.ImpulsiveBVPSystem

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ImpulsiveStabilityPackage {P : ImpulsiveBVPSystemPackage} where
  lyapunovFunction : ℝ ^ P.stateDimension → ℝ
  derivativeCondition : Prop
  impulseCondition : Prop
  stabilityConclusion : Prop

structure ImpulsiveStabilityEvidence {P : ImpulsiveBVPSystemPackage}
    (S : ImpulsiveStabilityPackage P) where
  derivativeConditionClosed : S.derivativeCondition
  impulseConditionClosed : S.impulseCondition
  stabilityConclusionClosed : S.stabilityConclusion

def ImpulsiveStabilityClosed {P : ImpulsiveBVPSystemPackage}
    (S : ImpulsiveStabilityPackage P) : Prop :=
  S.derivativeCondition ∧ S.impulseCondition ∧ S.stabilityConclusion

theorem impulsive_stability_closed_from_evidence
    {P : ImpulsiveBVPSystemPackage} (S : ImpulsiveStabilityPackage P)
    (E : ImpulsiveStabilityEvidence S) : ImpulsiveStabilityClosed S := by
  exact And.intro E.derivativeConditionClosed
    (And.intro E.impulseConditionClosed E.stabilityConclusionClosed)

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse