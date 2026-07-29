import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure MeasurePackage (carrier : Type u) (B : BorelPackage carrier) where
  measure : Set B.borelSigmaAlgebra → ℝ≥0∞
  emptyMeasured : measure ∅ = 0
  countableAdditive : ∀ (E : ℕ → Set B.borelSigmaAlgebra), PairwiseDisjoint (Set.range E) →
    measure (⋃ n, E n) = ∑' n, measure (E n)
  measureFiniteOnCompacts : ∀ (K : Set carrier), IsCompact K → measure ⟨K, ?_⟩ < ∞

structure MeasureEvidence {carrier : Type u} {B : BorelPackage carrier}
    (M : MeasurePackage carrier B) where
  emptyMeasuredClosed : M.emptyMeasured
  countableAdditiveClosed : M.countableAdditive
  measureFiniteOnCompactsClosed : M.measureFiniteOnCompacts

def MeasureClosed {carrier : Type u} {B : BorelPackage carrier}
    (M : MeasurePackage carrier B) : Prop :=
  M.emptyMeasured ∧ M.countableAdditive ∧ M.measureFiniteOnCompacts

theorem measure_closed_from_evidence
    {carrier : Type u} {B : BorelPackage carrier}
    (M : MeasurePackage carrier B) (E : MeasureEvidence M) :
    MeasureClosed M := by
  exact And.intro E.emptyMeasuredClosed
    (And.intro E.countableAdditiveClosed E.measureFiniteOnCompactsClosed)

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse