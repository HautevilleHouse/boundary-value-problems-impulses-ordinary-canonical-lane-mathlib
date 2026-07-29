import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinary

structure ImpulsiveSobolevSpace (A : AdmissibleClass) where
  jumpCondition : Prop
  weakDerivative : Prop
  compatibility : Prop
  jumpConditionClosed : jumpCondition
  weakDerivativeClosed : weakDerivative
  compatibilityClosed : compatibility

def ImpulsiveSobolevSpaceClosed (A : AdmissibleClass) (W : ImpulsiveSobolevSpace A) : Prop :=
  W.jumpCondition ∧ W.weakDerivative ∧ W.compatibility

theorem impulsive_sobolev_space_closed_from_evidence
    (A : AdmissibleClass) (W : ImpulsiveSobolevSpace A)
    (h1 : W.jumpCondition) (h2 : W.weakDerivative) (h3 : W.compatibility) :
    ImpulsiveSobolevSpaceClosed A W := by
  exact And.intro h1 (And.intro h2 h3)

end BoundaryValueProblemsImpulsesOrdinary
end HautevilleHouse