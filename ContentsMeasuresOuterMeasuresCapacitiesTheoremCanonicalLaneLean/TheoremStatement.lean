import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure CapacitiesAdmittedObject where
  carrier : Type
  outerMeasure : carrier → Prop
  capacityFunctional : carrier → Prop
  conclusion : capacityFunctional = outerMeasure

def CapacitiesWitnessClosed (O : CapacitiesAdmittedObject) : Prop :=
  O.conclusion

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse