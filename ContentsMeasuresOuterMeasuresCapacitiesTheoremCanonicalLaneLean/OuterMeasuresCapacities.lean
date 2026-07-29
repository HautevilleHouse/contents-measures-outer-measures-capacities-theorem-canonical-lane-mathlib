import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean.ContentsMeasures

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure OuterMeasurePackage (C : ContentPackage) where
  caratheodoryExtension : Prop
  metricOuterMeasure : Prop
  capacityDefined : Prop
  choquetIntegral : Prop

def OuterMeasurePackageClosed {C : ContentPackage} (O : OuterMeasurePackage C) : Prop :=
  O.caratheodoryExtension ∧ O.metricOuterMeasure ∧ O.capacityDefined ∧ O.choquetIntegral

structure OuterMeasureEvidence {C : ContentPackage} (O : OuterMeasurePackage C) where
  caratheodoryExtensionClosed : O.caratheodoryExtension
  metricOuterMeasureClosed : O.metricOuterMeasure
  capacityDefinedClosed : O.capacityDefined
  choquetIntegralClosed : O.choquetIntegral

theorem outer_measure_closed_from_evidence {C : ContentPackage}
    (O : OuterMeasurePackage C) (E : OuterMeasureEvidence O) :
    OuterMeasurePackageClosed O := by
  exact And.intro E.caratheodoryExtensionClosed
    (And.intro E.metricOuterMeasureClosed
      (And.intro E.capacityDefinedClosed E.choquetIntegralClosed))

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse