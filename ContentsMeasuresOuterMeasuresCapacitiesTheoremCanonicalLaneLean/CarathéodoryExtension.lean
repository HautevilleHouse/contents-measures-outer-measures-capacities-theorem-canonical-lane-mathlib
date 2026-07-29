import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean.ContentMeasureSpace
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean.OuterMeasure

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure CarathéodoryExtensionPackage (X : ContentMeasureSpace) where
  outerMeasureFromContent : OuterMeasure X
  extendsContent : ∀ (s : Set X.carrier) (hs : s ∈ X.semiringOfSets), outerMeasureFromContent.mu s = X.content s hs
  carathéodoryMeasurableSets : Set (Set X.carrier)
  sigmaAlgebraGenerated : Set (Set X.carrier)
  completionIsMeasure : Prop

structure CarathéodoryExtensionEvidence {X : ContentMeasureSpace} (C : CarathéodoryExtensionPackage X) where
  extendsContentClosed : C.extendsContent
  completionIsMeasureClosed : C.completionIsMeasure

def CarathéodoryExtensionClosed {X : ContentMeasureSpace} (C : CarathéodoryExtensionPackage X) : Prop :=
  C.extendsContent ∧ C.completionIsMeasure

theorem carathéodory_extension_closed_from_evidence {X : ContentMeasureSpace} (C : CarathéodoryExtensionPackage X) (E : CarathéodoryExtensionEvidence C) : CarathéodoryExtensionClosed C := by
  exact And.intro E.extendsContentClosed E.completionIsMeasureClosed

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse