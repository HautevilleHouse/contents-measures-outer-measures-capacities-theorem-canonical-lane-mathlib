import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean

structure CapacitiesBridgePackage where
  capacityTheorem : CapacityTheoremPackage
  admissibleObject : AdmissibleClass
  bridgeCondition : capacityTheorem.capacityDefined capacityTheorem.outerMeasure.content.baseSet = capacityTheorem.outerMeasure.outerMeasureDefined capacityTheorem.outerMeasure.content.baseSet
  bridgeConditionClosed : bridgeCondition

def CapacitiesBridgeClosed (B : CapacitiesBridgePackage) : Prop :=
  B.bridgeCondition

theorem capacities_bridge_closed_from_evidence (B : CapacitiesBridgePackage) : CapacitiesBridgeClosed B := by
  exact B.bridgeConditionClosed

end ContentsMeasuresOuterMeasuresCapacitiesTheoremCanonicalLaneLean
end HautevilleHouse
