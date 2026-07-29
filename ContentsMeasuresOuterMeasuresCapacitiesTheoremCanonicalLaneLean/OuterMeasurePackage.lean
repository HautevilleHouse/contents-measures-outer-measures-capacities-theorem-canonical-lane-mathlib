import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure OuterMeasurePackage (carrier : Type u) where
  outerMeasure : Set (Set carrier) → ℝ≥0∞
  emptyMeasured : outerMeasure ∅ = 0
  monotone : ∀ (A B : Set carrier), A ⊆ B → outerMeasure A ≤ outerMeasure B
  subadditive : ∀ (E : ℕ → Set carrier), outerMeasure (⋃ n, E n) ≤ ∑' n, outerMeasure (E n)

structure OuterMeasureEvidence (O : OuterMeasurePackage carrier) where
  emptyMeasuredClosed : O.emptyMeasured
  monotoneClosed : O.monotone
  subadditiveClosed : O.subadditive

def OuterMeasureClosed (O : OuterMeasurePackage carrier) : Prop :=
  O.emptyMeasured ∧ O.monotone ∧ O.subadditive

theorem outer_measure_closed_from_evidence (O : OuterMeasurePackage carrier)
    (E : OuterMeasureEvidence O) : OuterMeasureClosed O := by
  exact And.intro E.emptyMeasuredClosed
    (And.intro E.monotoneClosed E.subadditiveClosed)

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse