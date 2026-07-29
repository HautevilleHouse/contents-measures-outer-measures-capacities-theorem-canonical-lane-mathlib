import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean.OuterMeasureConstruction

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure CapacityDef where
  carrier : Type u
  capacity : Set (Set carrier) → ℝ≥0∞
  capacityMonotone : ∀ A B, A ⊆ B → capacity A ≤ capacity B
  capacityCountablySubadditive : ∀ (f : ℕ → Set carrier),
    capacity (⋃ i, f i) ≤ ∑' i, capacity (f i)

structure CapacityEvidence (C : CapacityDef) where
  capacityMonotoneClosed : C.capacityMonotone
  capacityCountablySubadditiveClosed : C.capacityCountablySubadditive

def CapacityClosed (C : CapacityDef) : Prop :=
  C.capacityMonotone ∧ C.capacityCountablySubadditive

theorem capacity_closed_from_evidence (C : CapacityDef) (E : CapacityEvidence C) :
    CapacityClosed C := by
  exact And.intro E.capacityMonotoneClosed E.capacityCountablySubadditiveClosed

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse