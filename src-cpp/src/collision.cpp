// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/collision/contact_feature_id.hpp>
#include <flight_hx/collision.hpp>

namespace flight_hx::collision {

double pack_contact_feature_id(bool referenceIsA, double referenceEdge, double incidentEdge, bool secondPoint) {
  return flight::collision::pack_contact_feature_id(referenceIsA, referenceEdge, incidentEdge, secondPoint);
}

} // namespace flight_hx::collision
