import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure CapacityPackage (carrier : Type u) (top : TopologicalSpace carrier) where
  capacity : Set (Set carrier) → ℝ≥0∞
  monotone : ∀ (A B : Set carrier), A ⊆ B → capacity A ≤ capacity B
  subadditive : ∀ (E : ℕ → Set carrier), capacity (⋃ n, E n) ≤ ∑' n, capacity (E n)
  capacityRegular : ∀ (A : Set carrier), capacity A = sup (λ K : Set carrier, K ⊆ A ∧ IsCompact K) (capacity K)

structure CapacityEvidence {carrier : Type u} {top : TopologicalSpace carrier}
    (C : CapacityPackage carrier top) where
  monotoneClosed : C.monotone
  subadditiveClosed : C.subadditive
  capacityRegularClosed : C.capacityRegular

def CapacityClosed {carrier : Type u} {top : TopologicalSpace carrier}
    (C : CapacityPackage carrier top) : Prop :=
  C.monotone ∧ C.subadditive ∧ C.capacityRegular

theorem capacity_closed_from_evidence {carrier : Type u} {top : TopologicalSpace carrier}
    (C : CapacityPackage carrier top) (E : CapacityEvidence C) :
    CapacityClosed C := by
  exact And.intro E.monotoneClosed
    (And.intro E.subadditiveClosed E.capacityRegularClosed)

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse