import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean.MeasureTheoryBasics

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure OuterMeasureCarrier where
  carrier : Type u
  outerMeasure : Set (Set carrier) → ℝ≥0∞
  outerMeasureEmpty : outerMeasure ∅ = 0
  outerMeasureMonotone : ∀ A B, A ⊆ B → outerMeasure A ≤ outerMeasure B
  outerMeasureCountablySubadditive : ∀ (f : ℕ → Set carrier),
    outerMeasure (⋃ i, f i) ≤ ∑' i, outerMeasure (f i)

structure OuterMeasureEvidence (O : OuterMeasureCarrier) where
  outerMeasureEmptyClosed : O.outerMeasureEmpty
  outerMeasureMonotoneClosed : O.outerMeasureMonotone
  outerMeasureCountablySubadditiveClosed : O.outerMeasureCountablySubadditive

def OuterMeasureClosed (O : OuterMeasureCarrier) : Prop :=
  O.outerMeasureEmpty ∧ O.outerMeasureMonotone ∧ O.outerMeasureCountablySubadditive

theorem outer_measure_closed_from_evidence (O : OuterMeasureCarrier)
    (E : OuterMeasureEvidence O) : OuterMeasureClosed O := by
  exact And.intro E.outerMeasureEmptyClosed
    (And.intro E.outerMeasureMonotoneClosed E.outerMeasureCountablySubadditiveClosed)

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse