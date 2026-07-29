import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure MeasureSpace where
  carrier : Type u
  sigmaAlgebra : Set (Set carrier)
  measure : (Set carrier) → ℝ≥0∞
  measureEmpty : measure ∅ = 0
  measureCountablyAdditive : ∀ (f : ℕ → Set carrier), (∀ i j, i ≠ j → f i ∩ f j = ∅) →
    measure (⋃ i, f i) = ∑' i, measure (f i)

structure MeasureEvidence (M : MeasureSpace) where
  measureEmptyClosed : M.measureEmpty
  measureCountablyAdditiveClosed : M.measureCountablyAdditive

def MeasureClosed (M : MeasureSpace) : Prop :=
  M.measureEmpty ∧ M.measureCountablyAdditive

theorem measure_closed_from_evidence (M : MeasureSpace) (E : MeasureEvidence M) :
    MeasureClosed M := by
  exact And.intro E.measureEmptyClosed E.measureCountablyAdditiveClosed

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse