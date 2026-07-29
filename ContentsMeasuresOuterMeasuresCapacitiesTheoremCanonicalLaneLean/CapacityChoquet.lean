import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure CapacityPackage where
  capacity : Type u
  monotonicity : Prop
  subadditivity : Prop
  alternatingOfInfiniteOrder : Prop
  choquetIntegralDefined : Prop

structure CapacityEvidence (C : CapacityPackage) where
  monotonicityClosed : C.monotonicity
  subadditivityClosed : C.subadditivity
  alternatingOfInfiniteOrderClosed : C.alternatingOfInfiniteOrder
  choquetIntegralDefinedClosed : C.choquetIntegralDefined

def CapacityClosed (C : CapacityPackage) : Prop :=
  C.monotonicity ∧ C.subadditivity ∧ C.alternatingOfInfiniteOrder ∧ C.choquetIntegralDefined

theorem capacity_closed_from_evidence
    (C : CapacityPackage) (E : CapacityEvidence C) : CapacityClosed C := by
  exact And.intro E.monotonicityClosed
    (And.intro E.subadditivityClosed
      (And.intro E.alternatingOfInfiniteOrderClosed E.choquetIntegralDefinedClosed))

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse