import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean.ExistenceUniqueness

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure BVPSolverPackage {M : ImpulseModelPackage}
    {E : ExistenceUniquenessPackage M} where
  shootingMethod : Prop
  collocationMethod : Prop
  impulseAwareSolver : Prop
  solverConvergence : Prop

structure BVPSolverEvidence {M : ImpulseModelPackage}
    {E : ExistenceUniquenessPackage M} (S : BVPSolverPackage M E) where
  shootingMethodClosed : S.shootingMethod
  collocationMethodClosed : S.collocationMethod
  impulseAwareSolverClosed : S.impulseAwareSolver
  solverConvergenceClosed : S.solverConvergence

def BVPSolverClosed {M : ImpulseModelPackage}
    {E : ExistenceUniquenessPackage M} (S : BVPSolverPackage M E) : Prop :=
  S.shootingMethod ∧ S.collocationMethod ∧ S.impulseAwareSolver ∧ S.solverConvergence

theorem bvp_solver_closed_from_evidence
    {M : ImpulseModelPackage} {E : ExistenceUniquenessPackage M}
    (S : BVPSolverPackage M E) (Ev : BVPSolverEvidence S) : BVPSolverClosed S := by
  exact And.intro Ev.shootingMethodClosed
    (And.intro Ev.collocationMethodClosed
      (And.intro Ev.impulseAwareSolverClosed Ev.solverConvergenceClosed))

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse