import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean.ImpulsiveBVPCore

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure BoundaryLayerPackage {C : ImpulsiveBVPCore} where
  boundaryLayerThickness : C.timeInterval -> Prop
  boundaryConditionOverlap : C.targetCondition = C.targetCondition
  lateralBoundaryGrowth : Prop
  boundaryLayerUniform : Prop
  compatibilityWithJumps : Prop

structure BoundaryLayerEvidence {C : ImpulsiveBVPCore} (B : BoundaryLayerPackage C) where
  boundaryLayerThicknessClosed : B.boundaryLayerThickness = B.boundaryLayerThickness
  boundaryConditionOverlapClosed : B.boundaryConditionOverlap
  lateralBoundaryGrowthClosed : B.lateralBoundaryGrowth
  boundaryLayerUniformClosed : B.boundaryLayerUniform
  compatibilityWithJumpsClosed : B.compatibilityWithJumps

def BoundaryLayerClosed {C : ImpulsiveBVPCore} (B : BoundaryLayerPackage C) : Prop :=
  B.boundaryConditionOverlap ∧ B.lateralBoundaryGrowth ∧ B.boundaryLayerUniform ∧ B.compatibilityWithJumps

theorem boundary_layer_closed_from_evidence {C : ImpulsiveBVPCore} (B : BoundaryLayerPackage C) (E : BoundaryLayerEvidence B) : BoundaryLayerClosed B := by
  exact And.intro E.boundaryConditionOverlapClosed
    (And.intro E.lateralBoundaryGrowthClosed
      (And.intro E.boundaryLayerUniformClosed E.compatibilityWithJumpsClosed))

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse
