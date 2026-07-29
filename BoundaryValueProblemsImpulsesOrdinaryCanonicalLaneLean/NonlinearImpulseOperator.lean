import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinary

structure NonlinearImpulseOperator (A : AdmissibleClass) where
  operator : Type u
  monotonicity : Prop
  boundedness : Prop
  monotonicityClosed : monotonicity
  boundednessClosed : boundedness

def NonlinearImpulseOperatorClosed (A : AdmissibleClass) (N : NonlinearImpulseOperator A) : Prop :=
  N.monotonicity ∧ N.boundedness

theorem nonlinear_impulse_operator_closed_from_evidence
    (A : AdmissibleClass) (N : NonlinearImpulseOperator A)
    (h1 : N.monotonicity) (h2 : N.boundedness) :
    NonlinearImpulseOperatorClosed A N := by
  exact And.intro h1 h2

end BoundaryValueProblemsImpulsesOrdinary
end HautevilleHouse