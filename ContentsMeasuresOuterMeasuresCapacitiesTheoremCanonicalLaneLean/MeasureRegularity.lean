import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure RegularityPackage where
  measure : Type u
  innerRegular : Prop
  outerRegular : Prop
  radonProperty : Prop
  borelRegular : Prop

structure RegularityEvidence (R : RegularityPackage) where
  innerRegularClosed : R.innerRegular
  outerRegularClosed : R.outerRegular
  radonPropertyClosed : R.radonProperty
  borelRegularClosed : R.borelRegular

def RegularityClosed (R : RegularityPackage) : Prop :=
  R.innerRegular ∧ R.outerRegular ∧ R.radonProperty ∧ R.borelRegular

theorem regularity_closed_from_evidence
    (R : RegularityPackage) (E : RegularityEvidence R) : RegularityClosed R := by
  exact And.intro E.innerRegularClosed
    (And.intro E.outerRegularClosed
      (And.intro E.radonPropertyClosed E.borelRegularClosed))

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse