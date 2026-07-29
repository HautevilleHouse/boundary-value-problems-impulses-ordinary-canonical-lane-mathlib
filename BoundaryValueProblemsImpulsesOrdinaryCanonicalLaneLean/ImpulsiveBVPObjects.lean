import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ImpulsiveBVPSystem where
  stateSpace : Type u
  timeInterval : Set ℝ
  impulseTimes : List ℝ
  impulseTimesSorted : impulseTimes.Sorted (· ≤ ·)
  vectorField : ℝ → stateSpace → stateSpace
  impulseMaps : stateSpace → stateSpace
  boundaryCondition : stateSpace → stateSpace → Prop

def impulseTimesDisjoint (sys : ImpulsiveBVPSystem) : Prop :=
  List.Pairwise (· ≠ ·) sys.impulseTimes

structure ImpulsiveBVPSolution (sys : ImpulsiveBVPSystem) where
  function : ℝ → sys.stateSpace
  diffOnIntervals : ∀ t ∉ {t | t ∈ sys.impulseTimes}, DifferentiableAt ℝ function t
  satisfiesODE : ∀ t, function t ∉ {x | True} → derivative ℝ function t = sys.vectorField t (function t)
  jumpAtImpulses : ∀ t ∈ sys.impulseTimes, function (t + 0) - function (t - 0) = sys.impulseMaps (function (t - 0))
  boundaryConditionSatisfied : sys.boundaryCondition (function 0) (function (Sup sys.timeInterval))

structure AdmissibleClass where
  system : ImpulsiveBVPSystem
  solution : ImpulsiveBVPSolution system
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse