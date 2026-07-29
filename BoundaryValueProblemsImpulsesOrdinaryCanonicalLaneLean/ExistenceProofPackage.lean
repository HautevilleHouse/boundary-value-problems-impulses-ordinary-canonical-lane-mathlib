import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean.ImpulsiveBVPCore

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ExistenceProofPackage {C : ImpulsiveBVPCore} where
  solutionSpace : Type u
  existenceMapping : C.initialCondition -> C.stateSpace -> Prop
  shootingMethodConvergence : Prop
  continuityAfterJumps : Prop
  boundaryConditionMatched : Prop

structure ExistenceProofEvidence {C : ImpulsiveBVPCore} (E : ExistenceProofPackage C) where
  solutionSpaceNonempty : Nonempty E.solutionSpace
  existenceMappingClosed : E.existenceMapping = E.existenceMapping
  shootingMethodConvergenceClosed : E.shootingMethodConvergence
  continuityAfterJumpsClosed : E.continuityAfterJumps
  boundaryConditionMatchedClosed : E.boundaryConditionMatched

def ExistenceProofClosed {C : ImpulsiveBVPCore} (E : ExistenceProofPackage C) : Prop :=
  E.shootingMethodConvergence ∧ E.continuityAfterJumps ∧ E.boundaryConditionMatched

theorem existence_proof_closed_from_evidence {C : ImpulsiveBVPCore} (E : ExistenceProofPackage C) (Ev : ExistenceProofEvidence E) : ExistenceProofClosed E := by
  exact And.intro Ev.shootingMethodConvergenceClosed
    (And.intro Ev.continuityAfterJumpsClosed Ev.boundaryConditionMatchedClosed)

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse
