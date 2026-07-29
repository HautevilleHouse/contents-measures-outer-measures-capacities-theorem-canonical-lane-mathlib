import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure HahnKolmogorovPackage where
  content : Type u
  outerMeasure : Type v
  caratheodoryMeasurable : Prop
  measureOnSigmaAlgebra : Prop
  extensionFromContent : Prop

structure HahnKolmogorovEvidence (H : HahnKolmogorovPackage) where
  caratheodoryMeasurableClosed : H.caratheodoryMeasurable
  measureOnSigmaAlgebraClosed : H.measureOnSigmaAlgebra
  extensionFromContentClosed : H.extensionFromContent

def HahnKolmogorovClosed (H : HahnKolmogorovPackage) : Prop :=
  H.caratheodoryMeasurable ∧ H.measureOnSigmaAlgebra ∧ H.extensionFromContent

theorem hahn_kolmogorov_closed_from_evidence
    (H : HahnKolmogorovPackage) (E : HahnKolmogorovEvidence H) :
    HahnKolmogorovClosed H := by
  exact And.intro E.caratheodoryMeasurableClosed
    (And.intro E.measureOnSigmaAlgebraClosed E.extensionFromContentClosed)

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse