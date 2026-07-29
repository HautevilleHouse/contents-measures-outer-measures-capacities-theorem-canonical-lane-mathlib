import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure ContentMeasureSpace where
  carrier : Type u
  semiringOfSets : Set (Set carrier)
  content : (s : Set carrier) → s ∈ semiringOfSets → ℝ≥0∞
  contentEmpty : content ∅ (by sorry) = 0
  contentFiniteAdditive : ∀ s t, s ∈ semiringOfSets → t ∈ semiringOfSets → Disjoint s t → content (s ∪ t) (by sorry) = content s (by sorry) + content t (by sorry)

structure ContentMeasureEvidence (X : ContentMeasureSpace) where
  contentEmptyClosed : X.contentEmpty
  contentFiniteAdditiveClosed : X.contentFiniteAdditive

def ContentMeasureClosed (X : ContentMeasureSpace) : Prop :=
  X.contentEmpty ∧ X.contentFiniteAdditive

theorem content_measure_closed_from_evidence (X : ContentMeasureSpace) (E : ContentMeasureEvidence X) : ContentMeasureClosed X := by
  exact And.intro E.contentEmptyClosed E.contentFiniteAdditiveClosed

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse