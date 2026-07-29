import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean.BVPSolver

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure StabilityAnalysisPackage {M : ImpulseModelPackage}
    {E : ExistenceUniquenessPackage M} {S : BVPSolverPackage M E} where
  lyapunovStability : Prop
  asymptoticStability : Prop
  impulseRobustness : Prop

structure StabilityAnalysisEvidence {M : ImpulseModelPackage}
    {E : ExistenceUniquenessPackage M} {S : BVPSolverPackage M E}
    (St : StabilityAnalysisPackage M E S) where
  lyapunovStabilityClosed : St.lyapunovStability
  asymptoticStabilityClosed : St.asymptoticStability
  impulseRobustnessClosed : St.impulseRobustness

def StabilityAnalysisClosed {M : ImpulseModelPackage}
    {E : ExistenceUniquenessPackage M} {S : BVPSolverPackage M E}
    (St : StabilityAnalysisPackage M E S) : Prop :=
  St.lyapunovStability ∧ St.asymptoticStability ∧ St.impulseRobustness

theorem stability_analysis_closed_from_evidence
    {M : ImpulseModelPackage} {E : ExistenceUniquenessPackage M}
    {S : BVPSolverPackage M E} (St : StabilityAnalysisPackage M E S)
    (Ev : StabilityAnalysisEvidence St) : StabilityAnalysisClosed St := by
  exact And.intro Ev.lyapunovStabilityClosed
    (And.intro Ev.asymptoticStabilityClosed Ev.impulseRobustnessClosed)

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse