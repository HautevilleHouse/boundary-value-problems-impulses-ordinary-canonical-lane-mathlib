import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinary

structure BVPHilbertSpace (A : AdmissibleClass) where
  impulseNorm : Prop
  stateSpace : Type u
  innerProduct : stateSpace → stateSpace → ℝ
  impulseNormClosed : impulseNorm

def BVPHilbertSpaceClosed (A : AdmissibleClass) (H : BVPHilbertSpace A) : Prop :=
  H.impulseNorm

theorem bvp_hilbert_space_closed_from_evidence
    (A : AdmissibleClass) (H : BVPHilbertSpace A) (h : H.impulseNorm) :
    BVPHilbertSpaceClosed A H := by
  exact h

end BoundaryValueProblemsImpulsesOrdinary
end HautevilleHouse