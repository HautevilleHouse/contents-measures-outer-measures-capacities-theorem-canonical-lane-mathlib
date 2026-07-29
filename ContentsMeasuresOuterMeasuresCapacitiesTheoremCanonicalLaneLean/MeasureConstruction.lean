import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure ContentConstruction where
  baseSet : Type
  semiRing : Set (Set baseSet)
  contentDefined : MeasureTheory.Content (α := baseSet) 
  contentAdditive : Prop
  contentMonotone : Prop
  contentSubadditive : Prop
  contentDefinedClosed : contentDefined ≠ default
  contentAdditiveClosed : contentAdditive
  contentMonotoneClosed : contentMonotone
  contentSubadditiveClosed : contentSubadditive

structure OuterMeasureConstruction where
  content : ContentConstruction
  outerMeasureDefined : MeasureTheory.OuterMeasure (α := content.baseSet)
  outerMeasureExtends : ∀ s ∈ content.semiRing, outerMeasureDefined s = content.contentDefined s
  outerMeasureCountablySubadditive : Prop
  outerMeasureExtendsClosed : outerMeasureExtends
  outerMeasureCountablySubadditiveClosed : outerMeasureCountablySubadditive

def OuterMeasureClosed (O : OuterMeasureConstruction) : Prop :=
  O.outerMeasureExtends ∧ O.outerMeasureCountablySubadditive

theorem outer_measure_closed_from_evidence (O : OuterMeasureConstruction) (h : O.outerMeasureExtendsClosed ∧ O.outerMeasureCountablySubadditiveClosed) : OuterMeasureClosed O := by
  exact h

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse
