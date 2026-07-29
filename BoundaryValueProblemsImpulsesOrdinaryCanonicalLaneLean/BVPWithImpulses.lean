import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ImpulsiveBVPPackage where
  stateSpace : Type u
  stateTopology : TopologicalSpace stateSpace
  timeDomain : Set ℝ
  impulseTimes : Set ℝ
  differentialEquation : stateSpace → ℝ → stateSpace → Prop
  impulseMapping : stateSpace → stateSpace → Prop
  boundaryCondition : (stateSpace → Prop) → Prop
  solutionExistence : Prop
  solutionUniqueness : Prop
  continuousDependence : Prop

structure ImpulsiveBVPEvidence (P : ImpulsiveBVPPackage) where
  solutionExistenceClosed : P.solutionExistence
  solutionUniquenessClosed : P.solutionUniqueness
  continuousDependenceClosed : P.continuousDependence

def ImpulsiveBVPClosed (P : ImpulsiveBVPPackage) : Prop :=
  P.solutionExistence ∧ P.solutionUniqueness ∧ P.continuousDependence

theorem impulsive_bvp_closed_from_evidence
    (P : ImpulsiveBVPPackage) (E : ImpulsiveBVPEvidence P) : ImpulsiveBVPClosed P := by
  exact And.intro E.solutionExistenceClosed
    (And.intro E.solutionUniquenessClosed E.continuousDependenceClosed)

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse