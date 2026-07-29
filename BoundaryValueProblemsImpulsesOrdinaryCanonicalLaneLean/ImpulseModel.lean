import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean.BVPAdmittedObject

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ImpulseModelPackage where
  impulseTimes : List ℝ
  stateEquation : ℝ → ℝ → Prop
  impulseJump : ℝ → ℝ → Prop
  continuousBetweenImpulses : Prop
  jumpCondition : Prop

structure ImpulseModelEvidence (M : ImpulseModelPackage) where
  continuousBetweenImpulsesClosed : M.continuousBetweenImpulses
  jumpConditionClosed : M.jumpCondition

def ImpulseModelClosed (M : ImpulseModelPackage) : Prop :=
  M.continuousBetweenImpulses ∧ M.jumpCondition

theorem impulse_model_closed_from_evidence (M : ImpulseModelPackage)
    (E : ImpulseModelEvidence M) : ImpulseModelClosed M := by
  exact And.intro E.continuousBetweenImpulsesClosed E.jumpConditionClosed

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse