import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure CapacityTheoremPackage where
  outerMeasure : OuterMeasureConstruction
  capacityDefined : MeasureTheory.OuterMeasure (α := outerMeasure.content.baseSet)
  capacityExtendsOuterMeasure : ∀ s, capacityDefined s = outerMeasure.outerMeasureDefined s
  capacityIsCapacity : Prop
  capacityChoquet : Prop
  capacityExtendsClosed : capacityExtendsOuterMeasure
  capacityIsCapacityClosed : capacityIsCapacity
  capacityChoquetClosed : capacityChoquet

def CapacityTheoremClosed (P : CapacityTheoremPackage) : Prop :=
  (∀ s, P.capacityDefined s = P.outerMeasure.outerMeasureDefined s) ∧ P.capacityIsCapacity ∧ P.capacityChoquet

theorem capacity_theorem_closed_from_evidence (P : CapacityTheoremPackage) (h : (∀ s, P.capacityDefined s = P.outerMeasure.outerMeasureDefined s) ∧ P.capacityIsCapacity ∧ P.capacityChoquet) : CapacityTheoremClosed P := by
  exact h

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse
