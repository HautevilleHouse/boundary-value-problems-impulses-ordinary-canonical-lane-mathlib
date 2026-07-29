import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure ImpulsiveContinuityPackage where
  leftLimit : Prop
  rightLimit : Prop
  jumpMagnitude : Prop
  continuityOnInterval : Prop

structure ImpulsiveContinuityEvidence (P : ImpulsiveContinuityPackage) where
  leftLimitClosed : P.leftLimit
  rightLimitClosed : P.rightLimit
  jumpMagnitudeClosed : P.jumpMagnitude
  continuityOnIntervalClosed : P.continuityOnInterval

def ImpulsiveContinuityClosed (P : ImpulsiveContinuityPackage) : Prop :=
  P.leftLimit ∧ P.rightLimit ∧ P.jumpMagnitude ∧ P.continuityOnInterval

theorem impulsive_continuity_closed_from_evidence (P : ImpulsiveContinuityPackage)
    (E : ImpulsiveContinuityEvidence P) : ImpulsiveContinuityClosed P := by
  exact And.intro E.leftLimitClosed
    (And.intro E.rightLimitClosed
      (And.intro E.jumpMagnitudeClosed E.continuityOnIntervalClosed))

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse