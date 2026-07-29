import canonicalLaneMathlib.AdmissibleClass
import BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean.ImpulseSystem
import BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean.BoundaryCondition

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure SolutionExistencePackage (S : ImpulseSystem) (B : BoundaryCondition S) where
  existenceTheorem : Prop
  uniquenessTheorem : Prop
  continuousDependence : Prop
  regularity : Prop

structure SolutionExistenceEvidence {S : ImpulseSystem} {B : BoundaryCondition S} (P : SolutionExistencePackage S B) where
  existenceClosed : P.existenceTheorem
  uniquenessClosed : P.uniquenessTheorem
  continuousDependenceClosed : P.continuousDependence
  regularityClosed : P.regularity

def SolutionExistenceClosed {S : ImpulseSystem} {B : BoundaryCondition S} (P : SolutionExistencePackage S B) : Prop :=
  P.existenceTheorem ∧ P.uniquenessTheorem ∧ P.continuousDependence ∧ P.regularity

theorem solution_existence_closed_from_evidence {S : ImpulseSystem} {B : BoundaryCondition S} (P : SolutionExistencePackage S B) (E : SolutionExistenceEvidence P) : SolutionExistenceClosed P := by
  exact And.intro E.existenceClosed (And.intro E.uniquenessClosed (And.intro E.continuousDependenceClosed E.regularityClosed))

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse