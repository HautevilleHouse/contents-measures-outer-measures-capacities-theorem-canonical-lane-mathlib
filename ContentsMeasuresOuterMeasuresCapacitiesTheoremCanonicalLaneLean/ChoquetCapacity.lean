import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure ChoquetCapacityPackage (carrier : Type u) (top : TopologicalSpace carrier) where
  capacity : Set (Set carrier) → ℝ≥0∞
  monotone : ∀ (A B : Set carrier), A ⊆ B → capacity A ≤ capacity B
  subadditive : ∀ (E : ℕ → Set carrier), capacity (⋃ n, E n) ≤ ∑' n, capacity (E n)
  capacityRegular : ∀ (A : Set carrier), capacity A = sup (λ K : Set carrier, K ⊆ A ∧ IsCompact K) (capacity K)
  capacitability : ∀ (B : Set carrier), B ∈ borelSigmaAlgebra → capacity B = sup (λ K : Set carrier, K ⊆ B ∧ IsCompact K) (capacity K)

structure ChoquetCapacityEvidence {carrier : Type u} {top : TopologicalSpace carrier}
    (C : ChoquetCapacityPackage carrier top) where
  monotoneClosed : C.monotone
  subadditiveClosed : C.subadditive
  capacityRegularClosed : C.capacityRegular
  capacitabilityClosed : C.capacitability

def ChoquetCapacityClosed {carrier : Type u} {top : TopologicalSpace carrier}
    (C : ChoquetCapacityPackage carrier top) : Prop :=
  C.monotone ∧ C.subadditive ∧ C.capacityRegular ∧ C.capacitability

theorem choquet_capacity_closed_from_evidence
    {carrier : Type u} {top : TopologicalSpace carrier}
    (C : ChoquetCapacityPackage carrier top)
    (E : ChoquetCapacityEvidence C) : ChoquetCapacityClosed C := by
  exact And.intro E.monotoneClosed
    (And.intro E.subadditiveClosed
      (And.intro E.capacityRegularClosed E.capacitabilityClosed))

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse