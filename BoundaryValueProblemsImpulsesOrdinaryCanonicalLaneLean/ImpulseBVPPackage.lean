import BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ImpulseBVPPackage where
  odeSystem : Type
  impulseTimes : List ℝ
  impulseMaps : Type
  boundaryCondition : Prop
  solutionSpace : Type
  existenceResult : Prop
  uniquenessResult : Prop
  continuousDependence : Prop

structure ImpulseBVPEvidence (P : ImpulseBVPPackage) where
  existenceResultClosed : P.existenceResult
  uniquenessResultClosed : P.uniquenessResult
  continuousDependenceClosed : P.continuousDependence

def ImpulseBVPClosed (P : ImpulseBVPPackage) : Prop :=
  P.existenceResult ∧ P.uniquenessResult ∧ P.continuousDependence

theorem impulse_bvp_closed_from_evidence (P : ImpulseBVPPackage) (E : ImpulseBVPEvidence P) :
    ImpulseBVPClosed P := by
  exact And.intro E.existenceResultClosed (And.intro E.uniquenessResultClosed E.continuousDependenceClosed)

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse