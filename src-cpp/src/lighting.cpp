// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/lighting/light_intensity.hpp>
#include <flight_hx/lighting.hpp>

namespace flight_hx::lighting {

double apply_light_exposure(double intensity, double ev) {
  return flight::lighting::apply_light_exposure(intensity, ev);
}

} // namespace flight_hx::lighting
