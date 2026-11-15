package flight._cpp;

abstract Path(cpp.Star<cpp.Void>) {
	inline public function createClipRegionFrom(tolerance:Float):cpp.Star<cpp.Void> {
		return flight._cpp._fn.Clip.createClipRegionFromPath(cast this, tolerance);
	}
	inline public function clean(tolerance:Float, out:flight._cpp.Path, flattenTolerance:Float):Void {
		flight._cpp._fn.Path.cleanPath(cast this, tolerance, out, flattenTolerance);
	}
	inline public function containsPoint(px:Float, py:Float, tolerance:Float):Bool {
		return flight._cpp._fn.Path.containsPathPoint(cast this, px, py, tolerance);
	}
	inline public function clone():flight._cpp.Path {
		return flight._cpp._fn.Path.clonePath(cast this);
	}
	inline public function copy(source:flight._cpp.Path):Void {
		flight._cpp._fn.Path.copyPath(cast this, source);
	}
	inline public function dash(dash:cpp.Star<cpp.Void>, dashLen:Int, dashOffset:Float, out:flight._cpp.Path, tolerance:Float):Void {
		flight._cpp._fn.Path.dashPath(cast this, dash, dashLen, dashOffset, out, tolerance);
	}
	inline public function decimate(tolerance:Float, out:flight._cpp.Path, flattenTolerance:Float):Void {
		flight._cpp._fn.Path.decimatePath(cast this, tolerance, out, flattenTolerance);
	}
	inline public function explainMorphCreation(end:flight._cpp.Path):flight._cpp.PathMorphCreationExplanation {
		return flight._cpp._fn.Path.explainPathMorphCreation(cast this, end);
	}
	inline public function explainStrokeTessellation(style:flight._cpp.StrokeStyle, tolerance:Float):flight._cpp.StrokePathTessellationExplanation {
		return flight._cpp._fn.Path.explainStrokePathTessellation(cast this, style, tolerance);
	}
	inline public function fitCurves(tolerance:Float, out:flight._cpp.Path, flattenTolerance:Float):Void {
		flight._cpp._fn.Path.fitPathCurves(cast this, tolerance, out, flattenTolerance);
	}
	inline public function getContourLengths(tolerance:Float):cpp.Star<cpp.Void> {
		return flight._cpp._fn.Path.getPathContourLengths(cast this, tolerance);
	}
	inline public function getCurvatureAtDistance(distance:Float, tolerance:Float):Float {
		return flight._cpp._fn.Path.getPathCurvatureAtDistance(cast this, distance, tolerance);
	}
	inline public function getLength(tolerance:Float):Float {
		return flight._cpp._fn.Path.getPathLength(cast this, tolerance);
	}
	inline public function getNearestPoint(px:Float, py:Float, out:flight._cpp.Vector2, tolerance:Float):Float {
		return flight._cpp._fn.Path.getPathNearestPoint(cast this, px, py, out, tolerance);
	}
	inline public function getPointAtDistance(distance:Float, out:flight._cpp.Vector2, tolerance:Float):Bool {
		return flight._cpp._fn.Path.getPathPointAtDistance(cast this, distance, out, tolerance);
	}
	inline public function getPositionAtDistance(distance:Float, pointOut:flight._cpp.Vector2, tangentOut:flight._cpp.Vector2, tolerance:Float):Bool {
		return flight._cpp._fn.Path.getPathPositionAtDistance(cast this, distance, pointOut, tangentOut, tolerance);
	}
	inline public function getTangentAtDistance(distance:Float, out:flight._cpp.Vector2, tolerance:Float):Bool {
		return flight._cpp._fn.Path.getPathTangentAtDistance(cast this, distance, out, tolerance);
	}
	inline public function getSegmentCurvatureAtParameter(segmentIndex:Int, t:Float):Float {
		return flight._cpp._fn.Path.getPathSegmentCurvatureAtParameter(cast this, segmentIndex, t);
	}
	inline public function getSegmentPointAtParameter(segmentIndex:Int, t:Float, out:flight._cpp.Vector2):Bool {
		return flight._cpp._fn.Path.getPathSegmentPointAtParameter(cast this, segmentIndex, t, out);
	}
	inline public function getSegmentTangentAtParameter(segmentIndex:Int, t:Float, out:flight._cpp.Vector2):Bool {
		return flight._cpp._fn.Path.getPathSegmentTangentAtParameter(cast this, segmentIndex, t, out);
	}
	inline public function getContourOrientation(tolerance:Float):Int {
		return flight._cpp._fn.Path.getPathContourOrientation(cast this, tolerance);
	}
	inline public function getSignedArea(tolerance:Float):Float {
		return flight._cpp._fn.Path.getPathSignedArea(cast this, tolerance);
	}
	static inline public function create(winding:Int):flight._cpp.Path {
		return flight._cpp._fn.Path.createPath(winding);
	}
	inline public function appendArc(centerX:Float, centerY:Float, radius:Float, startAngle:Float, endAngle:Float, anticlockwise:Int, connectToCurrent:Int):Void {
		flight._cpp._fn.Path.appendPathArc(cast this, centerX, centerY, radius, startAngle, endAngle, anticlockwise, connectToCurrent);
	}
	inline public function appendCircle(centerX:Float, centerY:Float, radius:Float):Void {
		flight._cpp._fn.Path.appendPathCircle(cast this, centerX, centerY, radius);
	}
	inline public function appendClose():Void {
		flight._cpp._fn.Path.appendPathClose(cast this);
	}
	inline public function appendCubicCurveTo(controlX1:Float, controlY1:Float, controlX2:Float, controlY2:Float, x:Float, y:Float):Void {
		flight._cpp._fn.Path.appendPathCubicCurveTo(cast this, controlX1, controlY1, controlX2, controlY2, x, y);
	}
	inline public function appendEllipse(centerX:Float, centerY:Float, radiusX:Float, radiusY:Float):Void {
		flight._cpp._fn.Path.appendPathEllipse(cast this, centerX, centerY, radiusX, radiusY);
	}
	inline public function appendEllipticalArcTo(radiusX:Float, radiusY:Float, xAxisRotation:Float, largeArc:Bool, sweep:Bool, endX:Float, endY:Float):Void {
		flight._cpp._fn.Path.appendPathEllipticalArcTo(cast this, radiusX, radiusY, xAxisRotation, largeArc, sweep, endX, endY);
	}
	inline public function appendLineTo(x:Float, y:Float):Void {
		flight._cpp._fn.Path.appendPathLineTo(cast this, x, y);
	}
	inline public function appendMoveTo(x:Float, y:Float):Void {
		flight._cpp._fn.Path.appendPathMoveTo(cast this, x, y);
	}
	inline public function appendPolygon(points:cpp.Star<cpp.Void>, pointsLen:Int):Void {
		flight._cpp._fn.Path.appendPathPolygon(cast this, points, pointsLen);
	}
	inline public function appendPolyline(points:cpp.Star<cpp.Void>, pointsLen:Int):Void {
		flight._cpp._fn.Path.appendPathPolyline(cast this, points, pointsLen);
	}
	inline public function appendQuadraticCurveTo(controlX:Float, controlY:Float, x:Float, y:Float):Void {
		flight._cpp._fn.Path.appendPathQuadraticCurveTo(cast this, controlX, controlY, x, y);
	}
	inline public function appendRectangle(x:Float, y:Float, width:Float, height:Float):Void {
		flight._cpp._fn.Path.appendPathRectangle(cast this, x, y, width, height);
	}
	inline public function appendRoundedRectangle(x:Float, y:Float, width:Float, height:Float, radius:Float):Void {
		flight._cpp._fn.Path.appendPathRoundedRectangle(cast this, x, y, width, height, radius);
	}
	inline public function appendRoundedRectangleWithCornerRadii(x:Float, y:Float, width:Float, height:Float, topLeft:Float, topRight:Float, bottomRight:Float, bottomLeft:Float):Void {
		flight._cpp._fn.Path.appendPathRoundedRectangleWithCornerRadii(cast this, x, y, width, height, topLeft, topRight, bottomRight, bottomLeft);
	}
	inline public function appendTangentArcTo(x1:Float, y1:Float, x2:Float, y2:Float, radius:Float):Void {
		flight._cpp._fn.Path.appendPathTangentArcTo(cast this, x1, y1, x2, y2, radius);
	}
	inline public function createMorph(end:flight._cpp.Path):flight._cpp.PathMorph {
		return flight._cpp._fn.Path.createPathMorph(cast this, end);
	}
	inline public function sampleMorph(morph:flight._cpp.PathMorph, progress:Float):Void {
		flight._cpp._fn.Path.samplePathMorph(cast this, morph, progress);
	}
	inline public function reverse(out:flight._cpp.Path):Void {
		flight._cpp._fn.Path.reversePath(cast this, out);
	}
	inline public function stroke(style:flight._cpp.StrokeStyle, tolerance:Float):flight._cpp.Path {
		return flight._cpp._fn.Path.strokePath(cast this, style, tolerance);
	}
	inline public function tessellate(tolerance:Float):flight._cpp.PathMesh {
		return flight._cpp._fn.Path.tessellatePath(cast this, tolerance);
	}
	inline public function tessellateInto(out:flight._cpp.PathMesh, tolerance:Float):Void {
		flight._cpp._fn.Path.tessellatePathInto(cast this, out, tolerance);
	}
	inline public function tessellateTyped(tolerance:Float):flight._cpp.PathMeshTyped {
		return flight._cpp._fn.Path.tessellatePathTyped(cast this, tolerance);
	}
	inline public function tessellateTypedInto(out:flight._cpp.PathMeshTyped, tolerance:Float):Void {
		flight._cpp._fn.Path.tessellatePathTypedInto(cast this, out, tolerance);
	}
	inline public function tessellateStroke(style:flight._cpp.StrokeStyle, tolerance:Float):flight._cpp.PathMesh {
		return flight._cpp._fn.Path.tessellateStrokePath(cast this, style, tolerance);
	}
	inline public function transform(matrix:flight._cpp.Matrix, out:flight._cpp.Path):Void {
		flight._cpp._fn.Path.transformPath(cast this, matrix, out);
	}
	inline public function translate(dx:Float, dy:Float, out:flight._cpp.Path):Void {
		flight._cpp._fn.Path.translatePath(cast this, dx, dy, out);
	}
	inline public function free():Void {
		flight._cpp._fn.Path.freePath(cast this);
	}
	inline public function explainOffset(pathBooleanKernel:flight._cpp.PathBooleanKernel, delta:Float, options:flight._cpp.PathOffsetOptions):flight._cpp.PathBooleanExplanation {
		return flight._cpp._fn.PathBoolean.explainOffsetPath(pathBooleanKernel, cast this, delta, options);
	}
	inline public function explainSimplify(pathBooleanKernel:flight._cpp.PathBooleanKernel, options:flight._cpp.PathBooleanOptions):flight._cpp.PathBooleanExplanation {
		return flight._cpp._fn.PathBoolean.explainSimplifyPath(pathBooleanKernel, cast this, options);
	}
	inline public function offset(pathBooleanKernel:flight._cpp.PathBooleanKernel, path:flight._cpp.Path, delta:Float, options:flight._cpp.PathOffsetOptions):Void {
		flight._cpp._fn.PathBoolean.offsetPath(cast this, pathBooleanKernel, path, delta, options);
	}
	inline public function simplify(pathBooleanKernel:flight._cpp.PathBooleanKernel, path:flight._cpp.Path, options:flight._cpp.PathBooleanOptions):Void {
		flight._cpp._fn.PathBoolean.simplifyPath(cast this, pathBooleanKernel, path, options);
	}
	inline public function appendSvgData(d:cpp.ConstCharStar):Bool {
		return flight._cpp._fn.PathFormats.appendSvgPathData(cast this, d);
	}
	inline public function formatSvgData(options:flight._cpp.SvgPathDataFormatOptions):cpp.ConstCharStar {
		return flight._cpp._fn.PathFormats.formatSvgPathData(cast this, options);
	}
	static inline public function createLottieBezier(value:flight._cpp.LottieShapePath):flight._cpp.Path {
		return flight._cpp._fn.Scene2dFormats.createLottieBezierPath(value);
	}
	inline public function compactStroke(path:flight._cpp.Path, style:flight._cpp.StrokeStyle, tolerance:Float):Void {
		flight._cpp._fn.Shape.compactStrokePath(cast this, path, style, tolerance);
	}
}
