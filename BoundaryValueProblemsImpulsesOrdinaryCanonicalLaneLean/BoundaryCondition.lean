import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure BoundaryCondition where
  startPoint : ℝ
  endPoint : ℝ
  dirichletLeft : ℝ
  dirichletRight : ℝ
  neumannLeft : ℝ
  neumannRight : ℝ

define BoundaryAdmissible (B : BoundaryCondition) : Prop :=
  B.dirichletLeft = B.startPoint ∧ B.dirichletRight = B.endPoint

structure BoundaryConditionEvidence (B : BoundaryCondition) where
  admissible : BoundaryAdmissible B
  consistency : B.neumannLeft = B.neumannRight

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse