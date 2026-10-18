// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::path {

double get_cubic_bezier_curvature(double x0, double y0, double c1x, double c1y, double c2x, double c2y, double x1, double y1, double t);
double get_quadratic_bezier_curvature(double x0, double y0, double cx, double cy, double x1, double y1, double t);

} // namespace flight_hx::path
