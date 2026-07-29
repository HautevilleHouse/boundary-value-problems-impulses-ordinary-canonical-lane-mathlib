import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure GreenFunction where
  impulseModel : ImpulseModel
  boundary : BoundaryCondition
  kernel : ℝ × ℝ → ℝ
  impulseResponse : ℝ → ℝ

define GreenAdmissible (G : GreenFunction) : Prop :=
  (∀ s : ℝ, G.kernel (·, s) satisfiesODE) ∧ (∀ t : ℝ, G.kernel (t, ·) satisfiesBoundary)

structure GreenFunctionEvidence (G : GreenFunction) where
  admissible : GreenAdmissible G
  representation : ∀ (f : ℝ → ℝ), SolutionSpace.solutionFunction f = ∫ s, G.kernel (·, s) * G.impulseResponse s ds

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse