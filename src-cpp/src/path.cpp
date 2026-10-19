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

flight::Ref<flight::types::PathMesh> acquire_path_mesh(flight::Ref<flight::types::Path> path, bool tolerancePresent, double tolerance) {
  return flight::path::acquire_path_mesh(path, (tolerancePresent ? std::optional<double>{tolerance} : std::nullopt));
}

flight::Ref<flight::types::PathMeshTyped> acquire_path_mesh_typed(flight::Ref<flight::types::Path> path, bool tolerancePresent, double tolerance) {
  return flight::path::acquire_path_mesh_typed(path, (tolerancePresent ? std::optional<double>{tolerance} : std::nullopt));
}

void append_path_arc(flight::Ref<flight::types::Path> path, double centerX, double centerY, double radius, double startAngle, double endAngle, bool anticlockwisePresent, bool anticlockwise, bool connectToCurrentPresent, bool connectToCurrent) {
  flight::path::append_path_arc(path, centerX, centerY, radius, startAngle, endAngle, (anticlockwisePresent ? std::optional<bool>{anticlockwise} : std::nullopt), (connectToCurrentPresent ? std::optional<bool>{connectToCurrent} : std::nullopt));
}

void append_path_circle(flight::Ref<flight::types::Path> path, double centerX, double centerY, double radius) {
  flight::path::append_path_circle(path, centerX, centerY, radius);
}

void append_path_close(flight::Ref<flight::types::Path> path) {
  flight::path::append_path_close(path);
}

void append_path_cubic_curve_to(flight::Ref<flight::types::Path> path, double controlX1, double controlY1, double controlX2, double controlY2, double x, double y) {
  flight::path::append_path_cubic_curve_to(path, controlX1, controlY1, controlX2, controlY2, x, y);
}

void append_path_ellipse(flight::Ref<flight::types::Path> path, double centerX, double centerY, double radiusX, double radiusY) {
  flight::path::append_path_ellipse(path, centerX, centerY, radiusX, radiusY);
}

void append_path_elliptical_arc_to(flight::Ref<flight::types::Path> path, double radiusX, double radiusY, double xAxisRotation, bool largeArc, bool sweep, double endX, double endY) {
  flight::path::append_path_elliptical_arc_to(path, radiusX, radiusY, xAxisRotation, largeArc, sweep, endX, endY);
}

void append_path_line_to(flight::Ref<flight::types::Path> path, double x, double y) {
  flight::path::append_path_line_to(path, x, y);
}

void append_path_move_to(flight::Ref<flight::types::Path> path, double x, double y) {
  flight::path::append_path_move_to(path, x, y);
}

void append_path_quadratic_curve_to(flight::Ref<flight::types::Path> path, double controlX, double controlY, double x, double y) {
  flight::path::append_path_quadratic_curve_to(path, controlX, controlY, x, y);
}

void append_path_rectangle(flight::Ref<flight::types::Path> path, double x, double y, double width, double height) {
  flight::path::append_path_rectangle(path, x, y, width, height);
}

void append_path_rounded_rectangle(flight::Ref<flight::types::Path> path, double x, double y, double width, double height, double radius) {
  flight::path::append_path_rounded_rectangle(path, x, y, width, height, radius);
}

void append_path_rounded_rectangle_with_corner_radii(flight::Ref<flight::types::Path> path, double x, double y, double width, double height, double topLeft, double topRight, double bottomRight, double bottomLeft) {
  flight::path::append_path_rounded_rectangle_with_corner_radii(path, x, y, width, height, topLeft, topRight, bottomRight, bottomLeft);
}

void append_path_tangent_arc_to(flight::Ref<flight::types::Path> path, double x1, double y1, double x2, double y2, double radius) {
  flight::path::append_path_tangent_arc_to(path, x1, y1, x2, y2, radius);
}

void clean_path(flight::Ref<flight::types::Path> source, double tolerance, flight::Ref<flight::types::Path> out, bool flattenTolerancePresent, double flattenTolerance) {
  flight::path::clean_path(source, tolerance, out, (flattenTolerancePresent ? std::optional<double>{flattenTolerance} : std::nullopt));
}

flight::Ref<flight::types::Path> clone_path(flight::Ref<flight::types::Path> source) {
  return flight::path::clone_path(source);
}

bool contains_path_point(flight::Ref<flight::types::Path> path, double px, double py, bool tolerancePresent, double tolerance) {
  return flight::path::contains_path_point(path, px, py, (tolerancePresent ? std::optional<double>{tolerance} : std::nullopt));
}

flight::Ref<flight::types::Path> copy_path(flight::Ref<flight::types::Path> source, flight::Ref<flight::types::Path> out) {
  return flight::path::copy_path(source, (out ? std::optional<flight::Ref<flight::types::Path>>{out} : std::nullopt));
}

void decimate_path(flight::Ref<flight::types::Path> source, double tolerance, flight::Ref<flight::types::Path> out, bool flattenTolerancePresent, double flattenTolerance) {
  flight::path::decimate_path(source, tolerance, out, (flattenTolerancePresent ? std::optional<double>{flattenTolerance} : std::nullopt));
}

void fit_path_curves(flight::Ref<flight::types::Path> source, double tolerance, flight::Ref<flight::types::Path> out, bool flattenTolerancePresent, double flattenTolerance) {
  flight::path::fit_path_curves(source, tolerance, out, (flattenTolerancePresent ? std::optional<double>{flattenTolerance} : std::nullopt));
}

double get_path_curvature_at_distance(flight::Ref<flight::types::Path> path, double distance, bool tolerancePresent, double tolerance) {
  return flight::path::get_path_curvature_at_distance(path, distance, (tolerancePresent ? std::optional<double>{tolerance} : std::nullopt));
}

double get_path_length(flight::Ref<flight::types::Path> path, bool tolerancePresent, double tolerance) {
  return flight::path::get_path_length(path, (tolerancePresent ? std::optional<double>{tolerance} : std::nullopt));
}

::hx::Null<double> get_path_segment_curvature_at_parameter(flight::Ref<flight::types::Path> path, double segmentIndex, double t) {
  const auto result = flight::path::get_path_segment_curvature_at_parameter(path, segmentIndex, t);
  return result.has_value() ? ::hx::Null<double>{result.value()} : ::hx::Null<double>{};
}

double get_path_signed_area(flight::Ref<flight::types::Path> path, bool tolerancePresent, double tolerance) {
  return flight::path::get_path_signed_area(path, (tolerancePresent ? std::optional<double>{tolerance} : std::nullopt));
}

void release_path_mesh(flight::Ref<flight::types::PathMesh> mesh) {
  flight::path::release_path_mesh(mesh);
}

void release_path_mesh_typed(flight::Ref<flight::types::PathMeshTyped> mesh) {
  flight::path::release_path_mesh_typed(mesh);
}

void reverse_path(flight::Ref<flight::types::Path> source, flight::Ref<flight::types::Path> out) {
  flight::path::reverse_path(source, out);
}

flight::Ref<flight::types::PathMesh> tessellate_path(flight::Ref<flight::types::Path> path, bool tolerancePresent, double tolerance) {
  return flight::path::tessellate_path(path, (tolerancePresent ? std::optional<double>{tolerance} : std::nullopt));
}

void tessellate_path_into(flight::Ref<flight::types::Path> path, flight::Ref<flight::types::PathMesh> out, bool tolerancePresent, double tolerance) {
  flight::path::tessellate_path_into(path, out, (tolerancePresent ? std::optional<double>{tolerance} : std::nullopt));
}

flight::Ref<flight::types::PathMeshTyped> tessellate_path_typed(flight::Ref<flight::types::Path> path, bool tolerancePresent, double tolerance) {
  return flight::path::tessellate_path_typed(path, (tolerancePresent ? std::optional<double>{tolerance} : std::nullopt));
}

void tessellate_path_typed_into(flight::Ref<flight::types::Path> path, flight::Ref<flight::types::PathMeshTyped> out, bool tolerancePresent, double tolerance) {
  flight::path::tessellate_path_typed_into(path, out, (tolerancePresent ? std::optional<double>{tolerance} : std::nullopt));
}

void translate_path(flight::Ref<flight::types::Path> source, double dx, double dy, flight::Ref<flight::types::Path> out) {
  flight::path::translate_path(source, dx, dy, out);
}

} // namespace flight_hx::path
