// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::geolocation {

flight::Ref<flight::types::GeolocationPosition> create_geolocation_position();
void clear_geolocation_watch(flight::Ref<flight::types::HostGeolocationCapability> hostGeolocation, double id);
bool is_geolocation_available(flight::Ref<flight::types::HostGeolocationCapability> hostGeolocation);

} // namespace flight_hx::geolocation
