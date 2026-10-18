// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

inline function packContactFeatureId(referenceIsA:Bool, referenceEdge:Float, incidentEdge:Float, secondPoint:Bool):Float {
  return flight._cpp._fn.Collision.packContactFeatureId(referenceIsA, referenceEdge, incidentEdge, secondPoint);
}
