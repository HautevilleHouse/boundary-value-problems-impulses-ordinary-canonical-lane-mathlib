import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ImpulseSystem where
  stateDimension : Nat
  impulseTimes : List ℝ
  impulseMap : ℝ → (ℝ ^ stateDimension) → (ℝ ^ stateDimension)
  flowMap : ℝ → (ℝ ^ stateDimension) → (ℝ ^ stateDimension)
  smoothness : Prop
  impulseSmoothness : Prop
  flowSmoothness : Prop

structure ImpulseSystemEvidence (S : ImpulseSystem) where
  smoothnessClosed : S.smoothness
  impulseSmoothnessClosed : S.impulseSmoothness
  flowSmoothnessClosed : S.flowSmoothness

def ImpulseSystemClosed (S : ImpulseSystem) : Prop :=
  S.smoothness ∧ S.impulseSmoothness ∧ S.flowSmoothness

theorem impulse_system_closed_from_evidence (S : ImpulseSystem) (E : ImpulseSystemEvidence S) : ImpulseSystemClosed S := by
  exact And.intro E.smoothnessClosed (And.intro E.impulseSmoothnessClosed E.flowSmoothnessClosed)

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse