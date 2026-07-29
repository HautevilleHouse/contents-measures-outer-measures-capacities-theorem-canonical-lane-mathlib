import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean.CapacityDefinition
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean.OuterMeasureConstruction

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure CapacitabilityTheoremPackage where
  capacity : CapacityDef
  capacitableSets : Set (Set (capacity.carrier))
  allBorelSetsCapacitable : Prop
  analyticSetsCapacitable : Prop

structure CapacitabilityEvidence (P : CapacitabilityTheoremPackage) where
  allBorelSetsCapacitableClosed : P.allBorelSetsCapacitable
  analyticSetsCapacitableClosed : P.analyticSetsCapacitable

def CapacitabilityClosed (P : CapacitabilityTheoremPackage) : Prop :=
  P.allBorelSetsCapacitable ∧ P.analyticSetsCapacitable

theorem capacitability_closed_from_evidence (P : CapacitabilityTheoremPackage)
    (E : CapacitabilityEvidence P) : CapacitabilityClosed P := by
  exact And.intro E.allBorelSetsCapacitableClosed E.analyticSetsCapacitableClosed

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse