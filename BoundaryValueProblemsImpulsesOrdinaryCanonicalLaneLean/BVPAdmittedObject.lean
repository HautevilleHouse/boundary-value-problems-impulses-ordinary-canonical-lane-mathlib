import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure BVPAdmittedObject where
  impulseTimes : List ℝ
  stateSpace : Type
  initialCondition : Prop
  boundaryCondition : Prop
  impulseEffect : ℝ → ℝ → Prop
  solutionExists : Prop
  conclusion : solutionExists

def BVWitnessClosed (O : BVPAdmittedObject) : Prop :=
  O.solutionExists

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse