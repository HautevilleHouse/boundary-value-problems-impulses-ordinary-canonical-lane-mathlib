import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinary

structure VariationalFormulation (A : AdmissibleClass) where
  energyFunctional : Type u
  coercivity : Prop
  weakLowerSemicontinuity : Prop
  coercivityClosed : coercivity
  weakLowerSemicontinuityClosed : weakLowerSemicontinuity

def VariationalFormulationClosed (A : AdmissibleClass) (V : VariationalFormulation A) : Prop :=
  V.coercivity ∧ V.weakLowerSemicontinuity

theorem variational_formulation_closed_from_evidence
    (A : AdmissibleClass) (V : VariationalFormulation A)
    (h1 : V.coercivity) (h2 : V.weakLowerSemicontinuity) :
    VariationalFormulationClosed A V := by
  exact And.intro h1 h2

end BoundaryValueProblemsImpulsesOrdinary
end HautevilleHouse