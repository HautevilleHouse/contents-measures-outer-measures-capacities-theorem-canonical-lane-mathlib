import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure ContentPackage where
  innerRegular : Prop
  outerRegular : Prop
  approximationProperty : Prop
  borelRegular : Prop

def ContentPackageClosed (C : ContentPackage) : Prop :=
  C.innerRegular ∧ C.outerRegular ∧ C.approximationProperty ∧ C.borelRegular

structure ContentEvidence (C : ContentPackage) where
  innerRegularClosed : C.innerRegular
  outerRegularClosed : C.outerRegular
  approximationPropertyClosed : C.approximationProperty
  borelRegularClosed : C.borelRegular

theorem content_closed_from_evidence (C : ContentPackage) (E : ContentEvidence C) :
    ContentPackageClosed C := by
  exact And.intro E.innerRegularClosed
    (And.intro E.outerRegularClosed
      (And.intro E.approximationPropertyClosed E.borelRegularClosed))

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse