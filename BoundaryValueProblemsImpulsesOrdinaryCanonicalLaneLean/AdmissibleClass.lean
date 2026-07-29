import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure BVPIOAdmittedObject where
  interval : Type
  leftEndpoint : interval
  rightEndpoint : interval
  impulseTimes : List interval
  odeSystem : Type
  jumpCondition : Prop
  boundaryCondition : Prop
  uniqueSolution : Prop
  conclusion : boundaryCondition ∧ jumpCondition ∧ uniqueSolution

structure AdmissibleClass where
  object : BVPIOAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse