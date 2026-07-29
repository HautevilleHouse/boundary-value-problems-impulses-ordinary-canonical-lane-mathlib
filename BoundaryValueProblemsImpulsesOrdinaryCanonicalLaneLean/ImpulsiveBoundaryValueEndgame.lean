import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

def ConstrainedBVPIimpulseClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bvp_impulse_endgame (A : AdmissibleClass) :
    ConstrainedBVPIimpulseClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse