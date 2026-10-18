// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/path/contract.hpp>
#include <flight_hx/path.hpp>

namespace flight_hx::path {

double get_cubic_bezier_curvature(double x0, double y0, double c1x, double c1y, double c2x, double c2y, double x1, double y1, double t) {
  return flight::path::get_cubic_bezier_curvature(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t);
}

double get_quadratic_bezier_curvature(double x0, double y0, double cx, double cy, double x1, double y1, double t) {
  return flight::path::get_quadratic_bezier_curvature(x0, y0, cx, cy, x1, y1, t);
}

} // namespace flight_hx::path
