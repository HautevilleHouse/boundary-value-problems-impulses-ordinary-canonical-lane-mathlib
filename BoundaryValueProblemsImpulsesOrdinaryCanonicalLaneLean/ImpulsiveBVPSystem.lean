import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ImpulsiveBVPSystemPackage where
  interval : ℝ × ℝ
  impulseTimes : List ℝ
  stateDimension : ℕ
  rightHandSide : ℝ × ℝ ^ stateDimension → ℝ ^ stateDimension
  impulseMap : ℝ × ℝ ^ stateDimension → ℝ ^ stateDimension
  solutionDefined : Prop
  existenceProof : solutionDefined
  uniquenessProof : Prop

structure ImpulsiveBVPSystemEvidence (P : ImpulsiveBVPSystemPackage) where
  existenceClosed : P.solutionDefined
  uniquenessClosed : P.uniquenessProof

def ImpulsiveBVPSystemClosed (P : ImpulsiveBVPSystemPackage) : Prop :=
  P.solutionDefined ∧ P.uniquenessProof

theorem impulsive_bvp_system_closed_from_evidence
    (P : ImpulsiveBVPSystemPackage) (E : ImpulsiveBVPSystemEvidence P) :
    ImpulsiveBVPSystemClosed P := by
  exact And.intro E.existenceClosed E.uniquenessClosed

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse