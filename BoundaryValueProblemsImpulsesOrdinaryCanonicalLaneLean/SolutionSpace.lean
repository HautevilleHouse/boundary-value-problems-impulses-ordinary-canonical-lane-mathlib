import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure SolutionSpace where
  impulseModel : ImpulseModel
  boundary : BoundaryCondition
  solutionFunction : ℝ → ℝ
  satisfiesODE : Prop
  satisfiesBoundary : Prop
  satisfiesImpulse : Prop

define SolutionAdmissible (S : SolutionSpace) : Prop :=
  S.satisfiesODE ∧ S.satisfiesBoundary ∧ S.satisfiesImpulse

structure SolutionSpaceEvidence (S : SolutionSpace) where
  admissible : SolutionAdmissible S
  uniqueSolution : ∀ (f : ℝ → ℝ), SolutionAdmissible (S.mk f) → f = S.solutionFunction

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse