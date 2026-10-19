// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/geolocation/contract.hpp>
#include <flight_hx/geolocation.hpp>

namespace flight_hx::geolocation {

flight::Ref<flight::types::GeolocationPosition> create_geolocation_position() {
  return flight::geolocation::create_geolocation_position();
}

void clear_geolocation_watch(flight::Ref<flight::types::HostGeolocationCapability> hostGeolocation, double id) {
  flight::geolocation::clear_geolocation_watch(hostGeolocation, id);
}

bool is_geolocation_available(flight::Ref<flight::types::HostGeolocationCapability> hostGeolocation) {
  return flight::geolocation::is_geolocation_available(hostGeolocation);
}

} // namespace flight_hx::geolocation
