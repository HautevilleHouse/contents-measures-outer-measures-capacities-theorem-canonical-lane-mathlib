import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean.OuterMeasure

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure Capacity (X : Type u) where
  cap : Set X → ℝ
  capEmpty : cap ∅ = 0
  capMonotone : ∀ A B, A ⊆ B → cap A ≤ cap B
  capCountablySubadditive : ∀ (f : ℕ → Set X), cap (⋃ n, f n) ≤ ∑' n, cap (f n)
  capIncreasing : ∀ (A : Set X), cap A = ⨆ (K : Set X) (_ : K ⊆ A ∧ IsCompact K), cap K

structure CapacityEvidence {X : Type u} (C : Capacity X) where
  capEmptyClosed : C.capEmpty
  capMonotoneClosed : C.capMonotone
  capCountablySubadditiveClosed : C.capCountablySubadditive
  capIncreasingClosed : C.capIncreasing

def CapacityClosed {X : Type u} (C : Capacity X) : Prop :=
  C.capEmpty ∧ C.capMonotone ∧ C.capCountablySubadditive ∧ C.capIncreasing

theorem capacity_closed_from_evidence {X : Type u} (C : Capacity X) (E : CapacityEvidence C) : CapacityClosed C := by
  exact And.intro E.capEmptyClosed (And.intro E.capMonotoneClosed (And.intro E.capCountablySubadditiveClosed E.capIncreasingClosed))

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse