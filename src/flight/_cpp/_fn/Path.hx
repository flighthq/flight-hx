// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._fn;

#if cpp
import flight.*;
@:buildXml('
<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />
<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />
<set name="NO_PRECOMPILED_HEADERS" value="1" />
<set name="HXCPP_NO_CPP11" value="1" />
<unset name="HXCPP_CPP11" />
<files id="haxe">
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/path.cpp" />
  <compilerflag value="/std:c++20" if="windows" />
  <compilerflag value="-std=c++20" unless="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/overrides/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/generated/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_hx_root}/src-cpp/include" if="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/overrides/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/generated/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_hx_root}/src-cpp/include" unless="windows" />
</files>
')
@:include("flight_hx/path.hpp")
extern class Path {
  @:native("flight_hx::path::get_cubic_bezier_curvature")
  static function getCubicBezierCurvature(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float):Float;

  @:native("flight_hx::path::get_quadratic_bezier_curvature")
  static function getQuadraticBezierCurvature(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float):Float;

  @:native("flight_hx::path::acquire_path_mesh")
  static function acquirePathMesh(path:flight.Path, tolerancePresent:Bool, tolerance:Float):flight.PathMesh;

  @:native("flight_hx::path::acquire_path_mesh_typed")
  static function acquirePathMeshTyped(path:flight.Path, tolerancePresent:Bool, tolerance:Float):flight.PathMeshTyped;

  @:native("flight_hx::path::append_path_arc")
  static function appendPathArc(path:flight.Path, centerX:Float, centerY:Float, radius:Float, startAngle:Float, endAngle:Float, anticlockwisePresent:Bool, anticlockwise:Bool, connectToCurrentPresent:Bool, connectToCurrent:Bool):Void;

  @:native("flight_hx::path::append_path_circle")
  static function appendPathCircle(path:flight.Path, centerX:Float, centerY:Float, radius:Float):Void;

  @:native("flight_hx::path::append_path_close")
  static function appendPathClose(path:flight.Path):Void;

  @:native("flight_hx::path::append_path_cubic_curve_to")
  static function appendPathCubicCurveTo(path:flight.Path, controlX1:Float, controlY1:Float, controlX2:Float, controlY2:Float, x:Float, y:Float):Void;

  @:native("flight_hx::path::append_path_ellipse")
  static function appendPathEllipse(path:flight.Path, centerX:Float, centerY:Float, radiusX:Float, radiusY:Float):Void;

  @:native("flight_hx::path::append_path_elliptical_arc_to")
  static function appendPathEllipticalArcTo(path:flight.Path, radiusX:Float, radiusY:Float, xAxisRotation:Float, largeArc:Bool, sweep:Bool, endX:Float, endY:Float):Void;

  @:native("flight_hx::path::append_path_line_to")
  static function appendPathLineTo(path:flight.Path, x:Float, y:Float):Void;

  @:native("flight_hx::path::append_path_move_to")
  static function appendPathMoveTo(path:flight.Path, x:Float, y:Float):Void;

  @:native("flight_hx::path::append_path_quadratic_curve_to")
  static function appendPathQuadraticCurveTo(path:flight.Path, controlX:Float, controlY:Float, x:Float, y:Float):Void;

  @:native("flight_hx::path::append_path_rectangle")
  static function appendPathRectangle(path:flight.Path, x:Float, y:Float, width:Float, height:Float):Void;

  @:native("flight_hx::path::append_path_rounded_rectangle")
  static function appendPathRoundedRectangle(path:flight.Path, x:Float, y:Float, width:Float, height:Float, radius:Float):Void;

  @:native("flight_hx::path::append_path_rounded_rectangle_with_corner_radii")
  static function appendPathRoundedRectangleWithCornerRadii(path:flight.Path, x:Float, y:Float, width:Float, height:Float, topLeft:Float, topRight:Float, bottomRight:Float, bottomLeft:Float):Void;

  @:native("flight_hx::path::append_path_tangent_arc_to")
  static function appendPathTangentArcTo(path:flight.Path, x1:Float, y1:Float, x2:Float, y2:Float, radius:Float):Void;

  @:native("flight_hx::path::clean_path")
  static function cleanPath(source:flight.Path, tolerance:Float, out:flight.Path, flattenTolerancePresent:Bool, flattenTolerance:Float):Void;

  @:native("flight_hx::path::clone_path")
  static function clonePath(source:flight.Path):flight.Path;

  @:native("flight_hx::path::contains_path_point")
  static function containsPathPoint(path:flight.Path, px:Float, py:Float, tolerancePresent:Bool, tolerance:Float):Bool;

  @:native("flight_hx::path::copy_path")
  static function copyPath(source:flight.Path, out:flight.Path):flight.Path;

  @:native("flight_hx::path::decimate_path")
  static function decimatePath(source:flight.Path, tolerance:Float, out:flight.Path, flattenTolerancePresent:Bool, flattenTolerance:Float):Void;

  @:native("flight_hx::path::fit_path_curves")
  static function fitPathCurves(source:flight.Path, tolerance:Float, out:flight.Path, flattenTolerancePresent:Bool, flattenTolerance:Float):Void;

  @:native("flight_hx::path::get_path_curvature_at_distance")
  static function getPathCurvatureAtDistance(path:flight.Path, distance:Float, tolerancePresent:Bool, tolerance:Float):Float;

  @:native("flight_hx::path::get_path_length")
  static function getPathLength(path:flight.Path, tolerancePresent:Bool, tolerance:Float):Float;

  @:native("flight_hx::path::get_path_segment_curvature_at_parameter")
  static function getPathSegmentCurvatureAtParameter(path:flight.Path, segmentIndex:Float, t:Float):Null<Float>;

  @:native("flight_hx::path::get_path_signed_area")
  static function getPathSignedArea(path:flight.Path, tolerancePresent:Bool, tolerance:Float):Float;

  @:native("flight_hx::path::release_path_mesh")
  static function releasePathMesh(mesh:flight.PathMesh):Void;

  @:native("flight_hx::path::release_path_mesh_typed")
  static function releasePathMeshTyped(mesh:flight.PathMeshTyped):Void;

  @:native("flight_hx::path::reverse_path")
  static function reversePath(source:flight.Path, out:flight.Path):Void;

  @:native("flight_hx::path::tessellate_path")
  static function tessellatePath(path:flight.Path, tolerancePresent:Bool, tolerance:Float):flight.PathMesh;

  @:native("flight_hx::path::tessellate_path_into")
  static function tessellatePathInto(path:flight.Path, out:flight.PathMesh, tolerancePresent:Bool, tolerance:Float):Void;

  @:native("flight_hx::path::tessellate_path_typed")
  static function tessellatePathTyped(path:flight.Path, tolerancePresent:Bool, tolerance:Float):flight.PathMeshTyped;

  @:native("flight_hx::path::tessellate_path_typed_into")
  static function tessellatePathTypedInto(path:flight.Path, out:flight.PathMeshTyped, tolerancePresent:Bool, tolerance:Float):Void;

  @:native("flight_hx::path::translate_path")
  static function translatePath(source:flight.Path, dx:Float, dy:Float, out:flight.Path):Void;
}
#end
