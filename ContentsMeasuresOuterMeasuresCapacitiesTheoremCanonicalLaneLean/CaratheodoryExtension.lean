import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure CaratheodoryExtensionPackage (carrier : Type u) (O : OuterMeasurePackage carrier) where
  measurableSets : Set (Set carrier)
  caratheodoryCondition : ∀ (A : Set carrier), A ∈ measurableSets ↔
    ∀ (E : Set carrier), O.outerMeasure E = O.outerMeasure (E ∩ A) + O.outerMeasure (E \ A)
  restrictionIsMeasure : Bool

structure CaratheodoryExtensionEvidence {carrier : Type u} {O : OuterMeasurePackage carrier}
    (C : CaratheodoryExtensionPackage carrier O) where
  caratheodoryConditionClosed : C.caratheodoryCondition
  restrictionIsMeasureClosed : C.restrictionIsMeasure

def CaratheodoryExtensionClosed {carrier : Type u} {O : OuterMeasurePackage carrier}
    (C : CaratheodoryExtensionPackage carrier O) : Prop :=
  C.caratheodoryCondition ∧ C.restrictionIsMeasure

theorem caratheodory_extension_closed_from_evidence
    {carrier : Type u} {O : OuterMeasurePackage carrier}
    (C : CaratheodoryExtensionPackage carrier O)
    (E : CaratheodoryExtensionEvidence C) :
    CaratheodoryExtensionClosed C := by
  exact And.intro E.caratheodoryConditionClosed E.restrictionIsMeasureClosed

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse