import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure BVPSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure BVPIAdmittedObject where
  space : BVPSpace
  boundaryCondition : Prop
  impulsiveEffect : Prop
  solutionExists : Prop
  conclusion : solutionExists

structure BVPEndgameState where
  object : BVPIAdmittedObject

def BVPWitnessClosed (O : BVPIAdmittedObject) : Prop :=
  O.solutionExists

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse