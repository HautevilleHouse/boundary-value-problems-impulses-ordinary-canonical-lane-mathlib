import BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceRepository : String :=
  "boundary-value-problems-impulses-ordinary-canonical-lane"

def sourceDescription : String :=
  "Boundary Value Problems with Impulses Ordinary"

def baselineCertificateLane : String :=
  "manifold_constrained"

structure SourceTheoremBoundary where
  claimBoundary : String

def sourceTheoremBoundary : SourceTheoremBoundary :=
  { claimBoundary := "classical boundary" }

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := sourceRepository,
  theoremName := sourceRepository,
  theoremObject := sourceDescription,
  classicalBoundary := sourceTheoremBoundary.claimBoundary,
  manifoldConstrainedStatement := "admissible-class bridge/gate closure for BVPI Ordinary",
  certificateLane := baselineCertificateLane,
  carriedRemainder := "carried source boundary"
}

theorem theorem_statement_source_key_checked :
    sourceTheoremStatement.sourceKey = sourceRepository := by
  rfl

theorem theorem_statement_certificate_lane_checked :
    sourceTheoremStatement.certificateLane = baselineCertificateLane := by
  rfl

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse