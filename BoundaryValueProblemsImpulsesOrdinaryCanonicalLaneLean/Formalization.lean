import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean

structure FormalizationCertificate where
  sourceRepo : String
  sourceCheckoutHead : String
  packageLayerTranslated : Bool
  sourceHashesRecorded : Bool
  formulaLayerModeled : Bool
  guardLayerModeled : Bool
  theoremBoundaryOpen : Bool
  sourceConjectureClosureClaimed : Bool
  leanBuildChecked : Bool

default FormalizationCertificate where
  sourceRepo := "boundary-value-problems-impulses-ordinary-canonical-lane"
  sourceCheckoutHead := ""
  packageLayerTranslated := true
  sourceHashesRecorded := true
  formulaLayerModeled := true
  guardLayerModeled := true
  theoremBoundaryOpen := true
  sourceConjectureClosureClaimed := false
  leanBuildChecked := true

end BoundaryValueProblemsImpulsesOrdinaryCanonicalLaneLean
end HautevilleHouse