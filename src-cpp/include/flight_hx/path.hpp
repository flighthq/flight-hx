// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::path {

double get_cubic_bezier_curvature(double x0, double y0, double c1x, double c1y, double c2x, double c2y, double x1, double y1, double t);
double get_quadratic_bezier_curvature(double x0, double y0, double cx, double cy, double x1, double y1, double t);
flight::Ref<flight::types::PathMesh> acquire_path_mesh(flight::Ref<flight::types::Path> path, bool tolerancePresent, double tolerance);
flight::Ref<flight::types::PathMeshTyped> acquire_path_mesh_typed(flight::Ref<flight::types::Path> path, bool tolerancePresent, double tolerance);
void append_path_arc(flight::Ref<flight::types::Path> path, double centerX, double centerY, double radius, double startAngle, double endAngle, bool anticlockwisePresent, bool anticlockwise, bool connectToCurrentPresent, bool connectToCurrent);
void append_path_circle(flight::Ref<flight::types::Path> path, double centerX, double centerY, double radius);
void append_path_close(flight::Ref<flight::types::Path> path);
void append_path_cubic_curve_to(flight::Ref<flight::types::Path> path, double controlX1, double controlY1, double controlX2, double controlY2, double x, double y);
void append_path_ellipse(flight::Ref<flight::types::Path> path, double centerX, double centerY, double radiusX, double radiusY);
void append_path_elliptical_arc_to(flight::Ref<flight::types::Path> path, double radiusX, double radiusY, double xAxisRotation, bool largeArc, bool sweep, double endX, double endY);
void append_path_line_to(flight::Ref<flight::types::Path> path, double x, double y);
void append_path_move_to(flight::Ref<flight::types::Path> path, double x, double y);
void append_path_quadratic_curve_to(flight::Ref<flight::types::Path> path, double controlX, double controlY, double x, double y);
void append_path_rectangle(flight::Ref<flight::types::Path> path, double x, double y, double width, double height);
void append_path_rounded_rectangle(flight::Ref<flight::types::Path> path, double x, double y, double width, double height, double radius);
void append_path_rounded_rectangle_with_corner_radii(flight::Ref<flight::types::Path> path, double x, double y, double width, double height, double topLeft, double topRight, double bottomRight, double bottomLeft);
void append_path_tangent_arc_to(flight::Ref<flight::types::Path> path, double x1, double y1, double x2, double y2, double radius);
void clean_path(flight::Ref<flight::types::Path> source, double tolerance, flight::Ref<flight::types::Path> out, bool flattenTolerancePresent, double flattenTolerance);
flight::Ref<flight::types::Path> clone_path(flight::Ref<flight::types::Path> source);
bool contains_path_point(flight::Ref<flight::types::Path> path, double px, double py, bool tolerancePresent, double tolerance);
flight::Ref<flight::types::Path> copy_path(flight::Ref<flight::types::Path> source, flight::Ref<flight::types::Path> out);
void decimate_path(flight::Ref<flight::types::Path> source, double tolerance, flight::Ref<flight::types::Path> out, bool flattenTolerancePresent, double flattenTolerance);
void fit_path_curves(flight::Ref<flight::types::Path> source, double tolerance, flight::Ref<flight::types::Path> out, bool flattenTolerancePresent, double flattenTolerance);
double get_path_curvature_at_distance(flight::Ref<flight::types::Path> path, double distance, bool tolerancePresent, double tolerance);
double get_path_length(flight::Ref<flight::types::Path> path, bool tolerancePresent, double tolerance);
::hx::Null<double> get_path_segment_curvature_at_parameter(flight::Ref<flight::types::Path> path, double segmentIndex, double t);
double get_path_signed_area(flight::Ref<flight::types::Path> path, bool tolerancePresent, double tolerance);
void release_path_mesh(flight::Ref<flight::types::PathMesh> mesh);
void release_path_mesh_typed(flight::Ref<flight::types::PathMeshTyped> mesh);
void reverse_path(flight::Ref<flight::types::Path> source, flight::Ref<flight::types::Path> out);
flight::Ref<flight::types::PathMesh> tessellate_path(flight::Ref<flight::types::Path> path, bool tolerancePresent, double tolerance);
void tessellate_path_into(flight::Ref<flight::types::Path> path, flight::Ref<flight::types::PathMesh> out, bool tolerancePresent, double tolerance);
flight::Ref<flight::types::PathMeshTyped> tessellate_path_typed(flight::Ref<flight::types::Path> path, bool tolerancePresent, double tolerance);
void tessellate_path_typed_into(flight::Ref<flight::types::Path> path, flight::Ref<flight::types::PathMeshTyped> out, bool tolerancePresent, double tolerance);
void translate_path(flight::Ref<flight::types::Path> source, double dx, double dy, flight::Ref<flight::types::Path> out);
double get_path_morph_issue_contour_closedness_mismatch();
double get_path_morph_issue_contour_count_mismatch();
double get_path_morph_issue_contour_orientation_mismatch();
double get_path_morph_issue_none();
double get_path_morph_issue_winding_mismatch();
double get_stroke_path_tessellation_issue_invalid_path();
double get_stroke_path_tessellation_issue_invalid_style();
double get_stroke_path_tessellation_issue_none();
double get_stroke_path_tessellation_issue_reversing_join();
double get_stroke_path_tessellation_issue_self_intersecting_centerline();
double get_stroke_path_tessellation_issue_self_intersecting_outline();

} // namespace flight_hx::path
