import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure CapacitySpace where
  carrier : Type
  measurableSpace : MeasurableSpace carrier

structure CapacityAdmittedObject where
  space : CapacitySpace
  content : MeasureTheory.Content (α := space.carrier)
  outerMeasure : MeasureTheory.OuterMeasure (α := space.carrier)
  capacity : MeasureTheory.OuterMeasure (α := space.carrier)
  capacitySatisfiesChoquet : Prop
  capacityEqualsSupContent : Prop
  conclusion : capacitySatisfiesChoquet ∧ capacityEqualsSupContent

def CapacityWitnessClosed (O : CapacityAdmittedObject) : Prop :=
  O.capacitySatisfiesChoquet ∧ O.capacityEqualsSupContent

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse
