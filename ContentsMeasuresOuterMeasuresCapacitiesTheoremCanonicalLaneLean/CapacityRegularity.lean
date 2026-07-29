import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean.CapacityDefinition
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean.CaratheodoryExtension

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure CapacityRegularityResult where
  capacity : CapacityDef
  outerMeasure : OuterMeasureCarrier
  outerMeasureFromCapacity : (∀ A, outerMeasure.outerMeasure A = inf (capacity.capacity F for F closed, F ⊆ A)) → Prop
  capacityFromOuterMeasure : (∀ A, capacity.capacity A = sup (outerMeasure.outerMeasure K for K compact, K ⊆ A)) → Prop
  regularityComparison : capacity.capacity = outerMeasure.outerMeasure

structure CapacityRegularityEvidence (R : CapacityRegularityResult) where
  outerMeasureFromCapacityClosed : R.outerMeasureFromCapacity
  capacityFromOuterMeasureClosed : R.capacityFromOuterMeasure
  regularityComparisonClosed : R.regularityComparison

def CapacityRegularityClosed (R : CapacityRegularityResult) : Prop :=
  R.outerMeasureFromCapacity ∧ R.capacityFromOuterMeasure ∧ R.regularityComparison

theorem capacity_regularity_closed_from_evidence (R : CapacityRegularityResult)
    (E : CapacityRegularityEvidence R) : CapacityRegularityClosed R := by
  exact And.intro E.outerMeasureFromCapacityClosed
    (And.intro E.capacityFromOuterMeasureClosed E.regularityComparisonClosed)

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse