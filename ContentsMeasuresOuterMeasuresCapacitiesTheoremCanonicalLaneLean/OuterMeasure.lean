import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean.ContentMeasureSpace

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure OuterMeasure (X : ContentMeasureSpace) where
  mu : Set (X.carrier) → ℝ≥0∞
  muEmpty : mu ∅ = 0
  muMonotone : ∀ A B, A ⊆ B → mu A ≤ mu B
  muCountablySubadditive : ∀ (f : ℕ → Set (X.carrier)), mu (⋃ n, f n) ≤ ∑' n, mu (f n)

structure OuterMeasureEvidence {X : ContentMeasureSpace} (M : OuterMeasure X) where
  muEmptyClosed : M.muEmpty
  muMonotoneClosed : M.muMonotone
  muCountablySubadditiveClosed : M.muCountablySubadditive

def OuterMeasureClosed {X : ContentMeasureSpace} (M : OuterMeasure X) : Prop :=
  M.muEmpty ∧ M.muMonotone ∧ M.muCountablySubadditive

theorem outer_measure_closed_from_evidence {X : ContentMeasureSpace} (M : OuterMeasure X) (E : OuterMeasureEvidence M) : OuterMeasureClosed M := by
  exact And.intro E.muEmptyClosed (And.intro E.muMonotoneClosed E.muCountablySubadditiveClosed)

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse