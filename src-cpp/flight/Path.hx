// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

typedef Path = flight._cpp.Path;

inline function getCubicBezierCurvature(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float):Float {
  return flight._cpp._fn.Path.getCubicBezierCurvature(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t);
}

inline function getQuadraticBezierCurvature(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float):Float {
  return flight._cpp._fn.Path.getQuadraticBezierCurvature(x0, y0, cx, cy, x1, y1, t);
}

var PathMorphIssueContourClosednessMismatch(get, set):Float;

private extern inline function get_PathMorphIssueContourClosednessMismatch():Float return flight._cpp._attempt.Attempt_Path_PathMorphIssueContourClosednessMismatch.PathMorphIssueContourClosednessMismatch;

private extern inline function set_PathMorphIssueContourClosednessMismatch(value:Float):Float return flight._cpp._attempt.Attempt_Path_PathMorphIssueContourClosednessMismatch.PathMorphIssueContourClosednessMismatch = value;

var PathMorphIssueContourCountMismatch(get, set):Float;

private extern inline function get_PathMorphIssueContourCountMismatch():Float return flight._cpp._attempt.Attempt_Path_PathMorphIssueContourCountMismatch.PathMorphIssueContourCountMismatch;

private extern inline function set_PathMorphIssueContourCountMismatch(value:Float):Float return flight._cpp._attempt.Attempt_Path_PathMorphIssueContourCountMismatch.PathMorphIssueContourCountMismatch = value;

var PathMorphIssueContourOrientationMismatch(get, set):Float;

private extern inline function get_PathMorphIssueContourOrientationMismatch():Float return flight._cpp._attempt.Attempt_Path_PathMorphIssueContourOrientationMismatch.PathMorphIssueContourOrientationMismatch;

private extern inline function set_PathMorphIssueContourOrientationMismatch(value:Float):Float return flight._cpp._attempt.Attempt_Path_PathMorphIssueContourOrientationMismatch.PathMorphIssueContourOrientationMismatch = value;

var PathMorphIssueNone(get, set):Float;

private extern inline function get_PathMorphIssueNone():Float return flight._cpp._attempt.Attempt_Path_PathMorphIssueNone.PathMorphIssueNone;

private extern inline function set_PathMorphIssueNone(value:Float):Float return flight._cpp._attempt.Attempt_Path_PathMorphIssueNone.PathMorphIssueNone = value;

var PathMorphIssueWindingMismatch(get, set):Float;

private extern inline function get_PathMorphIssueWindingMismatch():Float return flight._cpp._attempt.Attempt_Path_PathMorphIssueWindingMismatch.PathMorphIssueWindingMismatch;

private extern inline function set_PathMorphIssueWindingMismatch(value:Float):Float return flight._cpp._attempt.Attempt_Path_PathMorphIssueWindingMismatch.PathMorphIssueWindingMismatch = value;

var StrokePathTessellationIssueInvalidPath(get, set):Float;

private extern inline function get_StrokePathTessellationIssueInvalidPath():Float return flight._cpp._attempt.Attempt_Path_StrokePathTessellationIssueInvalidPath.StrokePathTessellationIssueInvalidPath;

private extern inline function set_StrokePathTessellationIssueInvalidPath(value:Float):Float return flight._cpp._attempt.Attempt_Path_StrokePathTessellationIssueInvalidPath.StrokePathTessellationIssueInvalidPath = value;

var StrokePathTessellationIssueInvalidStyle(get, set):Float;

private extern inline function get_StrokePathTessellationIssueInvalidStyle():Float return flight._cpp._attempt.Attempt_Path_StrokePathTessellationIssueInvalidStyle.StrokePathTessellationIssueInvalidStyle;

private extern inline function set_StrokePathTessellationIssueInvalidStyle(value:Float):Float return flight._cpp._attempt.Attempt_Path_StrokePathTessellationIssueInvalidStyle.StrokePathTessellationIssueInvalidStyle = value;

var StrokePathTessellationIssueNone(get, set):Float;

private extern inline function get_StrokePathTessellationIssueNone():Float return flight._cpp._attempt.Attempt_Path_StrokePathTessellationIssueNone.StrokePathTessellationIssueNone;

private extern inline function set_StrokePathTessellationIssueNone(value:Float):Float return flight._cpp._attempt.Attempt_Path_StrokePathTessellationIssueNone.StrokePathTessellationIssueNone = value;

var StrokePathTessellationIssueReversingJoin(get, set):Float;

private extern inline function get_StrokePathTessellationIssueReversingJoin():Float return flight._cpp._attempt.Attempt_Path_StrokePathTessellationIssueReversingJoin.StrokePathTessellationIssueReversingJoin;

private extern inline function set_StrokePathTessellationIssueReversingJoin(value:Float):Float return flight._cpp._attempt.Attempt_Path_StrokePathTessellationIssueReversingJoin.StrokePathTessellationIssueReversingJoin = value;

var StrokePathTessellationIssueSelfIntersectingCenterline(get, set):Float;

private extern inline function get_StrokePathTessellationIssueSelfIntersectingCenterline():Float return flight._cpp._attempt.Attempt_Path_StrokePathTessellationIssueSelfIntersectingCenterline.StrokePathTessellationIssueSelfIntersectingCenterline;

private extern inline function set_StrokePathTessellationIssueSelfIntersectingCenterline(value:Float):Float return flight._cpp._attempt.Attempt_Path_StrokePathTessellationIssueSelfIntersectingCenterline.StrokePathTessellationIssueSelfIntersectingCenterline = value;

var StrokePathTessellationIssueSelfIntersectingOutline(get, set):Float;

private extern inline function get_StrokePathTessellationIssueSelfIntersectingOutline():Float return flight._cpp._attempt.Attempt_Path_StrokePathTessellationIssueSelfIntersectingOutline.StrokePathTessellationIssueSelfIntersectingOutline;

private extern inline function set_StrokePathTessellationIssueSelfIntersectingOutline(value:Float):Float return flight._cpp._attempt.Attempt_Path_StrokePathTessellationIssueSelfIntersectingOutline.StrokePathTessellationIssueSelfIntersectingOutline = value;

extern inline function acquirePathMesh(path:flight.Path, ?tolerance:Float):flight.PathMesh {
  return flight._cpp._attempt.Attempt_Path_acquirePathMesh.acquirePathMesh(path, tolerance);
}

extern inline function acquirePathMeshTyped(path:flight.Path, ?tolerance:Float):flight.PathMeshTyped {
  return flight._cpp._attempt.Attempt_Path_acquirePathMeshTyped.acquirePathMeshTyped(path, tolerance);
}

extern inline function appendPathArc(path:flight.Path, centerX:Float, centerY:Float, radius:Float, startAngle:Float, endAngle:Float, ?anticlockwise:Bool, ?connectToCurrent:Bool):Void {
  flight._cpp._attempt.Attempt_Path_appendPathArc.appendPathArc(path, centerX, centerY, radius, startAngle, endAngle, anticlockwise, connectToCurrent);
}

extern inline function appendPathCircle(path:flight.Path, centerX:Float, centerY:Float, radius:Float):Void {
  flight._cpp._attempt.Attempt_Path_appendPathCircle.appendPathCircle(path, centerX, centerY, radius);
}

extern inline function appendPathClose(path:flight.Path):Void {
  flight._cpp._attempt.Attempt_Path_appendPathClose.appendPathClose(path);
}

extern inline function appendPathCubicCurveTo(path:flight.Path, controlX1:Float, controlY1:Float, controlX2:Float, controlY2:Float, x:Float, y:Float):Void {
  flight._cpp._attempt.Attempt_Path_appendPathCubicCurveTo.appendPathCubicCurveTo(path, controlX1, controlY1, controlX2, controlY2, x, y);
}

extern inline function appendPathEllipse(path:flight.Path, centerX:Float, centerY:Float, radiusX:Float, radiusY:Float):Void {
  flight._cpp._attempt.Attempt_Path_appendPathEllipse.appendPathEllipse(path, centerX, centerY, radiusX, radiusY);
}

extern inline function appendPathEllipticalArcTo(path:flight.Path, radiusX:Float, radiusY:Float, xAxisRotation:Float, largeArc:Bool, sweep:Bool, endX:Float, endY:Float):Void {
  flight._cpp._attempt.Attempt_Path_appendPathEllipticalArcTo.appendPathEllipticalArcTo(path, radiusX, radiusY, xAxisRotation, largeArc, sweep, endX, endY);
}

extern inline function appendPathLineTo(path:flight.Path, x:Float, y:Float):Void {
  flight._cpp._attempt.Attempt_Path_appendPathLineTo.appendPathLineTo(path, x, y);
}

extern inline function appendPathMoveTo(path:flight.Path, x:Float, y:Float):Void {
  flight._cpp._attempt.Attempt_Path_appendPathMoveTo.appendPathMoveTo(path, x, y);
}

extern inline function appendPathPolygon(path:flight.Path, points:Array<Float>):Void {
  flight._cpp._attempt.Attempt_Path_appendPathPolygon.appendPathPolygon(path, points);
}

extern inline function appendPathPolyline(path:flight.Path, points:Array<Float>):Void {
  flight._cpp._attempt.Attempt_Path_appendPathPolyline.appendPathPolyline(path, points);
}

extern inline function appendPathQuadraticCurveTo(path:flight.Path, controlX:Float, controlY:Float, x:Float, y:Float):Void {
  flight._cpp._attempt.Attempt_Path_appendPathQuadraticCurveTo.appendPathQuadraticCurveTo(path, controlX, controlY, x, y);
}

extern inline function appendPathRectangle(path:flight.Path, x:Float, y:Float, width:Float, height:Float):Void {
  flight._cpp._attempt.Attempt_Path_appendPathRectangle.appendPathRectangle(path, x, y, width, height);
}

extern inline function appendPathRoundedRectangle(path:flight.Path, x:Float, y:Float, width:Float, height:Float, radius:Float):Void {
  flight._cpp._attempt.Attempt_Path_appendPathRoundedRectangle.appendPathRoundedRectangle(path, x, y, width, height, radius);
}

extern inline function appendPathRoundedRectangleWithCornerRadii(path:flight.Path, x:Float, y:Float, width:Float, height:Float, topLeft:Float, topRight:Float, bottomRight:Float, bottomLeft:Float):Void {
  flight._cpp._attempt.Attempt_Path_appendPathRoundedRectangleWithCornerRadii.appendPathRoundedRectangleWithCornerRadii(path, x, y, width, height, topLeft, topRight, bottomRight, bottomLeft);
}

extern inline function appendPathTangentArcTo(path:flight.Path, x1:Float, y1:Float, x2:Float, y2:Float, radius:Float):Void {
  flight._cpp._attempt.Attempt_Path_appendPathTangentArcTo.appendPathTangentArcTo(path, x1, y1, x2, y2, radius);
}

extern inline function buildPathMorph(start:flight.Path, end:flight.Path):{ contour:Null<Float>, issue:Float, morph:Null<flight.PathMorph> } {
  return flight._cpp._attempt.Attempt_Path_buildPathMorph.buildPathMorph(start, end);
}

extern inline function buildStrokePathGeometry(path:flight.Path, style:flight.StrokeStyle, tolerance:Float):{ issue:Dynamic, issueSubpath:Null<Float>, pieces:Array<{ closed:Bool, endCap:Array<Float>, left:Array<Float>, right:Array<Float>, startCap:Array<Float> }> } {
  return flight._cpp._attempt.Attempt_Path_buildStrokePathGeometry.buildStrokePathGeometry(path, style, tolerance);
}

extern inline function cleanPath(source:flight.Path, tolerance:Float, out:flight.Path, ?flattenTolerance:Float):Void {
  flight._cpp._attempt.Attempt_Path_cleanPath.cleanPath(source, tolerance, out, flattenTolerance);
}

extern inline function clonePath(source:flight.Path):flight.Path {
  return flight._cpp._attempt.Attempt_Path_clonePath.clonePath(source);
}

extern inline function containsPathPoint(path:flight.Path, px:Float, py:Float, ?tolerance:Float):Bool {
  return flight._cpp._attempt.Attempt_Path_containsPathPoint.containsPathPoint(path, px, py, tolerance);
}

extern inline function copyPath(source:flight.Path, ?out:flight.Path):flight.Path {
  return flight._cpp._attempt.Attempt_Path_copyPath.copyPath(source, out);
}

extern inline function createPath(?winding:flight.PathWinding):flight.Path {
  return flight._cpp._attempt.Attempt_Path_createPath.createPath(winding);
}

extern inline function createPathMorph(start:flight.Path, end:flight.Path):Null<flight.PathMorph> {
  return flight._cpp._attempt.Attempt_Path_createPathMorph.createPathMorph(start, end);
}

extern inline function dashPath(source:flight.Path, dash:Array<Float>, dashOffset:Float, out:flight.Path, ?tolerance:Float):Void {
  flight._cpp._attempt.Attempt_Path_dashPath.dashPath(source, dash, dashOffset, out, tolerance);
}

extern inline function decimatePath(source:flight.Path, tolerance:Float, out:flight.Path, ?flattenTolerance:Float):Void {
  flight._cpp._attempt.Attempt_Path_decimatePath.decimatePath(source, tolerance, out, flattenTolerance);
}

extern inline function explainPathMorphCreation(start:flight.Path, end:flight.Path):flight.PathMorphCreationExplanation {
  return flight._cpp._attempt.Attempt_Path_explainPathMorphCreation.explainPathMorphCreation(start, end);
}

extern inline function explainStrokePathTessellation(path:flight.Path, style:flight.StrokeStyle, ?tolerance:Float):flight.StrokePathTessellationExplanation {
  return flight._cpp._attempt.Attempt_Path_explainStrokePathTessellation.explainStrokePathTessellation(path, style, tolerance);
}

extern inline function fitPathCurves(source:flight.Path, tolerance:Float, out:flight.Path, ?flattenTolerance:Float):Void {
  flight._cpp._attempt.Attempt_Path_fitPathCurves.fitPathCurves(source, tolerance, out, flattenTolerance);
}

extern inline function flattenPath(path:flight.Path, ?tolerance:Float):Array<Array<Float>> {
  return flight._cpp._attempt.Attempt_Path_flattenPath.flattenPath(path, tolerance);
}

extern inline function forEachPathSegment(path:flight.Path, visitor:(flight.PathSegment)->Void):Void {
  flight._cpp._attempt.Attempt_Path_forEachPathSegment.forEachPathSegment(path, visitor);
}

extern inline function getCubicBezierPoint(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float, out:flight.Vector2Like):flight.Vector2Like {
  return flight._cpp._attempt.Attempt_Path_getCubicBezierPoint.getCubicBezierPoint(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t, out);
}

extern inline function getCubicBezierTangent(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float, out:flight.Vector2Like):flight.Vector2Like {
  return flight._cpp._attempt.Attempt_Path_getCubicBezierTangent.getCubicBezierTangent(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t, out);
}

extern inline function getPathBounds(path:flight.Path, out:flight.RectangleLike):Bool {
  return flight._cpp._attempt.Attempt_Path_getPathBounds.getPathBounds(path, out);
}

extern inline function getPathContourLengths(path:flight.Path, ?tolerance:Float):Array<Float> {
  return flight._cpp._attempt.Attempt_Path_getPathContourLengths.getPathContourLengths(path, tolerance);
}

extern inline function getPathContourOrientation(path:flight.Path, ?tolerance:Float):Dynamic {
  return flight._cpp._attempt.Attempt_Path_getPathContourOrientation.getPathContourOrientation(path, tolerance);
}

extern inline function getPathCurvatureAtDistance(path:flight.Path, distance:Float, ?tolerance:Float):Float {
  return flight._cpp._attempt.Attempt_Path_getPathCurvatureAtDistance.getPathCurvatureAtDistance(path, distance, tolerance);
}

extern inline function getPathLastPoint(path:flight.Path):Null<Array<Float>> {
  return flight._cpp._attempt.Attempt_Path_getPathLastPoint.getPathLastPoint(path);
}

extern inline function getPathLength(path:flight.Path, ?tolerance:Float):Float {
  return flight._cpp._attempt.Attempt_Path_getPathLength.getPathLength(path, tolerance);
}

extern inline function getPathNearestPoint(path:flight.Path, px:Float, py:Float, out:flight.Vector2Like, ?tolerance:Float):Float {
  return flight._cpp._attempt.Attempt_Path_getPathNearestPoint.getPathNearestPoint(path, px, py, out, tolerance);
}

extern inline function getPathPointAtDistance(path:flight.Path, distance:Float, out:flight.Vector2Like, ?tolerance:Float):Bool {
  return flight._cpp._attempt.Attempt_Path_getPathPointAtDistance.getPathPointAtDistance(path, distance, out, tolerance);
}

extern inline function getPathPositionAtDistance(path:flight.Path, distance:Float, pointOut:flight.Vector2Like, tangentOut:flight.Vector2Like, ?tolerance:Float):Bool {
  return flight._cpp._attempt.Attempt_Path_getPathPositionAtDistance.getPathPositionAtDistance(path, distance, pointOut, tangentOut, tolerance);
}

extern inline function getPathSegmentCurvatureAtParameter(path:flight.Path, segmentIndex:Float, t:Float):Null<Float> {
  return flight._cpp._attempt.Attempt_Path_getPathSegmentCurvatureAtParameter.getPathSegmentCurvatureAtParameter(path, segmentIndex, t);
}

extern inline function getPathSegmentPointAtParameter(path:flight.Path, segmentIndex:Float, t:Float, out:flight.Vector2Like):Bool {
  return flight._cpp._attempt.Attempt_Path_getPathSegmentPointAtParameter.getPathSegmentPointAtParameter(path, segmentIndex, t, out);
}

extern inline function getPathSegmentTangentAtParameter(path:flight.Path, segmentIndex:Float, t:Float, out:flight.Vector2Like):Bool {
  return flight._cpp._attempt.Attempt_Path_getPathSegmentTangentAtParameter.getPathSegmentTangentAtParameter(path, segmentIndex, t, out);
}

extern inline function getPathSignedArea(path:flight.Path, ?tolerance:Float):Float {
  return flight._cpp._attempt.Attempt_Path_getPathSignedArea.getPathSignedArea(path, tolerance);
}

extern inline function getPathTangentAtDistance(path:flight.Path, distance:Float, out:flight.Vector2Like, ?tolerance:Float):Bool {
  return flight._cpp._attempt.Attempt_Path_getPathTangentAtDistance.getPathTangentAtDistance(path, distance, out, tolerance);
}

extern inline function getQuadraticBezierPoint(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float, out:flight.Vector2Like):flight.Vector2Like {
  return flight._cpp._attempt.Attempt_Path_getQuadraticBezierPoint.getQuadraticBezierPoint(x0, y0, cx, cy, x1, y1, t, out);
}

extern inline function getQuadraticBezierTangent(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float, out:flight.Vector2Like):flight.Vector2Like {
  return flight._cpp._attempt.Attempt_Path_getQuadraticBezierTangent.getQuadraticBezierTangent(x0, y0, cx, cy, x1, y1, t, out);
}

extern inline function initializePath(out:flight.EntityConstruction<flight.Path>, ?winding:flight.PathWinding):Void {
  flight._cpp._attempt.Attempt_Path_initializePath.initializePath(out, winding);
}

extern inline function initializePathMorph(out:flight.EntityConstruction<flight.PathMorph>, commands:Array<Float>, endData:Array<Float>, startData:Array<Float>, winding:flight.PathWinding):Void {
  flight._cpp._attempt.Attempt_Path_initializePathMorph.initializePathMorph(out, commands, endData, startData, winding);
}

extern inline function releasePathMesh(mesh:flight.PathMesh):Void {
  flight._cpp._attempt.Attempt_Path_releasePathMesh.releasePathMesh(mesh);
}

extern inline function releasePathMeshTyped(mesh:flight.PathMeshTyped):Void {
  flight._cpp._attempt.Attempt_Path_releasePathMeshTyped.releasePathMeshTyped(mesh);
}

extern inline function reversePath(source:flight.Path, out:flight.Path):Void {
  flight._cpp._attempt.Attempt_Path_reversePath.reversePath(source, out);
}

extern inline function samplePathMorph(out:flight.Path, morph:flight.PathMorph, progress:Float):Void {
  flight._cpp._attempt.Attempt_Path_samplePathMorph.samplePathMorph(out, morph, progress);
}

extern inline function strokePath(path:flight.Path, style:flight.StrokeStyle, ?tolerance:Float):flight.Path {
  return flight._cpp._attempt.Attempt_Path_strokePath.strokePath(path, style, tolerance);
}

extern inline function tessellatePath(path:flight.Path, ?tolerance:Float):flight.PathMesh {
  return flight._cpp._attempt.Attempt_Path_tessellatePath.tessellatePath(path, tolerance);
}

extern inline function tessellatePathInto(path:flight.Path, out:flight.PathMesh, ?tolerance:Float):Void {
  flight._cpp._attempt.Attempt_Path_tessellatePathInto.tessellatePathInto(path, out, tolerance);
}

extern inline function tessellatePathTyped(path:flight.Path, ?tolerance:Float):flight.PathMeshTyped {
  return flight._cpp._attempt.Attempt_Path_tessellatePathTyped.tessellatePathTyped(path, tolerance);
}

extern inline function tessellatePathTypedInto(path:flight.Path, out:flight.PathMeshTyped, ?tolerance:Float):Void {
  flight._cpp._attempt.Attempt_Path_tessellatePathTypedInto.tessellatePathTypedInto(path, out, tolerance);
}

extern inline function tessellateStrokePath(path:flight.Path, style:flight.StrokeStyle, ?tolerance:Float):Null<flight.PathMesh> {
  return flight._cpp._attempt.Attempt_Path_tessellateStrokePath.tessellateStrokePath(path, style, tolerance);
}

extern inline function transformPath(source:flight.Path, matrix:flight.MatrixLike, out:flight.Path):Void {
  flight._cpp._attempt.Attempt_Path_transformPath.transformPath(source, matrix, out);
}

extern inline function translatePath(source:flight.Path, dx:Float, dy:Float, out:flight.Path):Void {
  flight._cpp._attempt.Attempt_Path_translatePath.translatePath(source, dx, dy, out);
}
