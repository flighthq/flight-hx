package flight;

#if hl

typedef Path = flight._hl.Path;

#elseif cpp

typedef Path = flight._cpp.Path;

#elseif (js && flight_esm)

typedef Path = flight._js.Path;

#elseif js

#error "flight.Path on js requires flight_esm."

#else

#error "flight.Path: no backend for this target."

#end

#if (js && flight_esm)
extern inline function cleanPath(source:Path, tolerance:Float, out:Path, flattenTolerance:Null<Float>):Void {
	flight._js._fn.Path.cleanPath(source, tolerance, out, flattenTolerance);
}
#else
extern inline function cleanPath(source:Path, tolerance:Float, out:Path, flattenTolerance:Float):Void {
#if hl
	flight._hl._fn.Path.cleanPath(source, tolerance, out, flattenTolerance);
#elseif cpp
	flight._cpp._fn.Path.cleanPath(source, tolerance, out, flattenTolerance);
#elseif (js && flight_esm)
	flight._js._fn.Path.cleanPath(source, tolerance, out, flattenTolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function containsPathPoint(path:Path, px:Float, py:Float, tolerance:Null<Float>):Bool {
	return flight._js._fn.Path.containsPathPoint(path, px, py, tolerance);
}
#else
extern inline function containsPathPoint(path:Path, px:Float, py:Float, tolerance:Float):Bool {
#if hl
	return flight._hl._fn.Path.containsPathPoint(path, px, py, tolerance);
#elseif cpp
	return flight._cpp._fn.Path.containsPathPoint(path, px, py, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Path.containsPathPoint(path, px, py, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clonePath(source:Path):Path {
	return flight._js._fn.Path.clonePath(source);
}
#else
extern inline function clonePath(source:Path):Path {
#if hl
	return flight._hl._fn.Path.clonePath(source);
#elseif cpp
	return flight._cpp._fn.Path.clonePath(source);
#elseif (js && flight_esm)
	return flight._js._fn.Path.clonePath(source);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function copyPath(out:Path, source:Path):Void {
	flight._js._fn.Path.copyPath(out, source);
}
#else
extern inline function copyPath(out:Path, source:Path):Void {
#if hl
	flight._hl._fn.Path.copyPath(out, source);
#elseif cpp
	flight._cpp._fn.Path.copyPath(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Path.copyPath(out, source);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dashPath(source:Path, dash:Dynamic, dashOffset:Float, out:Path, tolerance:Null<Float>):Void {
	flight._js._fn.Path.dashPath(source, dash, dashOffset, out, tolerance);
}
#else
extern inline function dashPath(source:Path, dash:Dynamic, dashLen:Int, dashOffset:Float, out:Path, tolerance:Float):Void {
#if hl
	flight._hl._fn.Path.dashPath(source, dash, dashLen, dashOffset, out, tolerance);
#elseif cpp
	flight._cpp._fn.Path.dashPath(source, dash, dashLen, dashOffset, out, tolerance);
#elseif (js && flight_esm)
	flight._js._fn.Path.dashPath(source, dash, dashLen, dashOffset, out, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function decimatePath(source:Path, tolerance:Float, out:Path, flattenTolerance:Null<Float>):Void {
	flight._js._fn.Path.decimatePath(source, tolerance, out, flattenTolerance);
}
#else
extern inline function decimatePath(source:Path, tolerance:Float, out:Path, flattenTolerance:Float):Void {
#if hl
	flight._hl._fn.Path.decimatePath(source, tolerance, out, flattenTolerance);
#elseif cpp
	flight._cpp._fn.Path.decimatePath(source, tolerance, out, flattenTolerance);
#elseif (js && flight_esm)
	flight._js._fn.Path.decimatePath(source, tolerance, out, flattenTolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainPathMorphCreation(start:Path, end:Path):PathMorphCreationExplanation {
	return flight._js._fn.Path.explainPathMorphCreation(start, end);
}
#else
extern inline function explainPathMorphCreation(start:Path, end:Path):PathMorphCreationExplanation {
#if hl
	return flight._hl._fn.Path.explainPathMorphCreation(start, end);
#elseif cpp
	return flight._cpp._fn.Path.explainPathMorphCreation(start, end);
#elseif (js && flight_esm)
	return flight._js._fn.Path.explainPathMorphCreation(start, end);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainStrokePathTessellation(path:Path, style:StrokeStyle, tolerance:Null<Float>):StrokePathTessellationExplanation {
	return flight._js._fn.Path.explainStrokePathTessellation(path, style, tolerance);
}
#else
extern inline function explainStrokePathTessellation(path:Path, style:StrokeStyle, tolerance:Float):StrokePathTessellationExplanation {
#if hl
	return flight._hl._fn.Path.explainStrokePathTessellation(path, style, tolerance);
#elseif cpp
	return flight._cpp._fn.Path.explainStrokePathTessellation(path, style, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Path.explainStrokePathTessellation(path, style, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function fitPathCurves(source:Path, tolerance:Float, out:Path, flattenTolerance:Null<Float>):Void {
	flight._js._fn.Path.fitPathCurves(source, tolerance, out, flattenTolerance);
}
#else
extern inline function fitPathCurves(source:Path, tolerance:Float, out:Path, flattenTolerance:Float):Void {
#if hl
	flight._hl._fn.Path.fitPathCurves(source, tolerance, out, flattenTolerance);
#elseif cpp
	flight._cpp._fn.Path.fitPathCurves(source, tolerance, out, flattenTolerance);
#elseif (js && flight_esm)
	flight._js._fn.Path.fitPathCurves(source, tolerance, out, flattenTolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathContourLengths(path:Path, tolerance:Null<Float>):Dynamic {
	return flight._js._fn.Path.getPathContourLengths(path, tolerance);
}
#else
extern inline function getPathContourLengths(path:Path, tolerance:Float):Dynamic {
#if hl
	return flight._hl._fn.Path.getPathContourLengths(path, tolerance);
#elseif cpp
	return flight._cpp._fn.Path.getPathContourLengths(path, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Path.getPathContourLengths(path, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathCurvatureAtDistance(path:Path, distance:Float, tolerance:Null<Float>):Float {
	return flight._js._fn.Path.getPathCurvatureAtDistance(path, distance, tolerance);
}
#else
extern inline function getPathCurvatureAtDistance(path:Path, distance:Float, tolerance:Float):Float {
#if hl
	return flight._hl._fn.Path.getPathCurvatureAtDistance(path, distance, tolerance);
#elseif cpp
	return flight._cpp._fn.Path.getPathCurvatureAtDistance(path, distance, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Path.getPathCurvatureAtDistance(path, distance, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathLength(path:Path, tolerance:Null<Float>):Float {
	return flight._js._fn.Path.getPathLength(path, tolerance);
}
#else
extern inline function getPathLength(path:Path, tolerance:Float):Float {
#if hl
	return flight._hl._fn.Path.getPathLength(path, tolerance);
#elseif cpp
	return flight._cpp._fn.Path.getPathLength(path, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Path.getPathLength(path, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathNearestPoint(path:Path, px:Float, py:Float, out:Vector2, tolerance:Null<Float>):Float {
	return flight._js._fn.Path.getPathNearestPoint(path, px, py, out, tolerance);
}
#else
extern inline function getPathNearestPoint(path:Path, px:Float, py:Float, out:Vector2, tolerance:Float):Float {
#if hl
	return flight._hl._fn.Path.getPathNearestPoint(path, px, py, out, tolerance);
#elseif cpp
	return flight._cpp._fn.Path.getPathNearestPoint(path, px, py, out, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Path.getPathNearestPoint(path, px, py, out, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathPointAtDistance(path:Path, distance:Float, out:Vector2, tolerance:Null<Float>):Bool {
	return flight._js._fn.Path.getPathPointAtDistance(path, distance, out, tolerance);
}
#else
extern inline function getPathPointAtDistance(path:Path, distance:Float, out:Vector2, tolerance:Float):Bool {
#if hl
	return flight._hl._fn.Path.getPathPointAtDistance(path, distance, out, tolerance);
#elseif cpp
	return flight._cpp._fn.Path.getPathPointAtDistance(path, distance, out, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Path.getPathPointAtDistance(path, distance, out, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathPositionAtDistance(path:Path, distance:Float, pointOut:Vector2, tangentOut:Vector2, tolerance:Null<Float>):Bool {
	return flight._js._fn.Path.getPathPositionAtDistance(path, distance, pointOut, tangentOut, tolerance);
}
#else
extern inline function getPathPositionAtDistance(path:Path, distance:Float, pointOut:Vector2, tangentOut:Vector2, tolerance:Float):Bool {
#if hl
	return flight._hl._fn.Path.getPathPositionAtDistance(path, distance, pointOut, tangentOut, tolerance);
#elseif cpp
	return flight._cpp._fn.Path.getPathPositionAtDistance(path, distance, pointOut, tangentOut, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Path.getPathPositionAtDistance(path, distance, pointOut, tangentOut, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathTangentAtDistance(path:Path, distance:Float, out:Vector2, tolerance:Null<Float>):Bool {
	return flight._js._fn.Path.getPathTangentAtDistance(path, distance, out, tolerance);
}
#else
extern inline function getPathTangentAtDistance(path:Path, distance:Float, out:Vector2, tolerance:Float):Bool {
#if hl
	return flight._hl._fn.Path.getPathTangentAtDistance(path, distance, out, tolerance);
#elseif cpp
	return flight._cpp._fn.Path.getPathTangentAtDistance(path, distance, out, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Path.getPathTangentAtDistance(path, distance, out, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getCubicBezierCurvature(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float):Float {
	return flight._js._fn.Path.getCubicBezierCurvature(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t);
}
#else
extern inline function getCubicBezierCurvature(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float):Float {
#if hl
	return flight._hl._fn.Path.getCubicBezierCurvature(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t);
#elseif cpp
	return flight._cpp._fn.Path.getCubicBezierCurvature(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t);
#elseif (js && flight_esm)
	return flight._js._fn.Path.getCubicBezierCurvature(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getCubicBezierPoint(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float, out:Vector2):Void {
	flight._js._fn.Path.getCubicBezierPoint(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t, out);
}
#else
extern inline function getCubicBezierPoint(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float, out:Vector2):Void {
#if hl
	flight._hl._fn.Path.getCubicBezierPoint(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t, out);
#elseif cpp
	flight._cpp._fn.Path.getCubicBezierPoint(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t, out);
#elseif (js && flight_esm)
	flight._js._fn.Path.getCubicBezierPoint(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t, out);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getCubicBezierTangent(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float, out:Vector2):Void {
	flight._js._fn.Path.getCubicBezierTangent(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t, out);
}
#else
extern inline function getCubicBezierTangent(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float, out:Vector2):Void {
#if hl
	flight._hl._fn.Path.getCubicBezierTangent(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t, out);
#elseif cpp
	flight._cpp._fn.Path.getCubicBezierTangent(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t, out);
#elseif (js && flight_esm)
	flight._js._fn.Path.getCubicBezierTangent(x0, y0, c1x, c1y, c2x, c2y, x1, y1, t, out);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathSegmentCurvatureAtParameter(path:Path, segmentIndex:Int, t:Float):Null<Float> {
	return flight._js._fn.Path.getPathSegmentCurvatureAtParameter(path, segmentIndex, t);
}
#else
extern inline function getPathSegmentCurvatureAtParameter(path:Path, segmentIndex:Int, t:Float):Float {
#if hl
	return flight._hl._fn.Path.getPathSegmentCurvatureAtParameter(path, segmentIndex, t);
#elseif cpp
	return flight._cpp._fn.Path.getPathSegmentCurvatureAtParameter(path, segmentIndex, t);
#elseif (js && flight_esm)
	return flight._js._fn.Path.getPathSegmentCurvatureAtParameter(path, segmentIndex, t);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathSegmentPointAtParameter(path:Path, segmentIndex:Int, t:Float, out:Vector2):Bool {
	return flight._js._fn.Path.getPathSegmentPointAtParameter(path, segmentIndex, t, out);
}
#else
extern inline function getPathSegmentPointAtParameter(path:Path, segmentIndex:Int, t:Float, out:Vector2):Bool {
#if hl
	return flight._hl._fn.Path.getPathSegmentPointAtParameter(path, segmentIndex, t, out);
#elseif cpp
	return flight._cpp._fn.Path.getPathSegmentPointAtParameter(path, segmentIndex, t, out);
#elseif (js && flight_esm)
	return flight._js._fn.Path.getPathSegmentPointAtParameter(path, segmentIndex, t, out);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathSegmentTangentAtParameter(path:Path, segmentIndex:Int, t:Float, out:Vector2):Bool {
	return flight._js._fn.Path.getPathSegmentTangentAtParameter(path, segmentIndex, t, out);
}
#else
extern inline function getPathSegmentTangentAtParameter(path:Path, segmentIndex:Int, t:Float, out:Vector2):Bool {
#if hl
	return flight._hl._fn.Path.getPathSegmentTangentAtParameter(path, segmentIndex, t, out);
#elseif cpp
	return flight._cpp._fn.Path.getPathSegmentTangentAtParameter(path, segmentIndex, t, out);
#elseif (js && flight_esm)
	return flight._js._fn.Path.getPathSegmentTangentAtParameter(path, segmentIndex, t, out);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getQuadraticBezierCurvature(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float):Float {
	return flight._js._fn.Path.getQuadraticBezierCurvature(x0, y0, cx, cy, x1, y1, t);
}
#else
extern inline function getQuadraticBezierCurvature(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float):Float {
#if hl
	return flight._hl._fn.Path.getQuadraticBezierCurvature(x0, y0, cx, cy, x1, y1, t);
#elseif cpp
	return flight._cpp._fn.Path.getQuadraticBezierCurvature(x0, y0, cx, cy, x1, y1, t);
#elseif (js && flight_esm)
	return flight._js._fn.Path.getQuadraticBezierCurvature(x0, y0, cx, cy, x1, y1, t);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getQuadraticBezierPoint(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float, out:Vector2):Void {
	flight._js._fn.Path.getQuadraticBezierPoint(x0, y0, cx, cy, x1, y1, t, out);
}
#else
extern inline function getQuadraticBezierPoint(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float, out:Vector2):Void {
#if hl
	flight._hl._fn.Path.getQuadraticBezierPoint(x0, y0, cx, cy, x1, y1, t, out);
#elseif cpp
	flight._cpp._fn.Path.getQuadraticBezierPoint(x0, y0, cx, cy, x1, y1, t, out);
#elseif (js && flight_esm)
	flight._js._fn.Path.getQuadraticBezierPoint(x0, y0, cx, cy, x1, y1, t, out);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getQuadraticBezierTangent(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float, out:Vector2):Void {
	flight._js._fn.Path.getQuadraticBezierTangent(x0, y0, cx, cy, x1, y1, t, out);
}
#else
extern inline function getQuadraticBezierTangent(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float, out:Vector2):Void {
#if hl
	flight._hl._fn.Path.getQuadraticBezierTangent(x0, y0, cx, cy, x1, y1, t, out);
#elseif cpp
	flight._cpp._fn.Path.getQuadraticBezierTangent(x0, y0, cx, cy, x1, y1, t, out);
#elseif (js && flight_esm)
	flight._js._fn.Path.getQuadraticBezierTangent(x0, y0, cx, cy, x1, y1, t, out);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathContourOrientation(path:Path, tolerance:Null<Float>):Dynamic {
	return flight._js._fn.Path.getPathContourOrientation(path, tolerance);
}
#else
extern inline function getPathContourOrientation(path:Path, tolerance:Float):flight.ContourOrientation {
#if hl
	return flight._hl._fn.Path.getPathContourOrientation(path, tolerance);
#elseif cpp
	return flight._cpp._fn.Path.getPathContourOrientation(path, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Path.getPathContourOrientation(path, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPathSignedArea(path:Path, tolerance:Null<Float>):Float {
	return flight._js._fn.Path.getPathSignedArea(path, tolerance);
}
#else
extern inline function getPathSignedArea(path:Path, tolerance:Float):Float {
#if hl
	return flight._hl._fn.Path.getPathSignedArea(path, tolerance);
#elseif cpp
	return flight._cpp._fn.Path.getPathSignedArea(path, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Path.getPathSignedArea(path, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPath(winding:Null<Dynamic>):Path {
	return flight._js._fn.Path.createPath(winding);
}
#else
extern inline function createPath(winding:Int):Path {
#if hl
	return flight._hl._fn.Path.createPath(winding);
#elseif cpp
	return flight._cpp._fn.Path.createPath(winding);
#elseif (js && flight_esm)
	return flight._js._fn.Path.createPath(winding);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendPathArc(path:Path, centerX:Float, centerY:Float, radius:Float, startAngle:Float, endAngle:Float, anticlockwise:Null<Bool>, connectToCurrent:Null<Bool>):Void {
	flight._js._fn.Path.appendPathArc(path, centerX, centerY, radius, startAngle, endAngle, anticlockwise, connectToCurrent);
}
#else
extern inline function appendPathArc(path:Path, centerX:Float, centerY:Float, radius:Float, startAngle:Float, endAngle:Float, anticlockwise:Int, connectToCurrent:Int):Void {
#if hl
	flight._hl._fn.Path.appendPathArc(path, centerX, centerY, radius, startAngle, endAngle, anticlockwise, connectToCurrent);
#elseif cpp
	flight._cpp._fn.Path.appendPathArc(path, centerX, centerY, radius, startAngle, endAngle, anticlockwise, connectToCurrent);
#elseif (js && flight_esm)
	flight._js._fn.Path.appendPathArc(path, centerX, centerY, radius, startAngle, endAngle, anticlockwise, connectToCurrent);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendPathCircle(path:Path, centerX:Float, centerY:Float, radius:Float):Void {
	flight._js._fn.Path.appendPathCircle(path, centerX, centerY, radius);
}
#else
extern inline function appendPathCircle(path:Path, centerX:Float, centerY:Float, radius:Float):Void {
#if hl
	flight._hl._fn.Path.appendPathCircle(path, centerX, centerY, radius);
#elseif cpp
	flight._cpp._fn.Path.appendPathCircle(path, centerX, centerY, radius);
#elseif (js && flight_esm)
	flight._js._fn.Path.appendPathCircle(path, centerX, centerY, radius);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendPathClose(path:Path):Void {
	flight._js._fn.Path.appendPathClose(path);
}
#else
extern inline function appendPathClose(path:Path):Void {
#if hl
	flight._hl._fn.Path.appendPathClose(path);
#elseif cpp
	flight._cpp._fn.Path.appendPathClose(path);
#elseif (js && flight_esm)
	flight._js._fn.Path.appendPathClose(path);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendPathCubicCurveTo(path:Path, controlX1:Float, controlY1:Float, controlX2:Float, controlY2:Float, x:Float, y:Float):Void {
	flight._js._fn.Path.appendPathCubicCurveTo(path, controlX1, controlY1, controlX2, controlY2, x, y);
}
#else
extern inline function appendPathCubicCurveTo(path:Path, controlX1:Float, controlY1:Float, controlX2:Float, controlY2:Float, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Path.appendPathCubicCurveTo(path, controlX1, controlY1, controlX2, controlY2, x, y);
#elseif cpp
	flight._cpp._fn.Path.appendPathCubicCurveTo(path, controlX1, controlY1, controlX2, controlY2, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Path.appendPathCubicCurveTo(path, controlX1, controlY1, controlX2, controlY2, x, y);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendPathEllipse(path:Path, centerX:Float, centerY:Float, radiusX:Float, radiusY:Float):Void {
	flight._js._fn.Path.appendPathEllipse(path, centerX, centerY, radiusX, radiusY);
}
#else
extern inline function appendPathEllipse(path:Path, centerX:Float, centerY:Float, radiusX:Float, radiusY:Float):Void {
#if hl
	flight._hl._fn.Path.appendPathEllipse(path, centerX, centerY, radiusX, radiusY);
#elseif cpp
	flight._cpp._fn.Path.appendPathEllipse(path, centerX, centerY, radiusX, radiusY);
#elseif (js && flight_esm)
	flight._js._fn.Path.appendPathEllipse(path, centerX, centerY, radiusX, radiusY);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendPathEllipticalArcTo(path:Path, radiusX:Float, radiusY:Float, xAxisRotation:Float, largeArc:Bool, sweep:Bool, endX:Float, endY:Float):Void {
	flight._js._fn.Path.appendPathEllipticalArcTo(path, radiusX, radiusY, xAxisRotation, largeArc, sweep, endX, endY);
}
#else
extern inline function appendPathEllipticalArcTo(path:Path, radiusX:Float, radiusY:Float, xAxisRotation:Float, largeArc:Bool, sweep:Bool, endX:Float, endY:Float):Void {
#if hl
	flight._hl._fn.Path.appendPathEllipticalArcTo(path, radiusX, radiusY, xAxisRotation, largeArc, sweep, endX, endY);
#elseif cpp
	flight._cpp._fn.Path.appendPathEllipticalArcTo(path, radiusX, radiusY, xAxisRotation, largeArc, sweep, endX, endY);
#elseif (js && flight_esm)
	flight._js._fn.Path.appendPathEllipticalArcTo(path, radiusX, radiusY, xAxisRotation, largeArc, sweep, endX, endY);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendPathLineTo(path:Path, x:Float, y:Float):Void {
	flight._js._fn.Path.appendPathLineTo(path, x, y);
}
#else
extern inline function appendPathLineTo(path:Path, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Path.appendPathLineTo(path, x, y);
#elseif cpp
	flight._cpp._fn.Path.appendPathLineTo(path, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Path.appendPathLineTo(path, x, y);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendPathMoveTo(path:Path, x:Float, y:Float):Void {
	flight._js._fn.Path.appendPathMoveTo(path, x, y);
}
#else
extern inline function appendPathMoveTo(path:Path, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Path.appendPathMoveTo(path, x, y);
#elseif cpp
	flight._cpp._fn.Path.appendPathMoveTo(path, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Path.appendPathMoveTo(path, x, y);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendPathPolygon(path:Path, points:Dynamic):Void {
	flight._js._fn.Path.appendPathPolygon(path, points);
}
#else
extern inline function appendPathPolygon(path:Path, points:Dynamic, pointsLen:Int):Void {
#if hl
	flight._hl._fn.Path.appendPathPolygon(path, points, pointsLen);
#elseif cpp
	flight._cpp._fn.Path.appendPathPolygon(path, points, pointsLen);
#elseif (js && flight_esm)
	flight._js._fn.Path.appendPathPolygon(path, points, pointsLen);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendPathPolyline(path:Path, points:Dynamic):Void {
	flight._js._fn.Path.appendPathPolyline(path, points);
}
#else
extern inline function appendPathPolyline(path:Path, points:Dynamic, pointsLen:Int):Void {
#if hl
	flight._hl._fn.Path.appendPathPolyline(path, points, pointsLen);
#elseif cpp
	flight._cpp._fn.Path.appendPathPolyline(path, points, pointsLen);
#elseif (js && flight_esm)
	flight._js._fn.Path.appendPathPolyline(path, points, pointsLen);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendPathQuadraticCurveTo(path:Path, controlX:Float, controlY:Float, x:Float, y:Float):Void {
	flight._js._fn.Path.appendPathQuadraticCurveTo(path, controlX, controlY, x, y);
}
#else
extern inline function appendPathQuadraticCurveTo(path:Path, controlX:Float, controlY:Float, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Path.appendPathQuadraticCurveTo(path, controlX, controlY, x, y);
#elseif cpp
	flight._cpp._fn.Path.appendPathQuadraticCurveTo(path, controlX, controlY, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Path.appendPathQuadraticCurveTo(path, controlX, controlY, x, y);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendPathRectangle(path:Path, x:Float, y:Float, width:Float, height:Float):Void {
	flight._js._fn.Path.appendPathRectangle(path, x, y, width, height);
}
#else
extern inline function appendPathRectangle(path:Path, x:Float, y:Float, width:Float, height:Float):Void {
#if hl
	flight._hl._fn.Path.appendPathRectangle(path, x, y, width, height);
#elseif cpp
	flight._cpp._fn.Path.appendPathRectangle(path, x, y, width, height);
#elseif (js && flight_esm)
	flight._js._fn.Path.appendPathRectangle(path, x, y, width, height);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendPathRoundedRectangle(path:Path, x:Float, y:Float, width:Float, height:Float, radius:Float):Void {
	flight._js._fn.Path.appendPathRoundedRectangle(path, x, y, width, height, radius);
}
#else
extern inline function appendPathRoundedRectangle(path:Path, x:Float, y:Float, width:Float, height:Float, radius:Float):Void {
#if hl
	flight._hl._fn.Path.appendPathRoundedRectangle(path, x, y, width, height, radius);
#elseif cpp
	flight._cpp._fn.Path.appendPathRoundedRectangle(path, x, y, width, height, radius);
#elseif (js && flight_esm)
	flight._js._fn.Path.appendPathRoundedRectangle(path, x, y, width, height, radius);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendPathRoundedRectangleWithCornerRadii(path:Path, x:Float, y:Float, width:Float, height:Float, topLeft:Float, topRight:Float, bottomRight:Float, bottomLeft:Float):Void {
	flight._js._fn.Path.appendPathRoundedRectangleWithCornerRadii(path, x, y, width, height, topLeft, topRight, bottomRight, bottomLeft);
}
#else
extern inline function appendPathRoundedRectangleWithCornerRadii(path:Path, x:Float, y:Float, width:Float, height:Float, topLeft:Float, topRight:Float, bottomRight:Float, bottomLeft:Float):Void {
#if hl
	flight._hl._fn.Path.appendPathRoundedRectangleWithCornerRadii(path, x, y, width, height, topLeft, topRight, bottomRight, bottomLeft);
#elseif cpp
	flight._cpp._fn.Path.appendPathRoundedRectangleWithCornerRadii(path, x, y, width, height, topLeft, topRight, bottomRight, bottomLeft);
#elseif (js && flight_esm)
	flight._js._fn.Path.appendPathRoundedRectangleWithCornerRadii(path, x, y, width, height, topLeft, topRight, bottomRight, bottomLeft);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function appendPathTangentArcTo(path:Path, x1:Float, y1:Float, x2:Float, y2:Float, radius:Float):Void {
	flight._js._fn.Path.appendPathTangentArcTo(path, x1, y1, x2, y2, radius);
}
#else
extern inline function appendPathTangentArcTo(path:Path, x1:Float, y1:Float, x2:Float, y2:Float, radius:Float):Void {
#if hl
	flight._hl._fn.Path.appendPathTangentArcTo(path, x1, y1, x2, y2, radius);
#elseif cpp
	flight._cpp._fn.Path.appendPathTangentArcTo(path, x1, y1, x2, y2, radius);
#elseif (js && flight_esm)
	flight._js._fn.Path.appendPathTangentArcTo(path, x1, y1, x2, y2, radius);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPathMorph(start:Path, end:Path):Null<PathMorph> {
	return flight._js._fn.Path.createPathMorph(start, end);
}
#else
extern inline function createPathMorph(start:Path, end:Path):PathMorph {
#if hl
	return flight._hl._fn.Path.createPathMorph(start, end);
#elseif cpp
	return flight._cpp._fn.Path.createPathMorph(start, end);
#elseif (js && flight_esm)
	return flight._js._fn.Path.createPathMorph(start, end);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function samplePathMorph(out:Path, morph:PathMorph, progress:Float):Void {
	flight._js._fn.Path.samplePathMorph(out, morph, progress);
}
#else
extern inline function samplePathMorph(out:Path, morph:PathMorph, progress:Float):Void {
#if hl
	flight._hl._fn.Path.samplePathMorph(out, morph, progress);
#elseif cpp
	flight._cpp._fn.Path.samplePathMorph(out, morph, progress);
#elseif (js && flight_esm)
	flight._js._fn.Path.samplePathMorph(out, morph, progress);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function reversePath(source:Path, out:Path):Void {
	flight._js._fn.Path.reversePath(source, out);
}
#else
extern inline function reversePath(source:Path, out:Path):Void {
#if hl
	flight._hl._fn.Path.reversePath(source, out);
#elseif cpp
	flight._cpp._fn.Path.reversePath(source, out);
#elseif (js && flight_esm)
	flight._js._fn.Path.reversePath(source, out);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function strokePath(path:Path, style:StrokeStyle, tolerance:Null<Float>):Path {
	return flight._js._fn.Path.strokePath(path, style, tolerance);
}
#else
extern inline function strokePath(path:Path, style:StrokeStyle, tolerance:Float):Path {
#if hl
	return flight._hl._fn.Path.strokePath(path, style, tolerance);
#elseif cpp
	return flight._cpp._fn.Path.strokePath(path, style, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Path.strokePath(path, style, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function tessellatePath(path:Path, tolerance:Null<Float>):PathMesh {
	return flight._js._fn.Path.tessellatePath(path, tolerance);
}
#else
extern inline function tessellatePath(path:Path, tolerance:Float):PathMesh {
#if hl
	return flight._hl._fn.Path.tessellatePath(path, tolerance);
#elseif cpp
	return flight._cpp._fn.Path.tessellatePath(path, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Path.tessellatePath(path, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function tessellatePathInto(path:Path, out:PathMesh, tolerance:Null<Float>):Void {
	flight._js._fn.Path.tessellatePathInto(path, out, tolerance);
}
#else
extern inline function tessellatePathInto(path:Path, out:PathMesh, tolerance:Float):Void {
#if hl
	flight._hl._fn.Path.tessellatePathInto(path, out, tolerance);
#elseif cpp
	flight._cpp._fn.Path.tessellatePathInto(path, out, tolerance);
#elseif (js && flight_esm)
	flight._js._fn.Path.tessellatePathInto(path, out, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function tessellatePathTyped(path:Path, tolerance:Null<Float>):PathMeshTyped {
	return flight._js._fn.Path.tessellatePathTyped(path, tolerance);
}
#else
extern inline function tessellatePathTyped(path:Path, tolerance:Float):PathMeshTyped {
#if hl
	return flight._hl._fn.Path.tessellatePathTyped(path, tolerance);
#elseif cpp
	return flight._cpp._fn.Path.tessellatePathTyped(path, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Path.tessellatePathTyped(path, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function tessellatePathTypedInto(path:Path, out:PathMeshTyped, tolerance:Null<Float>):Void {
	flight._js._fn.Path.tessellatePathTypedInto(path, out, tolerance);
}
#else
extern inline function tessellatePathTypedInto(path:Path, out:PathMeshTyped, tolerance:Float):Void {
#if hl
	flight._hl._fn.Path.tessellatePathTypedInto(path, out, tolerance);
#elseif cpp
	flight._cpp._fn.Path.tessellatePathTypedInto(path, out, tolerance);
#elseif (js && flight_esm)
	flight._js._fn.Path.tessellatePathTypedInto(path, out, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function tessellateStrokePath(path:Path, style:StrokeStyle, tolerance:Null<Float>):Null<PathMesh> {
	return flight._js._fn.Path.tessellateStrokePath(path, style, tolerance);
}
#else
extern inline function tessellateStrokePath(path:Path, style:StrokeStyle, tolerance:Float):PathMesh {
#if hl
	return flight._hl._fn.Path.tessellateStrokePath(path, style, tolerance);
#elseif cpp
	return flight._cpp._fn.Path.tessellateStrokePath(path, style, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Path.tessellateStrokePath(path, style, tolerance);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function transformPath(source:Path, matrix:Matrix, out:Path):Void {
	flight._js._fn.Path.transformPath(source, matrix, out);
}
#else
extern inline function transformPath(source:Path, matrix:Matrix, out:Path):Void {
#if hl
	flight._hl._fn.Path.transformPath(source, matrix, out);
#elseif cpp
	flight._cpp._fn.Path.transformPath(source, matrix, out);
#elseif (js && flight_esm)
	flight._js._fn.Path.transformPath(source, matrix, out);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function translatePath(source:Path, dx:Float, dy:Float, out:Path):Void {
	flight._js._fn.Path.translatePath(source, dx, dy, out);
}
#else
extern inline function translatePath(source:Path, dx:Float, dy:Float, out:Path):Void {
#if hl
	flight._hl._fn.Path.translatePath(source, dx, dy, out);
#elseif cpp
	flight._cpp._fn.Path.translatePath(source, dx, dy, out);
#elseif (js && flight_esm)
	flight._js._fn.Path.translatePath(source, dx, dy, out);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePath(ptr:Path):Void {
	flight._js._fn.Path.freePath(ptr);
}
#else
extern inline function freePath(ptr:Path):Void {
#if hl
	flight._hl._fn.Path.freePath(ptr);
#elseif cpp
	flight._cpp._fn.Path.freePath(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Path.freePath(ptr);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePathMorphCreationExplanation(ptr:PathMorphCreationExplanation):Void {
	flight._js._fn.Path.freePathMorphCreationExplanation(ptr);
}
#else
extern inline function freePathMorphCreationExplanation(ptr:PathMorphCreationExplanation):Void {
#if hl
	flight._hl._fn.Path.freePathMorphCreationExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Path.freePathMorphCreationExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Path.freePathMorphCreationExplanation(ptr);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStrokePathTessellationExplanation(ptr:StrokePathTessellationExplanation):Void {
	flight._js._fn.Path.freeStrokePathTessellationExplanation(ptr);
}
#else
extern inline function freeStrokePathTessellationExplanation(ptr:StrokePathTessellationExplanation):Void {
#if hl
	flight._hl._fn.Path.freeStrokePathTessellationExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Path.freeStrokePathTessellationExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Path.freeStrokePathTessellationExplanation(ptr);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePathMorph(ptr:PathMorph):Void {
	flight._js._fn.Path.freePathMorph(ptr);
}
#else
extern inline function freePathMorph(ptr:PathMorph):Void {
#if hl
	flight._hl._fn.Path.freePathMorph(ptr);
#elseif cpp
	flight._cpp._fn.Path.freePathMorph(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Path.freePathMorph(ptr);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePathMesh(ptr:PathMesh):Void {
	flight._js._fn.Path.freePathMesh(ptr);
}
#else
extern inline function freePathMesh(ptr:PathMesh):Void {
#if hl
	flight._hl._fn.Path.freePathMesh(ptr);
#elseif cpp
	flight._cpp._fn.Path.freePathMesh(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Path.freePathMesh(ptr);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePathMeshTyped(ptr:PathMeshTyped):Void {
	flight._js._fn.Path.freePathMeshTyped(ptr);
}
#else
extern inline function freePathMeshTyped(ptr:PathMeshTyped):Void {
#if hl
	flight._hl._fn.Path.freePathMeshTyped(ptr);
#elseif cpp
	flight._cpp._fn.Path.freePathMeshTyped(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Path.freePathMeshTyped(ptr);
#else
	#error "flight.Path: no backend for this target."
#end
}
#end
