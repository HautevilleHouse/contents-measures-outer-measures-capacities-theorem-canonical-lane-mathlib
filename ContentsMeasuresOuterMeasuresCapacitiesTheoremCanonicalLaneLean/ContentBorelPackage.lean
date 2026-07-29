import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure BorelPackage (carrier : Type u) where
  topology : TopologicalSpace carrier
  borelSigmaAlgebra : Set (Set carrier)
  borelGeneratedFromTopology : Prop
  openSetsMeasurable : ∀ (U : Set carrier), IsOpen U → U ∈ borelSigmaAlgebra
  borelSigmaAlgebraTerm : borelSigmaAlgebra ≠ ∅

structure BorelEvidence {carrier : Type u} (B : BorelPackage carrier) where
  borelGeneratedFromTopologyClosed : B.borelGeneratedFromTopology
  openSetsMeasurableClosed : B.openSetsMeasurable
  borelSigmaAlgebraTermClosed : B.borelSigmaAlgebraTerm

def BorelClosed {carrier : Type u} (B : BorelPackage carrier) : Prop :=
  B.borelGeneratedFromTopology ∧ B.openSetsMeasurable ∧ B.borelSigmaAlgebraTerm

theorem borel_closed_from_evidence
    {carrier : Type u} (B : BorelPackage carrier) (E : BorelEvidence B) :
    BorelClosed B := by
  exact And.intro E.borelGeneratedFromTopologyClosed
    (And.intro E.openSetsMeasurableClosed E.borelSigmaAlgebraTermClosed)

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse