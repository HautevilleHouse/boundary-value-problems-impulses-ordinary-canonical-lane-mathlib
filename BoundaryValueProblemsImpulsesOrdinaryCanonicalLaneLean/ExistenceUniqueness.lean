import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ExistenceUniquenessPackage
    {S : ImpulseConditionSolver} where
  existence : Prop
  uniqueness : Prop
  continuousDependence : Prop
  existenceTerm : existence
  uniquenessTerm : uniqueness
  continuousDependenceTerm : continuousDependence

structure ExistenceUniquenessEvidence
    {S : ImpulseConditionSolver} (E : ExistenceUniquenessPackage S) where
  existenceClosed : E.existence
  uniquenessClosed : E.uniqueness
  continuousDependenceClosed : E.continuousDependence

def ExistenceUniquenessClosed
    {S : ImpulseConditionSolver} (E : ExistenceUniquenessPackage S) : Prop :=
  E.existence ∧ E.uniqueness ∧ E.continuousDependence

theorem existence_uniqueness_closed_from_evidence
    {S : ImpulseConditionSolver} (E : ExistenceUniquenessPackage S)
    (Ev : ExistenceUniquenessEvidence E) : ExistenceUniquenessClosed E := by
  exact And.intro Ev.existenceClosed (And.intro Ev.uniquenessClosed Ev.continuousDependenceClosed)

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse