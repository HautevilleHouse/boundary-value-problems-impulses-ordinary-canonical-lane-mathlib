import BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean.ExistenceUniqueness

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure StabilityResultPackage {I : ImpulseConditionPackage}
    {B : BoundaryConditionPackage} {C : ImpulseConditionClosed I} {D : BoundaryConditionClosed B}
    {EUP : ExistenceUniquenessPackage C D} (EU : ExistenceUniquenessClosed EUP) where
  lyapunovStability : Prop
  asymptoticStability : Prop
  robustnessToPerturbations : Prop

structure StabilityResultEvidence {I : ImpulseConditionPackage}
    {B : BoundaryConditionPackage} {C : ImpulseConditionClosed I} {D : BoundaryConditionClosed B}
    {EUP : ExistenceUniquenessPackage C D} {EU : ExistenceUniquenessClosed EUP}
    (S : StabilityResultPackage EU) where
  lyapunovStabilityClosed : S.lyapunovStability
  asymptoticStabilityClosed : S.asymptoticStability
  robustnessToPerturbationsClosed : S.robustnessToPerturbations

def StabilityResultClosed {I : ImpulseConditionPackage}
    {B : BoundaryConditionPackage} {C : ImpulseConditionClosed I} {D : BoundaryConditionClosed B}
    {EUP : ExistenceUniquenessPackage C D} {EU : ExistenceUniquenessClosed EUP}
    (S : StabilityResultPackage EU) : Prop :=
  S.lyapunovStability ∧ S.asymptoticStability ∧ S.robustnessToPerturbations

theorem stability_result_closed_from_evidence {I : ImpulseConditionPackage}
    {B : BoundaryConditionPackage} {C : ImpulseConditionClosed I} {D : BoundaryConditionClosed B}
    {EUP : ExistenceUniquenessPackage C D} {EU : ExistenceUniquenessClosed EUP}
    (S : StabilityResultPackage EU)
    (E : StabilityResultEvidence S) : StabilityResultClosed S := by
  exact And.intro E.lyapunovStabilityClosed
    (And.intro E.asymptoticStabilityClosed E.robustnessToPerturbationsClosed)

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse