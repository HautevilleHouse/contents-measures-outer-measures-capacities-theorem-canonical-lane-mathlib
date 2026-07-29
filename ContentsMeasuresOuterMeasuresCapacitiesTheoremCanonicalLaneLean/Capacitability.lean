import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean.OuterMeasuresCapacities

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure CapacitabilityPackage {C : ContentPackage} {O : OuterMeasurePackage C} where
  capacitabilityTheorem : Prop
  suslinSets : Prop
  analyticSets : Prop
  regularity : Prop

def CapacitabilityPackageClosed {C : ContentPackage} {O : OuterMeasurePackage C}
    (P : CapacitabilityPackage O) : Prop :=
  P.capacitabilityTheorem ∧ P.suslinSets ∧ P.analyticSets ∧ P.regularity

structure CapacitabilityEvidence {C : ContentPackage} {O : OuterMeasurePackage C}
    (P : CapacitabilityPackage O) where
  capacitabilityTheoremClosed : P.capacitabilityTheorem
  suslinSetsClosed : P.suslinSets
  analyticSetsClosed : P.analyticSets
  regularityClosed : P.regularity

theorem capacitability_closed_from_evidence {C : ContentPackage} {O : OuterMeasurePackage C}
    (P : CapacitabilityPackage O) (E : CapacitabilityEvidence P) :
    CapacitabilityPackageClosed P := by
  exact And.intro E.capacitabilityTheoremClosed
    (And.intro E.suslinSetsClosed
      (And.intro E.analyticSetsClosed E.regularityClosed))

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse