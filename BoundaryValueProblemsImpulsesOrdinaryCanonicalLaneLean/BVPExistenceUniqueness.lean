import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinary

structure BVPExistenceUniqueness (A : AdmissibleClass) where
  existence : Prop
  uniqueness : Prop
  existenceClosed : existence
  uniquenessClosed : uniqueness

def BVPExistenceUniquenessClosed (A : AdmissibleClass) (E : BVPExistenceUniqueness A) : Prop :=
  E.existence ∧ E.uniqueness

theorem bvp_existence_uniqueness_closed_from_evidence
    (A : AdmissibleClass) (E : BVPExistenceUniqueness A)
    (h1 : E.existence) (h2 : E.uniqueness) :
    BVPExistenceUniquenessClosed A E := by
  exact And.intro h1 h2

end BoundaryValueProblemsImpulsesOrdinary
end HautevilleHouse